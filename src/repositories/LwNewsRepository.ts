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

    getNews() {
        // const results = this.createQueryBuilder("lw_news");
            // .leftJoin("lw_news.id", "lw_news_trace")
            // .where("lw_news.id = lw_news_trace.news_id");
        // results.getMany().paginate()
    }
}
