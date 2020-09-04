import {Column, Entity, OneToMany} from "typeorm";
import {BaseModel} from "./BaseModel";
import {LwDiet} from "./LwDiet";

@Entity({name: "lw_week"})
export class LwMenu extends BaseModel {
    @Column({name: "day_of_week"})
    public dayOfWeek: string;

    @OneToMany(type => LwDiet, lwDiet => lwDiet.lwMenu)
    lwdiets: LwDiet

}
