import {Service} from "typedi";
import {EntityRepository, Repository} from "typeorm";
import {LwNews} from "../models/LwNews";

@Service()
@EntityRepository(LwNews)
export class LwNewsRepository extends Repository<LwNews> {
    getNewsDetail(newsId: number): Promise<LwNews> {
        const result = this.createQueryBuilder("lw_news").where("lw_news.id = " + newsId);
        return result.getOne();
    }

    async getNews(page: number, limit: number) {
        const skippedItems = (page - 1) * limit;
        const data = await this.query(`select ln2.id ,
             ln2.image_url_list,
             ln2.title,
             ln2.total_like ,
             ln2.total_views,
             ln2.description 
             from lw_news ln2
        limit ${limit} offset ${skippedItems} `);
        let count = [];
        count = await this.query("select count(*) as counter from lw_news");
        const total = Number(count[0].counter);
        let to = 0;
        let nextPage = true;
        if (total > page*limit) {
            to = page*limit;
        }
        else {
            to = total;
            nextPage = false;
        }
        const results = {
            data,
            page,
            limit,
            from: skippedItems + 1,
            to,
            total,
            nextPage
        };
        return results;
    }
}
