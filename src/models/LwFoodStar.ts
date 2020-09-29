import { Column, Entity, Index, PrimaryGeneratedColumn } from "typeorm";

@Index("lw_food_star_pkey", ["foodId", "resPartnerId"], { unique: true })
@Entity("lw_food_star", { schema: "public" })
export class LwFoodStar {
  @PrimaryGeneratedColumn({ type: "integer", name: "food_id" })
  foodId: number;

  @PrimaryGeneratedColumn({ type: "integer", name: "res_partner_id" })
  resPartnerId: number;

  @Column("integer", { name: "star", nullable: true })
  star: number | null;

  @Column("integer", { name: "like_flag", nullable: true })
  likeFlag: number | null;
}
