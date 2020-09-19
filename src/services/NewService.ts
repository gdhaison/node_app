import {Service} from "typedi";
import {BaseService} from "./BaseService";
import {LwNews} from "../models/LwNews";
import {OrmRepository} from "typeorm-typedi-extensions";
import {LwNewsRepository} from "../repositories/LwNewsRepository";
import {NewsErrors} from "../api/errors/NewsNotFoundError";
import {LwNewsTrace} from "../models/LwNewsTrace";
import {LwNewTraceRepository} from "../repositories/LwNewTraceRepository";

@Service()
export class LwNewService extends BaseService<LwNews> {
    constructor(@OrmRepository() private lwNewsRepository: LwNewsRepository,
                @OrmRepository() private lwNewTraceRepository: LwNewTraceRepository) {
        super(LwNews);
    }

    public getNewsDetail (newsId: number, userId: number): Promise<LwNews> {
        let response: any;
        return this.lwNewsRepository.getNewsDetail(newsId).then((res)=> {
            if (res) {
                response = {
                    id : res.id,
                    title : res.title,
                    heart : res.totalLike,
                    view : res.totalViews,
                    description : res.description,
                    image_url_list: res.imageUrlList
                };
                this.view(newsId, userId);
            } else {
                throw new NewsErrors(404);
            }
            return response;
        });
    }

    public getNews (page: number, limit: number, userId: number) {
        return this.lwNewsRepository.getNews(page, limit, userId);
    }

    public like(newsId: number, likeFlag: boolean, userId: number) {
        return this.lwNewsRepository.like(newsId, likeFlag, userId);
    }

    public view(newsId: number, userId: number) {
        return this.lwNewTraceRepository.view(newsId, userId);
    }
}
