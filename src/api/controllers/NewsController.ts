import {Get, JsonController, Param, QueryParam} from "routing-controllers";
import {LwNewService} from "../../services/NewService";
import {getRepository} from "typeorm";
import {LwNews} from "../../models/LwNews";

@JsonController("/news")
export class NewsController {
    constructor(
        private _lwNewService: LwNewService,
        private repo = getRepository(LwNews)
    ) {};

    @Get("/:news_id")
    public async getNewsDetail(@Param("news_id") newsId: number) {
        return this._lwNewService.getNewsDetail(newsId);
    }

    @Get()
    getNews(@QueryParam("page") page: number, @QueryParam("limit") limit: number) {
        return this._lwNewService.getNews(page, limit);
    }
}

