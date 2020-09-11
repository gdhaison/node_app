import {Service} from "typedi";
import {EntityRepository, Repository, Like} from "typeorm";
import {LwNews} from "../models/LwNews";

@Service()
@EntityRepository(LwNews)
export class LwNewsRepository extends Repository<LwNews> {
    getNewsDetail(newsId: number): Promise<LwNews> {
        const result = this.createQueryBuilder("lw_news").where("lw_news.id = " + newsId);
        return result.getOne();
    }
}
