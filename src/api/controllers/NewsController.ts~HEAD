import {Get, JsonController, Param} from "routing-controllers";
import {LwNewService} from "../../services/NewService";

@JsonController("/news")
export class NewsController {
    constructor(
        private _lwNewService: LwNewService
    ) {};

    @Get("/:news_id")
    public async getNewsDetail(@Param("news_id") newsId: number) {
        return this._lwNewService.getNewsDetail(newsId);
    }
}

