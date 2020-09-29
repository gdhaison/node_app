import { Column, Entity, Index, PrimaryGeneratedColumn } from "typeorm";

@Index("lw_food_menu_partner_pkey", ["id"], { unique: true })
@Entity("lw_food_menu_partner", { schema: "public" })
export class LwFoodMenuPartner {
  @PrimaryGeneratedColumn({ type: "integer", name: "id" })
  id: number;

  @Column("bigint", { name: "food_id" })
  foodId: number;

  @Column("character varying", { name: "menu_code" })
  menuCode: string;

  @Column("bigint", { name: "partner_id" })
  partnerId: number;

  @Column("character varying", { name: "day_of_week" })
  dayOfWeek: string;

  @Column("integer", { name: "lw_menu_id", nullable: true })
  lwMenuId: number | null;
}
