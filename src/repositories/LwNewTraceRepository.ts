import {Service} from "typedi";
import {EntityRepository, Repository} from "typeorm";
import {LwNewsTrace} from "../models/LwNewsTrace";
import {ResPartner} from "../models";
import {LwNews} from "../models/LwNews";

@Service()
@EntityRepository(LwNewsTrace)
export class LwNewTraceRepository extends Repository<LwNewsTrace> {

    async view(newsId: number, userId: number) {
        const resultNewTrace = await this.createQueryBuilder()
            .select("*")
            .from(LwNewsTrace, "lnt")
            .where(`lnt.news_id = ${newsId}`)
            .andWhere(`lnt.partner_id = ${userId}`)
            .getRawMany();
        if (resultNewTrace.length) {
            await this.createQueryBuilder()
                .update(LwNewsTrace)
                .set({readFlg: true})
                .where(`news_id = ${newsId}`)
                .andWhere(`partner_id = ${userId}`)
                .execute();
        }

        if (!resultNewTrace.length) {
            const resPartner = new ResPartner();
            resPartner.id = userId;
            const lwNews = new LwNews();
            lwNews.id = newsId;
            const now = new Date();
            return this.createQueryBuilder()
                .insert()
                .into(LwNewsTrace,
                    [ "partner_id", "news_id", "like_flg", "read_flg", "create_date", "write_date"])
                .values(
                    {
                        partner: resPartner,
                        news: lwNews,
                        likeFlg: false,
                        readFlg: true,
                        createDate: now,
                        writeDate: now,
                    }
                )
                .execute();
        }
    }
}
