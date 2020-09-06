import {Column, Entity, ManyToOne} from "typeorm";
import {BaseModel} from "./BaseModel";
import {LwFood} from "./LwFood";

@Entity({name: "lw_food_lw_menu_rel"})
export class LwFoodLwMenuRel extends BaseModel {
    @Column({name: "lw_menu_id"})
    public lwMenuId: string;

    @Column({name: "lw_food_id"})
    public  lwFoodId: string;

    @ManyToOne(type => LwFood, lwFood => lwFood.relFoodMenu)
    lwFood: LwFood
}
