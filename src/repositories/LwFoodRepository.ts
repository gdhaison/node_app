import {EntityManager, EntityRepository, Repository} from "typeorm";
import {Service} from "typedi";
import {LwFood} from "../models/LwFood";
import {InjectManager} from "typeorm-typedi-extensions";
import {LwFoodStar} from "../models/LwFoodStar";
import {RatingRequest} from "../models/dto/RatingRequest";
import {FoodNotFoundError} from "../api/errors/FoodNotFoundError";
import {ErrorCode} from "../enums/ErrorCode";
import {types} from "node-sass";
import {LwFoodCategory} from "../models";

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
        const data = await this.entityManager.query("SELECT lf.id, lf.image, lf.name, lf.calo, lf.total_like as heart, " +
            "lfs.star, lf.description, lfs.star FROM lw_food AS lf left join lw_food_star lfs on lfs.food_id = lf.id WHERE lf.id = $1 ", [id]);
        if (Array.isArray(data) && data.length)
            return data[0];
        throw new FoodNotFoundError(ErrorCode.FOOD_NOT_FOUND);
    }

    async rating(rating: RatingRequest, resPartnerId: number): Promise<any> {
        const result = await this.createQueryBuilder()
            .select("lw_food_star")
            .from(LwFoodStar, "lw_food_star")
            .where("lw_food_star.foodId = :food_id", {food_id: rating.food_id})
            .andWhere("lw_food_star.resPartnerId = :partner_id", {partner_id: resPartnerId})
            .getOne();
        if (result) {
            return await this.createQueryBuilder()
                .update(LwFoodStar)
                .set({star: rating.star})
                .where("foodId = :food_id", {food_id: rating.food_id})
                .andWhere("resPartnerId = :partner_id", {partner_id: resPartnerId})
                .execute();
        } else {
            return this.entityManager.save(LwFoodStar, {
                foodId: rating.food_id,
                resPartnerId: resPartnerId,
                star: rating.star
            });
        }
    }

    async like(foodId: number, resPartnerId: number, likeFlag: number): Promise<any> {
        const result = await this.createQueryBuilder()
            .select("lw_food_star")
            .from(LwFoodStar, "lw_food_star")
            .where("lw_food_star.foodId = :food_id", {food_id: foodId})
            .andWhere("lw_food_star.resPartnerId = :partner_id", {partner_id: resPartnerId})
            .getOne();
        if (result) {
            return await this.createQueryBuilder()
                .update(LwFoodStar)
                .set({likeFlag: likeFlag})
                .where("foodId = :food_id", {food_id: foodId})
                .andWhere("resPartnerId = :partner_id", {partner_id: resPartnerId})
                .execute();
        } else {
            return this.entityManager.save(LwFoodStar, {
                foodId: foodId,
                resPartnerId: resPartnerId,
                likeFlag: likeFlag
            });
        }
    }

    async changeFood(data: { foodId: number; categoryId: any }[]): Promise<any> {
        return await this.createQueryBuilder()
            .createQueryBuilder()
            .insert()
            .into(LwFoodCategory)
            .values(data)
            .execute();
    }


    async findFoodByDateCategory(
        date: string,
        category: string,
        user_id: number,
        page: number,
        limit: number):
        Promise<any> {

        const skippedItems = (page - 1) * limit;
        const select_query = "SELECT \"lwFood\".\"id\" AS \"id\", \"lwFood\".\"name\" AS \"name\", \"lwFood\".\"image\" AS \"image\", \"lwFood\".\"calo\" AS \"calo\", \"lwFood\".\"description\" AS \"description\", \"lwFood\".\"total_like\" AS \"total_like\", \"lwFood\".\"recommend_level\" AS \"recommend_level\", \"lwFood\".\"prepare_time\" AS \"prepare_time\", \"lwFood\".\"cooking_time\" AS \"cooking_time\" ";
        const query =
            "FROM \"lw_food\" \"lwFood\" INNER JOIN \"lw_food_category\" \"lw_food_category\" ON lw_food_category.food_id = \"lwFood\".\"id\"  INNER JOIN \"lw_category\" \"lw_category\" ON \"lw_category\".\"id\" = lw_food_category.category_id  INNER JOIN \"lw_food_lw_menu_rel\" \"lw_food_lw_menu_rel\" ON lw_food_lw_menu_rel.lw_food_id = \"lwFood\".\"id\"  INNER JOIN \"lw_diet\" \"lw_diet\" ON lw_diet.lw_menu_id = " +
            "lw_food_lw_menu_rel.lw_menu_id  INNER JOIN \"lw_week\" \"lw_week\" ON \"lw_week\".\"id\" = lw_diet.lw_week_id WHERE " +
            "lw_week.day_of_week = '" + date + "' AND \"lw_category\".\"code\" = '"+ category +"' AND lw_diet.partner_id = "+ user_id ;
        const count = await this.entityManager.query("SELECT COUNT(DISTINCT \"lwFood\".\"id\")" + query);
        const result = await this.entityManager.query(select_query + query + "GROUP BY \"lwFood\".\"id\" LIMIT "+ limit +" OFFSET " + skippedItems);

        const total = parseInt(count[0]["count"]);
        let to = 0;
        let nextPage = true;
        if (total > page*limit) {
            to = page*limit;
        }
        else{
            to = total;
            nextPage = false;
        }
        const data = {
            data: result,
            page: page,
            limit: limit,
            from: skippedItems + 1,
            to: to,
            total: total,
            nextPage: nextPage
        };

        return data;
    }

}
