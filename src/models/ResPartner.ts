import {Column, Entity} from "typeorm";
import {BaseModel} from "./BaseModel";

@Entity({name: "res_partner"})
export class ResPartner extends BaseModel {

    @Column({name: "email"})
    email!: string;

    @Column({length: 50, name: "x_lw_password"})
    password!: string;

    @Column({type: "date", name: "x_lw_dob"})
    dob!: Date;

    @Column({name: "x_lw_gender"})
    gender!: string;

    @Column({length: 20, name: "phone"})
    phone!: string;

    @Column({length: 20, name: "mobile"})
    mobile!: string;

    @Column({name: "x_lw_height"})
    height!: number;

    @Column({name: "x_lw_weight"})
    weight!: number;

    @Column({name: "x_lw_expected_weight"})
    targetWeight!: number;

    @Column({name: "x_lw_steps_per_day"})
    stepPerDay!: number;

    @Column({name: "x_lw_meals_per_day"})
    mealsPerDay!: number;

    @Column({name: "x_lw_power"})
    power!: string;

    @Column({name: "avatar"})
    avatar!: string;

}
