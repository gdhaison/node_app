import {Service} from "typedi";
import {BaseService} from "./BaseService";
import {OrmRepository} from "typeorm-typedi-extensions";
import {LwExercise} from "../models/LwExercise";
import {IPaginationOptions, Pagination} from "nestjs-typeorm-paginate/dist";
import {LwExerciseRepository} from "../repositories/LwExerciseRepository";
import {UserNotFoundError} from "../api/errors/UserNotFoundError";
import {ExerciseNotFoundError} from "../api/errors/ExerciseNotFoundError";
import {ErrorCode} from "../enums/ErrorCode";
import {AreaNotFoundError} from "../api/errors/AreaNotFoundError";

@Service()
export class ExerciseService extends BaseService<LwExercise> {
    constructor(@OrmRepository() private lwExerciseRepository: LwExerciseRepository) {
        super(LwExercise);
    }

    public async getById(id: number): Promise<any> {
        return this.lwExerciseRepository.findOne(id);
    }

    async paginate(options: IPaginationOptions, partnerId: number): Promise<Pagination<LwExercise>> {
        return await this.lwExerciseRepository.paginate(options, partnerId);
    }

    public async putExercise(exerciseId: number, userId: number): Promise<any> {
        const isUserExist = await this.lwExerciseRepository.checkUserExist(userId);
        const isExExist = await this.lwExerciseRepository.checkExerciseExist(exerciseId);

        if (isUserExist == 0) {
            throw new UserNotFoundError();
        }

        if (isExExist == 0) {
            throw new ExerciseNotFoundError(ErrorCode.EXERCISE_NOT_EXIST);
        }
        return this.lwExerciseRepository.putExercise(exerciseId, userId);
    }

    public async getByArea(area: string = "body", page: number = 1, limit: number = 10): Promise<any>{
       const list_area = ["hand", "body", "stomach", "foot"];
       if (list_area.includes(area)){
           return this.lwExerciseRepository.getByArea(area, page, limit);
       }
       throw new AreaNotFoundError("404");
    }

}
