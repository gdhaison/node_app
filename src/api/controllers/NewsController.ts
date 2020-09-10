import {CurrentUser, Get, JsonController, Post, Param, QueryParam, Body, Req, Res} from "routing-controllers";
import {LwNewService} from "../../services/NewService";
import {getRepository} from "typeorm";
import {LwNews} from "../../models/LwNews";
import {ResPartner} from "../../models";
import {NewsLikeRequest, NewsViewRequest} from "../../models/dto/NewsRequest";
import express from "express";
import {StatusCodes} from "http-status-codes";

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
    getNews(@QueryParam("page", {required: true}) page: number,
            @QueryParam("limit", {required: true}) limit: number) {
        return this._lwNewService.getNews(page, limit);
    }

    @Post("/like")
    public async like(@CurrentUser({required: true}) user: ResPartner,
                      @Body() data: NewsLikeRequest,
                      @Req() req: express.Request,
                      @Res() res: express.Response) {
        res.status(StatusCodes.NO_CONTENT);
        return this._lwNewService.like(data.news_id, data.like, user.id);
    }

    @Post("/view")
    public async view(@CurrentUser({required: true}) user: ResPartner,
                      @Body() data: NewsViewRequest,
                      @Req() req: express.Request,
                      @Res() res: express.Response) {
        res.status(StatusCodes.NO_CONTENT);
        return this._lwNewService.view(data.news_id, user.id);
    }
}

