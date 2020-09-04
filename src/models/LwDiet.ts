import {BaseModel} from "./BaseModel";
import {Column, Entity, ManyToOne} from "typeorm";
import {ResPartner} from "./ResPartner";
import {LwWeek} from "./LwWeek";
import {LwMenu} from "./LwMenu";

@Entity({name: "lw_diet"})
export class LwDiet extends BaseModel {

    @Column({name: "partner_id"})
    partnerId: number;

    @Column({name: "lw_week_id"})
    lwWeekId: number;

    @Column({name: "lw_menu_id"})
    lwMenuId: number;

    @ManyToOne(type => ResPartner, resPartner => resPartner.lwDiets)
    resPartner: ResPartner

    @ManyToOne(type => LwWeek, lwWeek => lwWeek.lwDiets )
    lwWeek: LwWeek

    @ManyToOne(type => LwMenu, lwMenu => lwMenu.lwdiets)
    lwMenu: LwMenu

}
