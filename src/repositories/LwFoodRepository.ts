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
        const result = this.createQueryBuilder("lwFood")/*.leftJoin("lwFood.category", "lwFoodCategory")*/
            .where("lwFood.name like '%" + search_text + "%'");
        // if (category) {
        //     result = result.andWhere(
        //         "lwFoodCategory.code like '%" + category + "%'"
        //     );
        // }
        return result.getMany();
    };

    async getById(id: number): Promise<any> {
        // const data = this.entityManager.query("SELECT lf.name FROM lw_food AS lf WHERE lf.name = $1 AND lf.lastName = $2", ["John", "Doe"]);
        const data = await this.entityManager.query("SELECT lf.id, lf.image, lf.name, lf.calo, lf.total_like as heart, " +
            "lfs.star, lf.description, lfs.star FROM lw_food AS lf left join lw_food_star lfs on lfs.food_id = lf.id WHERE lf.id = $1 ", [id]);
        if (Array.isArray(data) && data.length)
            return data[0];
        throw new FoodNotFoundError(ErrorCode.FOOD_NOT_FOUND);
    }

    async rating(rating: RatingRequest): Promise<any> {
        return this.entityManager.insert(LwFoodStar, {
            foodId: rating.food_id,
            resPartnerId: 1,
            star: rating.star,
            likeFlag: 1
        });
    }
}
