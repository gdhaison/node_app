import {Service} from "typedi";
import {LwFood} from "../models/LwFood";
import {BaseService} from "./BaseService";
import {OrmRepository} from "typeorm-typedi-extensions";
import {LwFoodRepository} from "../repositories/LwFoodRepository";
import {FoodNotFoundError} from "../api/errors/FoodNotFoundError";
import {FoodCreateRequest} from "../models/dto/FoodCreateRequest";
import {RatingRequest} from "../models/dto/RatingRequest";
import { getManager } from "typeorm"; const entityManager = getManager();

@Service()
export class LwFoodService extends BaseService<LwFood> {
    constructor(@OrmRepository() private lwfoodRepository: LwFoodRepository, ) {
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

    public async rating(rating: RatingRequest): Promise<any> {
        return this.lwfoodRepository.rating(rating);
    }

    public async create(food: Partial<FoodCreateRequest>, image: string): Promise<LwFood> {
        const payload: Partial<LwFood> = {};
        if (food.name) {
            payload.name = food.name;
        }
        if (food.calo) {
            payload.calo = food.calo;
        }
        if (image) {
            payload.image = image;
        }
        if (food.description) {
            payload.description = food.description;
        }
        const now = new Date();
        payload.createDate = now;
        payload.writeDate = now;
        payload.totalLike = 0;
        payload.prepareTime = 0;
        payload.cookingTime = 0;
        return this.lwfoodRepository.save(payload);
    }

}
