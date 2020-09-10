import {EntityManager, EntityRepository, Repository, InsertResult} from "typeorm";
import {Service} from "typedi";
import {LwFood} from "../models/LwFood";
import {InjectManager} from "typeorm-typedi-extensions";
import {LwFoodStar} from "../models/LwFoodStar";
import {RatingRequest} from "../models/dto/RatingRequest";

@Service()
@EntityRepository(LwFood)
export class LwFoodRepository extends Repository<LwFood> {

    constructor(@InjectManager() private entityManager: EntityManager) {
        super();
    }


    findByNameAndCategory(search_text: string, category: string): Promise<LwFood[] | undefined> {
        let result = this.createQueryBuilder("lwFood")/*.leftJoin("lwFood.category", "lwFoodCategory")*/
            .where("lwFood.name like '%" + search_text + "%'");
        // if (category) {
        //     result = result.andWhere(
        //         "lwFoodCategory.code like '%" + category + "%'"
        //     );
        // }
        return result.getMany();
    };

    rating(rating: RatingRequest): Promise<InsertResult> {
        return this.entityManager.insert(LwFoodStar, {
            foodId: rating.food_id,
            resPartnerId: 1,
            star: rating.star,
            likeFlag: 1
        });
    }
}
