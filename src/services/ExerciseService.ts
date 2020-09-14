import {Service} from "typedi";
import {BaseService} from "./BaseService";
import {InjectRepository} from "typeorm-typedi-extensions";
import {LwExercise} from "../models/LwExercise";
import {IPaginationOptions, paginate, Pagination} from "nestjs-typeorm-paginate/dist";
import {Repository} from "typeorm";

@Service()
export class ExerciseService extends BaseService<LwExercise> {
    constructor(@InjectRepository(LwExercise) private readonly repository: Repository<LwExercise>) {
        super(LwExercise);
    }

    public async getById(id: number): Promise<any> {
        return this.repository.findOne(id);
    }

    async paginate(options: IPaginationOptions): Promise<Pagination<LwExercise>> {
        return paginate<LwExercise>(this.repository, options);
    }

    public async search(day: string, page: number, pageSize: number,): Promise<any> {
        // return this.lwExerciseRepository.getById(id);
    }
}
