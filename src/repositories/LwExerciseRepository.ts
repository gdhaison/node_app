import {EntityManager, EntityRepository, Repository} from "typeorm";
import {Service} from "typedi";
import {LwFood} from "../models/LwFood";
import {InjectManager} from "typeorm-typedi-extensions";
import {LwFoodStar} from "../models/LwFoodStar";
import {RatingRequest} from "../models/dto/RatingRequest";
import {FoodNotFoundError} from "../api/errors/FoodNotFoundError";
import {ErrorCode} from "../enums/ErrorCode";
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

    async changeFood(data: { foodId: number; categoryCode: string }[]): Promise<any> {
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
        const select_query = `select 
                            lf.id, 
                            lf.image, 
                            lf."name", 
                            lf.calo,
                            lf.description,
                            lfs.star as user_star,
                            (select count(1) from lw_food_star lfs where lfs.res_partner_id = ${user_id} and lfs.like_flag = 1 and lfs.food_id = lf.id) as heart,
                            (select AVG(lfs.star) from lw_food_star lfs where lfs.res_partner_id = ${user_id} and lfs.food_id = lf.id) as star 
                            from lw_food lf 
                            left join lw_food_star lfs ON lfs.food_id = lf.id 
                            inner join lw_food_lw_menu_rel lflmr ON lflmr.lw_food_id = lf.id 
                            inner join lw_diet ld ON ld.lw_menu_id = lflmr.lw_menu_id
                            inner join lw_week lw ON lw.id = ld.lw_week_id
                            where lw.day_of_week = '${date}'
                            and lfs.res_partner_id = ${user_id}`;

        const count = await this.entityManager.query(`select count(1)
                            from lw_food lf 
                            left join lw_food_star lfs ON lfs.food_id = lf.id 
                            inner join lw_food_lw_menu_rel lflmr ON lflmr.lw_food_id = lf.id 
                            inner join lw_diet ld ON ld.lw_menu_id = lflmr.lw_menu_id
                            inner join lw_week lw ON lw.id = ld.lw_week_id
                            where lw.day_of_week = '${date}'
                            and lfs.res_partner_id = ${user_id}`);
        const result = await this.entityManager.query(select_query + "GROUP BY lf.id LIMIT "+ limit +" OFFSET " + skippedItems);

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
