import {Service} from "typedi";
import {BaseService} from "./BaseService";
import {OrmRepository} from "typeorm-typedi-extensions";
import {LwExercise} from "../models/LwExercise";
import {IPaginationOptions, Pagination} from "nestjs-typeorm-paginate/dist";
import {LwExerciseRepository} from "../repositories/LwExerciseRepository";

@Service()
export class ExerciseService extends BaseService<LwExercise> {
    constructor(@OrmRepository() private lwExerciseRepository: LwExerciseRepository) {
        super(LwExercise);
    }

    public async getById(id: number): Promise<any> {
        return this.lwExerciseRepository.findOne(id);
    }

    async paginate(options: IPaginationOptions, partnerId: number): Promise<Pagination<LwExercise>> {
        return this.lwExerciseRepository.paginate(options, partnerId);
    }

}
