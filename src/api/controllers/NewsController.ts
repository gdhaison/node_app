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
    public async getNews() {
        const news = await this.repo.createQueryBuilder("lwNews")
            .leftJoinAndSelect("lwNews.lwNewsTraces", "lwNewsTrace")
            .getMany();
            // .paginate();
        return news;
    }
}

