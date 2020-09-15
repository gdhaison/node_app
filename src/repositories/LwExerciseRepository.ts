import {EntityManager, EntityRepository, Repository} from "typeorm";
import {Service} from "typedi";
import {LwFood} from "../models/LwFood";
import {InjectManager} from "typeorm-typedi-extensions";
import {LwExercise} from "../models/LwExercise";
import {ExerciseNotFoundError} from "../api/errors/ExerciseNotFoundError";
import {ErrorCode} from "../enums/ErrorCode";

@Service()
@EntityRepository(LwFood)
export class LwExerciseRepository extends Repository<LwExercise> {

    constructor(@InjectManager() private entityManager: EntityManager) {
        super();
    }

    async getById(id: number): Promise<any> {
        const data = await this.entityManager.query("SELECT le.id, le.image, le.name, le.video FROM lw_exercise AS le WHERE le.id = $1 ", [id]);
        if (Array.isArray(data) && data.length)
            return data[0];
        throw new ExerciseNotFoundError(ErrorCode.FOOD_NOT_FOUND);
    }
}
