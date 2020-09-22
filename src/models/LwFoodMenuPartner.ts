import {Column, Entity, PrimaryColumn} from "typeorm";

@Entity({name: "lw_food_menu_partner"})
export class LwFoodMenuPartner {
    @PrimaryColumn()
    public foodId: number;

    @Column({name: "menu_code"})
    public menuCode: string;

    @Column({name: "partner_id"})
    public partnerId: number;

    @Column({name: "day_of_week"})
    public dayOfWeek: string;
}
