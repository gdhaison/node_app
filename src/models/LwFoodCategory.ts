import {Column, Entity, PrimaryColumn} from "typeorm";

@Entity({name: "lw_food_category"})
export class LwFoodCategory {
    @PrimaryColumn()
    public foodId: number;

    @Column({name: "category_id"})
    public categoryId: number;

}
