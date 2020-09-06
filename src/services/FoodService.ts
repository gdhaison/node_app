import {Service} from "typedi";
import {LwFood} from "../models/LwFood";
import {BaseService} from "./BaseService";
import {OrmRepository} from "typeorm-typedi-extensions";
import {LwFoodRepository} from "../repositories/LwFoodRepository";
import {FoodNotFoundError} from "../api/errors/FoodNotFoundError";

@Service()
export class LwFoodService extends BaseService<LwFood> {
    constructor(@OrmRepository() private lwfoodRepository: LwFoodRepository) {
        super(LwFood);
    }

    public search(name: string, category: string): Promise<LwFood[] | undefined> {
        return this.lwfoodRepository.findByNameAndCategory(name, category);
    }

    public getById(id: number): Promise<LwFood> {
        const food = this.lwfoodRepository.findOne(id);
        if (!food)
            throw new FoodNotFoundError();
        return food;
    }

}
