import {Column, Entity} from "typeorm";
import {BaseModel} from "./BaseModel";

@Entity({name: "lw_food_category"})
export class LwFoodCategory extends BaseModel {
    @Column({name: "food_id"})
    public foodId: number;

    @Column({name: "category_id"})
    public categoryId: number;

}
