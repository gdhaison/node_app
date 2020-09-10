import {Column, Entity, Unique, PrimaryGeneratedColumn, ManyToOne, OneToMany} from "typeorm";
import {BaseModel} from "./BaseModel";
import {LwFoodLwMenuRel} from "./LwFoodLwMenuRel";

@Entity({name: "lw_food"})
export class LwFood extends BaseModel {

    @Column({name: "name"})
    public name: string;

    @Column({name: "image"})
    public image: string;

    @Column({name: "calo"})
    public calo: number;

    @Column({name: "description"})
    public description: string;

    @Column({name: "total_like"})
    public totalLike: number;

    @Column({name: "recommend_level"})
    public recommendLevel: string;

    @Column({name: "prepare_time"})
    public prepareTime: number;

    @Column({name: "cooking_time"})
    public cookingTime: number;

    @OneToMany(type => LwFoodLwMenuRel, lwFoodLwMenu => lwFoodLwMenu.lwFood)
    relFoodMenu: LwFoodLwMenuRel
}
