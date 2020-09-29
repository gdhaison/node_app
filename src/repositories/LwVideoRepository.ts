import {EntityManager, EntityRepository, Repository} from "typeorm";
import {Service} from "typedi";
import {InjectManager} from "typeorm-typedi-extensions";
import {LwVideo} from "../models";

@Service()
@EntityRepository(LwVideo)
export class LwVideoRepository extends Repository<LwVideo> {

    constructor(@InjectManager() private entityManager: EntityManager) {
        super();
    }

    async findByExerciseId(exerciseId: number, page: number, pageSize: number): Promise<any> {
        let nextPage = true;
        const from = ((page - 1) * pageSize);
        const to = page * pageSize;

        const count = await this.entityManager.query(
            `SELECT count(1) FROM lw_video lv 
            INNER JOIN lw_exercise_video lev ON lv.id = lev.video_id 
            WHERE lev.exercise_id = ${exerciseId} LIMIT $1 OFFSET $2`, [pageSize, from]
        );

        if (!count && count.length <= 0)
            return [];
        const result = await this.entityManager.query(
            `SELECT lv.id, lv.image, lv.video_name as name, lv.url as video, lv.description FROM lw_video lv 
            INNER JOIN lw_exercise_video lev ON lv.id = lev.video_id 
            WHERE lev.exercise_id = ${exerciseId} LIMIT $1 OFFSET $2`, [pageSize, from]);

        const total = count[0].count;
        if (to >= total)
            nextPage = false;

        return {
            data: result,
            page,
            pageSize,
            from: from + 1,
            to,
            total,
            nextPage
        };
    }

    async countByExerciseId(exerciseId: number): Promise<any> {
        return await this.entityManager.query(
            `SELECT lev.exercise_id, COUNT(1) FROM lw_video lv INNER JOIN lw_exercise_video lev ON lv.id = lev.video_id
             WHERE lev.exercise_id = ${exerciseId}`
        );
    }
}
