import {
  Column,
  Entity,
  Index,
  JoinColumn,
  ManyToOne,
  PrimaryGeneratedColumn,
} from "typeorm";
import { ResUsers } from "./ResUsers";
import { LwExercisePartner } from "./LwExercisePartner";
import { LwWeek } from "./LwWeek";

@Index("lw_ex_partner_week_pkey", ["id"], { unique: true })
@Entity("lw_ex_partner_week", { schema: "public" })
export class LwExPartnerWeek {
  @PrimaryGeneratedColumn({ type: "integer", name: "id" })
  id: number;

  @Column("boolean", { name: "active" })
  active: boolean;

  @Column("timestamp without time zone", {
    name: "create_date",
    nullable: true,
  })
  createDate: Date | null;

  @Column("timestamp without time zone", { name: "write_date", nullable: true })
  writeDate: Date | null;

  @Column("boolean", { name: "finish_flag", nullable: true })
  finishFlag: boolean | null;

  @ManyToOne(() => ResUsers, (resUsers) => resUsers.lwExPartnerWeeks, {
    onDelete: "SET NULL",
  })
  @JoinColumn([{ name: "create_uid", referencedColumnName: "id" }])
  createU: ResUsers;

  @ManyToOne(
    () => LwExercisePartner,
    (lwExercisePartner) => lwExercisePartner.lwExPartnerWeeks,
    { onDelete: "SET NULL" }
  )
  @JoinColumn([{ name: "lw_exercise_partner_id", referencedColumnName: "id" }])
  lwExercisePartner: LwExercisePartner;

  @ManyToOne(() => LwWeek, (lwWeek) => lwWeek.lwExPartnerWeeks, {
    onDelete: "SET NULL",
  })
  @JoinColumn([{ name: "lw_week_id", referencedColumnName: "id" }])
  lwWeek: LwWeek;

  @ManyToOne(() => ResUsers, (resUsers) => resUsers.lwExPartnerWeeks2, {
    onDelete: "SET NULL",
  })
  @JoinColumn([{ name: "write_uid", referencedColumnName: "id" }])
  writeU: ResUsers;
}
