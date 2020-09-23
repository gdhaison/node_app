import {Column, Entity, PrimaryColumn} from "typeorm";

@Entity({name: "lw_food_category"})
export class LwFoodCategory {
    @PrimaryColumn()
    public foodId: number;

    @Column({name: "category_code"})
    public categoryCode: string;

    @Column({name: "partner_id"})
    public partnerId: number;

}
