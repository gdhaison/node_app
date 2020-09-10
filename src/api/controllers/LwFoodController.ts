import {LwFoodService} from "../../services/FoodService";
import {Body, Get, JsonController, QueryParam, UploadedFile} from "routing-controllers";
import snakeCase from "snakecase-keys";
import {Post} from "routing-controllers/decorator/Post";
import {FoodCreateRequest} from "../../models/dto/FoodCreateRequest";
import {addPhoto} from "../../utils/S3Utils";
import {S3Album} from "../../enums/S3Album";
import {RatingRequest} from "../../models/dto/RatingRequest";
import express from "express";
import {Req} from "routing-controllers/decorator/Req";
import {Res} from "routing-controllers/decorator/Res";
import {StatusCodes} from "http-status-codes";

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
    getAll(@QueryParam("search_text") search_text: string, @QueryParam("category") category: string) {
        return this._lwfoodService.search(search_text, category);
    }

    @Get("/:food_id")
    getFoodById(@QueryParam("food_id") foodId: number) {
        return this._lwfoodService.getById(foodId).then(function (res) {
            return snakeCase({
                id: res.id,
                image: "http://image.com/",
                name: res.name,
                calo: res.calo,
                heart: res.totalLike,
                star: 4,
                description: res.description,
            });
        });
    }

    @Post("/like")
    public async like(@Body() food: FoodCreateRequest,
                         @UploadedFile("image") image: Express.Multer.File) {
        const location = addPhoto(S3Album.DIET, image);
        return this._lwfoodService.create(food, location);
    }

    @Post("/rating")
    public async rating(@Body() body: RatingRequest, @Req() req: express.Request, @Res() res: express.Response) {
        res.status(StatusCodes.NO_CONTENT);
        return this._lwfoodService.rating(body);
    }
}
