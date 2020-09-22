import {Column, Entity} from "typeorm";
import {BaseModel} from "./BaseModel";

@Entity({name: "lw_weightloss_area"})
export class LwWeightLossArea extends BaseModel {

    @Column({name: "name"})
    public name: number;

    @Column({name: "create_uid"})
    public createUid: string;

    @Column({name: "write_uid"})
    public writeUid: number;
}
