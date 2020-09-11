import {Service} from "typedi";
import {BaseService} from "./BaseService";
import {LwNews} from "../models/LwNews";
import {OrmRepository} from "typeorm-typedi-extensions";
import {LwNewsRepository} from "../repositories/LwNewsRepository";
import {NewsErrors} from "../api/errors/NewsNotFoundError";

@Service()
export class LwNewService extends BaseService<LwNews> {
    constructor(@OrmRepository() private lwNewsRepository: LwNewsRepository) {
        super(LwNews);
    }

    public getNewsDetail (newsId: number): Promise<LwNews> {
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
            } else {
                throw new NewsErrors(404);
            }
            return response;
        });
    }

    public getNews () {
        let response: any;
        return this.lwNewsRepository.getNews();
    }
}
