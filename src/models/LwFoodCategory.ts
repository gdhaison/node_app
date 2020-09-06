import {Column, Entity, Unique, PrimaryGeneratedColumn, OneToMany} from "typeorm";
import {BaseModel} from "./BaseModel";
import {LwFood} from "./LwFood";

@Entity({name: "lw_food_category"})
export class LwFoodCategory extends BaseModel {

    @Column({name: "name"})
    public name: string;

    @Column({name: "code"})
    public code: string;

    @OneToMany(type => LwFood, lwFood => lwFood.category)
    lwFood: LwFood;
}
