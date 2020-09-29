import {EntityManager, EntityRepository, Repository} from "typeorm";
import {Service} from "typedi";
import {InjectManager} from "typeorm-typedi-extensions";
import {LwExercise} from "../models";
import {ExerciseNotFoundError} from "../api/errors/ExerciseNotFoundError";
import {ErrorCode} from "../enums/ErrorCode";
import {PageNotFound} from "../api/errors/PageNotFound";

@Service()
@EntityRepository(LwExercise)
export class LwExerciseRepository extends Repository<LwExercise> {

    constructor(@InjectManager() private entityManager: EntityManager) {
        super();
    }

    async getById(id: number): Promise<any> {
        const data = await this.entityManager.query("SELECT le.id, le.image, le.name, le.video FROM lw_exercise AS le WHERE le.id = $1 ", [id]);
        if (Array.isArray(data) && data.length)
            return data[0];
        throw new ExerciseNotFoundError(ErrorCode.FOOD_NOT_FOUND);
    }

    async putExercise(exerciseId: number, userId: number): Promise<any> {
        const lwExPartnerWeekId = await this.entityManager.query("SELECT lepw.id from lw_exercise_partner lep INNER JOIN lw_ex_partner_week lepw ON lepw.lw_exercise_partner_id = lep.id where lep.exercise_id = " + exerciseId + "AND lep.partner_id = " + userId);
        const lwExPartnerId = parseInt(lwExPartnerWeekId[0]["id"]);

        return this.entityManager.query("UPDATE lw_ex_partner_week SET finish_flag = true where id = " + lwExPartnerId);
    }

    async checkUserExist(userId: number): Promise<number> {
        const userCount = await this.entityManager.query("SELECT count(res_partner.id) from res_partner where id = " + userId);
        return parseInt(userCount[0]["count"]);
    }

    async checkExerciseExist(exerciseId: number): Promise<number> {
        const exCount = await this.entityManager.query("SELECT count(lw_exercise.id) from lw_exercise where id = " + exerciseId);
        return parseInt(exCount[0]["count"]);
    }

    async paginate(page: number, limit: number, partnerId: number, dayOfWeek: string, createDate: string): Promise<any> {
        const data = await this.entityManager.query(
            `select lw.id as week_id, lep.exercise_id as exercise_id, lepw.finish_flag as finish_flag from lw_week lw 
            inner join lw_ex_partner_week lepw on lw.id = lepw.lw_week_id 
            inner join lw_exercise_partner lep on lep.id = lepw.lw_exercise_partner_id 
            where lep.partner_id = $1 AND lw.day_of_week = $2`, [partnerId, dayOfWeek]);

        const total = data.length;
        let nextPage = true;
        const from = ((page - 1) * limit);
        const to = page * limit;
        if (to >= total)
            nextPage = false;
        let result = {};
        if (data.length > 0) {
            const exerciseIds = data.map((a: { exercise_id: any }) => a.exercise_id);
            result = await this.entityManager.query(`
            SELECT 
            LWE.ID, LWE.IMAGE, LWE.NAME, 
            (
                select lepw.finish_flag as finish_flag from lw_week lw 
                inner join lw_ex_partner_week lepw on lw.id = lepw.lw_week_id 
                inner join lw_exercise_partner lep on lep.id = lepw.lw_exercise_partner_id 
                where lep.partner_id = $3 AND lw.day_of_week = $4 and lepw.create_date = $5
            ) AS is_finished,
            (select COUNT(1) from LW_VIDEO LV INNER JOIN LW_EXERCISE_VIDEO LEV ON LEV.VIDEO_ID = LV.ID WHERE LEV.EXERCISE_ID = LWE.ID) AS TOTAL_ITEMS 
            FROM LW_EXERCISE LWE 
            INNER JOIN LW_EXERCISE_VIDEO LEV ON LEV.EXERCISE_ID = LWE.ID 
            INNER JOIN lw_week lw ON lw.day_of_week = $4 
            INNER JOIN lw_exercise_partner lep ON lep.partner_id = $3 and lep.exercise_id = LWE.id 
            inner join lw_ex_partner_week lepw on lepw.lw_week_id = lw.id and lepw.lw_exercise_partner_id = lep.id 
            WHERE LWE.ID IN (${exerciseIds}) and lepw.create_date = $5 GROUP BY LWE.ID LIMIT $1 OFFSET $2`, [limit, from, partnerId, dayOfWeek, createDate]);
        }
        return {
            data: result,
            page,
            limit,
            from: from + 1,
            to,
            total,
            nextPage
        };
    }

    async getByArea(area: string, page: number, limit: number): Promise<any> {
        const skippedItems = (page - 1) * limit;
        const select_query = `Select le.id, le.name, le.image, (select count(*) from lw_exercise_video lev
            where lev.exercise_id = le.id) as total_items `;
        const query = `from lw_exercise le inner join lw_exercise_lw_weightloss_area_rel lelw
            on le.id = lelw.lw_exercise_id inner join lw_weightloss_area lwa on lwa.id =
            lelw.lw_weightloss_area_id where lwa.name = '${area}'`;

        const count = await this.entityManager.query("SELECT COUNT(*) " + query);
        const total = parseInt(count[0]["count"]);
        const total_page = Math.ceil(total / limit);
        let to = 0;
        let nextPage = true;
        if (total > page * limit) {
            to = page * limit;
        } else if (page > total_page && total_page != 0) {
            throw new PageNotFound(ErrorCode.PAGE_NOT_EXIST);
        } else {
            to = total;
            nextPage = false;
        }

        const result = await this.entityManager.query(select_query + query + "LIMIT " + limit + " OFFSET " + skippedItems);

        return {
            data: result,
            page,
            limit,
            from: skippedItems + 1,
            to,
            total,
            nextPage
        };
    }

    async findById(id: number): Promise<any> {
        const result = await this.entityManager.query(
            `SELECT le.id, le.name, le.image
             FROM lw_exercise le WHERE le.id = ${id} `
        );
        return result[0];
    }
}
