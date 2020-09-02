import {LwFoodService} from "../../services/FoodService";
import {Get, JsonController, QueryParam} from "routing-controllers";
import snakeCase from "snakecase-keys";

@JsonController("/diets")
export class LwFoodController {
    constructor(
        private _lwfoodService: LwFoodService
    ) {
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

}
