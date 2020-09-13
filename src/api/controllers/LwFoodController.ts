import {LwFoodService} from "../../services/FoodService";
import {Body, Get, JsonController, QueryParam, UploadedFile} from "routing-controllers";
import {Post} from "routing-controllers/decorator/Post";
import {FoodCreateRequest} from "../../models/dto/FoodCreateRequest";
import {addPhoto} from "../../utils/S3Utils";
import {S3Album} from "../../enums/S3Album";
import {RatingRequest} from "../../models/dto/RatingRequest";
import express from "express";
import {Req} from "routing-controllers/decorator/Req";
import {Res} from "routing-controllers/decorator/Res";
import {Param} from "routing-controllers/decorator/Param";
import logger from "../../lib/logger/logger";
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
    public async getAll(@QueryParam("search_text") search_text: string, @QueryParam("category") category: string) {
        return this._lwfoodService.search(search_text, category);
    }

    @Get("/:food_id")
    public async getFoodById(@Param("food_id") foodId: number, @Req() req: express.Request, @Res() res: express.Response) {
        return this._lwfoodService.getById(foodId);
    }

    @Post("/like")
    public async like(@Body() food: FoodCreateRequest,
                      @UploadedFile("image") image: Express.Multer.File) {
        const location = addPhoto(S3Album.DIET, image);
        return this._lwfoodService.create(food, location);
    }

    @Post("/rating")
    public async rating(@Body() body: RatingRequest, @Req() req: express.Request, @Res() res: express.Response) {
        return this._lwfoodService.rating(body);
    }
}
