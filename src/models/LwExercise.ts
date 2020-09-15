import {BaseModel} from "./BaseModel";
import {} from "typeorm";
import {Entity, Column} from "typeorm";

@Entity({name: "lw_exercise"})
export class LwExercise extends BaseModel {

    @Column({name: "name"})
    public name: string;

    @Column({name: "duration"})
    public duration: number;

    @Column({name: "description"})
    public description: string;

    @Column({name: "image"})
    public image: string;

    @Column({name: "video"})
    public video: string;

    @Column({name: "kcal"})
    public kcal: number;

    @Column({name: "min_weight"})
    public min_weight: number;

    @Column({name: "max_weight"})
    public max_weight: number;

    @Column({name: "min_height"})
    public min_height: number;

    @Column({name: "max_height"})
    public max_height: number;

    @Column({name: "fixed"})
    public fixed: number;
}
