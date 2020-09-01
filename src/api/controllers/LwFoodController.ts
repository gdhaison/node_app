import {Body, Controller, Delete, Get, QueryParam} from "routing-controllers";
import {LwFoodService} from "../../services/FoodService";

@Controller()
export class LwFoodController {
    constructor(
        private _lwfoodService: LwFoodService
    ) { }

    @Get("/diets/search")
    getAll(@QueryParam("search_text") search_text: string, @QueryParam("category") category: string) {
        const foods = this._lwfoodService.search(search_text, category);
        return foods;
    }
}
