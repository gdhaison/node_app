import {Column, Entity, Unique, PrimaryGeneratedColumn, ManyToOne, OneToMany} from "typeorm";
import {BaseModel} from "./BaseModel";
import {LwFoodCategory} from "./LwFoodCategory";
import {LwFoodLwMenuRel} from "./LwFoodLwMenuRel";

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

    @OneToMany(type => LwFoodLwMenuRel, lwFoodLwMenu => lwFoodLwMenu.lwFood)
    relFoodMenu: LwFoodLwMenuRel
}
