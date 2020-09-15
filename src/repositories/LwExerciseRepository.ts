import {EntityManager, EntityRepository, Repository} from "typeorm";
import {Service} from "typedi";
import {InjectManager} from "typeorm-typedi-extensions";
import {LwExercise} from "../models/LwExercise";
import {ExerciseNotFoundError} from "../api/errors/ExerciseNotFoundError";
import {ErrorCode} from "../enums/ErrorCode";
import {IPaginationOptions, paginate, Pagination} from "nestjs-typeorm-paginate";

@Service()
@EntityRepository(LwExercise)
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


    async paginate(options: IPaginationOptions, partnerId: number): Promise<Pagination<LwExercise>> {
        const data = await this.entityManager.query("select lw.id as week_id, lep.exercise_id as exercise_id, lepw.finish_flag as finish_flag from lw_week lw \n" +
            "inner join lw_ex_partner_week lepw on lw.id = lepw.lw_week_id \n" +
            "inner join lw_exercise_partner lep on lep.id = lepw.lw_exercise_partner_id  \n" +
            "where lep.partner_id = $1", [partnerId]);
        // if (Array.isArray(data) && data.length)
        //     return data[0];
        const queryBuilder = this.entityManager.createQueryBuilder(LwExercise, "lwe")
            .select("lwe.id")
            .addSelect("lwe.image")
            .addSelect("lwe.name")
            .where("lwe.id in :ids", {ids: data[0]});
        return paginate<LwExercise>(queryBuilder, options);
    }
}
