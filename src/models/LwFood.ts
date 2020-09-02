import {Column, Entity, Unique, PrimaryGeneratedColumn, ManyToOne} from "typeorm";
import {BaseModel} from "./BaseModel";
import {LwFoodCategory} from "./LwFoodCategory";

@Entity({name: "lw_food"})
export class LwFood extends BaseModel {

    @PrimaryGeneratedColumn({name: "id"})
    id: number;

    @Column({name: "name"})
    public name: string;

    @Column({name: "calo"})
    public calo: number;

    @Column({name: "description"})
    public description: string;

    @Column({name: "total_like"})
    public totalLike: string;

    @Column({name: "recommend_level"})
    public recommendLevel: string;

    @Column({name: "prepare_time"})
    public prepareTime: string;


    @ManyToOne(type => LwFoodCategory, lwFoodCategory => lwFoodCategory.lwFood)
    category: LwFoodCategory
}
