import {LwFoodService} from "../../services/FoodService";
import {
    Body,
    CurrentUser,
    Get,
    JsonController,
    Post,
    QueryParam,
    UploadedFile
} from "routing-controllers";
import {FoodCreateRequest} from "../../models/dto/FoodCreateRequest";
import {addPhoto} from "../../utils/S3Utils";
import {S3Album} from "../../enums/S3Album";
import {RatingRequest} from "../../models/dto/RatingRequest";
import express from "express";
import {Req} from "routing-controllers/decorator/Req";
import {Res} from "routing-controllers/decorator/Res";
import {Param} from "routing-controllers/decorator/Param";
import logger from "../../lib/logger/logger";
import {ResPartner} from "../../models";
import {StatusCodes} from "http-status-codes";
import {ErrorCode} from "../../enums/ErrorCode";
import {IsNumber, isNumberString, IsString} from "class-validator";



@JsonController("/diets")
export class LwFoodController {
    constructor(
        private _lwfoodService: LwFoodService
    ) {
    }

    @Post("/food")
    public async addFood(@Body() food: FoodCreateRequest,
                         @UploadedFile("image") image: Express.Multer.File) {
        const location = addPhoto(S3Album.DIET, image);
        return this._lwfoodService.create(food, location);
    }

    @Get("/search")
    public async getAll(
        @QueryParam("search_text") search_text: string,
        @QueryParam("category") category: string,
        @QueryParam("page") page: number,
        @QueryParam("limit") limit: number,
        @CurrentUser({required: true}) user: ResPartner
        ):
        Promise<{ total: number; data: any; nextPage: boolean; limit: number; from: number; page: number; to: number }> {
        const user_id = user.id;
        return this._lwfoodService.search(search_text, category, page, limit, user_id);
    }

    @Get("/other-food")
    public async getOtherFood(
        @QueryParam("category") category: string,
        @QueryParam("page") page: number,
        @QueryParam("limit") limit: number,
        @CurrentUser({required: true}) user: ResPartner,
    ): Promise<any>
    {
        const user_id = user.id;
        return this._lwfoodService.getOtherFood(category, page, limit, user_id);
    }

    @Get("/foods")
    getFoodByDate(
        @QueryParam("date") date: string,
        @QueryParam("menu") menu: string,
        @QueryParam("page") page: number,
        @QueryParam("limit") limit: number,
        @CurrentUser({required: true}) user: ResPartner,
    ): Promise<any> {
        const user_id = user.id;
        return this._lwfoodService.getFoodByDate(date, menu, user_id, page, limit);
    }

    @Get("/:food_id")
    public async getFoodById(@CurrentUser({required: true}) user: ResPartner, @Param("food_id") foodId: number, @Req() req: express.Request, @Res() res: express.Response) {
        return this._lwfoodService.getById(foodId, user.id);
    }

    @Post("/like")
    public async like(@CurrentUser({required: true}) user: ResPartner, @Body() data: any,
                      @Req() req: express.Request, @Res() res: express.Response) {
        res.status(StatusCodes.NO_CONTENT);
        return this._lwfoodService.like(data.food_id, user.id, 1);
    }

    @Post("/rating")
    public async rating(@CurrentUser({required: true, }) user: ResPartner, @Body() body: RatingRequest,
                        @Req() req: express.Request, @Res() res: express.Response) {
        res.status(StatusCodes.NO_CONTENT);
        return this._lwfoodService.rating(body, user.id);
    }

    @Post("/change-food")
    public async changeFood(@CurrentUser({required: true}) user: ResPartner, @Body() data: any,
                        @Req() req: express.Request, @Res() res: express.Response) {
        res.status(StatusCodes.NO_CONTENT);
        return this._lwfoodService.changeFood(data);
    }

    @Post("/finished-eating")
    public async finishDiet(
        @CurrentUser({required: true}) user: ResPartner,
        @QueryParam("menu_code") menuCode: string,
        @QueryParam("dow") dow: string,
    )
    {
        const userId = user.id;
        return this._lwfoodService.finishDiet(menuCode, dow, userId);
    }

}
