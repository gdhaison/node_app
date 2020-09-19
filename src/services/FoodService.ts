import {Service} from "typedi";
import {LwFood} from "../models/LwFood";
import {BaseService} from "./BaseService";
import {OrmRepository} from "typeorm-typedi-extensions";
import {LwFoodRepository} from "../repositories/LwFoodRepository";
import {FoodCreateRequest} from "../models/dto/FoodCreateRequest";
import {RatingRequest} from "../models/dto/RatingRequest";

@Service()
export class LwFoodService extends BaseService<LwFood> {
    constructor(@OrmRepository() private lwfoodRepository: LwFoodRepository, ) {
        super(LwFood);
    }

    public search(name: string, category: string, page: number = 1, limit: number = 10, user_id: number):
        Promise<{ total: number; data: any; nextPage: boolean; limit: number; from: number; page: number; to: number }> {
        return this.lwfoodRepository.findByNameAndCategory(name, category, page, limit, user_id);
    }

    public async getById(id: number, partnerId: number): Promise<any> {
        return this.lwfoodRepository.getById(id, partnerId);
    }

    public async rating(rating: RatingRequest, resPartnerId: number): Promise<any> {
        return this.lwfoodRepository.rating(rating, resPartnerId);
    }

    public async like(foodId: number, resPartnerId: number, likeFlag: number) {
        return this.lwfoodRepository.like(foodId, resPartnerId, likeFlag);
    }

    public async changeFood(data: any) {
        const foodCategoryArr: { foodId: number; categoryCode: string }[] = [];
        const foodIds = data.food_ids;
        if (Array.isArray(foodIds) && foodIds.length)
            foodIds.forEach((item: number) => {
                foodCategoryArr.push({foodId: item, categoryCode: data.category_id});
            });
        return this.lwfoodRepository.changeFood(foodCategoryArr);
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

    public getFoodByDate(date: string, menu: string, user_id: number, page: number = 1, limit: number = 10):
        Promise<any> {
        return this.lwfoodRepository.findFoodByDateCategory(date, menu, user_id, page, limit);
    }

    public getOtherFood(category: string, page: number = 1, limit: number = 1, user_id: number): Promise<any>
    {
        return this.lwfoodRepository.findFoodByCategory(category, page, limit, user_id);
    }

    public finishDiet(menuCode: string, dow: string, userId: number): Promise<any>
    {
        return this.lwfoodRepository.finishDiet(menuCode, dow, userId);
    }

}
