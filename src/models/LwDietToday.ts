import { Column, Entity, Index, PrimaryGeneratedColumn } from "typeorm";

@Index("lw_diet_today_pkey", ["id"], { unique: true })
@Entity("lw_diet_today", { schema: "public" })
export class LwDietToday {
  @PrimaryGeneratedColumn({ type: "integer", name: "id" })
  id: number;

  @Column("bigint", { name: "diet_id", nullable: true })
  dietId: string | null;

  @Column("boolean", { name: "status", nullable: true })
  status: boolean | null;

  @Column("date", { name: "created_date", nullable: true })
  createdDate: string | null;
}
