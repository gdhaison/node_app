import {DeleteResult, EntityManager, EntityRepository, getConnection, Repository} from "typeorm";
import {Service} from "typedi";
import {LwFood} from "../models/LwFood";
import {InjectManager} from "typeorm-typedi-extensions";
import {LwFoodStar} from "../models/LwFoodStar";
import {RatingRequest} from "../models/dto/RatingRequest";
import {FoodNotFoundError} from "../api/errors/FoodNotFoundError";
import {ErrorCode} from "../enums/ErrorCode";
import {LwFoodCategory} from "../models";
import {PageNotFound} from "../api/errors/PageNotFound";
import {LwFoodMenuPartner} from "../models/LwFoodMenuPartner";
import logger from "../lib/logger/logger";

@Service()
@EntityRepository(LwFoodMenuPartner)
export class LwFoodMenuPartnerRepository extends Repository<LwFoodMenuPartner> {

    constructor(@InjectManager() private entityManager: EntityManager) {
        super();
    }

    public async countByPartnerAndMenu(menu_code: string, day_of_week: string, user_id: number): Promise<any> {
        const count = await this.entityManager.query(`SELECT COUNT(1) FROM lw_food_menu_partner 
        WHERE partner_id = ${user_id} AND menu_code = '${menu_code}' AND day_of_week = '${day_of_week}'`);
    }
}
