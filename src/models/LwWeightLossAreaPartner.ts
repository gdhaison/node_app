import {Column, Entity} from "typeorm";
import {BaseModel} from "./BaseModel";

@Entity({name: "lw_weightloss_area_partner"})
export class LwWeightLossAreaPartner extends BaseModel {

    @Column({name: "partner_id"})
    public partnerId: number;

    @Column({name: "weightloss_area_id"})
    public weightLossAreaId: number;

    @Column({name: "active"})
    public active: boolean;

    @Column({name: "create_uid"})
    public createUid: string;

    @Column({name: "write_uid"})
    public writeUid: number;
}
