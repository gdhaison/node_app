import {Column, Entity, Unique, PrimaryGeneratedColumn, OneToMany} from "typeorm";
import {BaseModel} from "./BaseModel";
import {LwFood} from "./LwFood";

@Entity({name: "lw_category"})
export class LwCategory extends BaseModel {

    @Column({name: "name"})
    public name: string;

    @Column({name: "code"})
    public code: string;
}
