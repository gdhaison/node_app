import {LwFoodService} from "../../services/FoodService";
import {
    Body,
    CurrentUser,
    Get,
    JsonController,
    Param,
    Post,
    QueryParam,
    Req,
    Res,
    UploadedFile
} from "routing-controllers";
import {FoodCreateRequest} from "../../models/dto/FoodCreateRequest";
import {addPhoto} from "../../utils/S3Utils";
import {S3Album} from "../../enums/S3Album";
import {RatingRequest} from "../../models/dto/RatingRequest";
import express from "express";
import {ResPartner} from "../../models";
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
    public async getAll(@QueryParam("search_text") search_text: string, @QueryParam("category") category: string) {
        return this._lwfoodService.search(search_text, category);
    }

    @Get("/:food_id")
    public async getFoodById(@Param("food_id") foodId: number, @Req() req: express.Request, @Res() res: express.Response) {
        return this._lwfoodService.getById(foodId);
    }

    @Post("/like")
    public async like(@CurrentUser({required: true}) user: ResPartner, @Body() data: any,
                      @Req() req: express.Request, @Res() res: express.Response) {
        res.status(StatusCodes.NO_CONTENT);
        return this._lwfoodService.like(data.food_id, user.id, 1);
    }

    @Post("/rating")
    public async rating(@CurrentUser({required: true}) user: ResPartner, @Body() body: RatingRequest,
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
}
