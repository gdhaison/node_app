import {
  Column,
  Entity,
  Index,
  JoinColumn,
  ManyToOne,
  OneToMany,
  PrimaryGeneratedColumn,
} from "typeorm";
import { LwExPartnerWeek } from "./LwExPartnerWeek";
import { ResUsers } from "./ResUsers";
import { LwExercise } from "./LwExercise";
import { ResPartner } from "./ResPartner";

@Index("lw_exercise_partner_pkey", ["id"], { unique: true })
@Entity("lw_exercise_partner", { schema: "public" })
export class LwExercisePartner {
  @PrimaryGeneratedColumn({ type: "integer", name: "id" })
  id: number;

  @Column("double precision", { name: "progress", precision: 53 })
  progress: number;

  @Column("character varying", { name: "emotion", nullable: true })
  emotion: string | null;

  @Column("timestamp without time zone", {
    name: "create_date",
    nullable: true,
  })
  createDate: Date | null;

  @Column("timestamp without time zone", { name: "write_date", nullable: true })
  writeDate: Date | null;

  @OneToMany(
    () => LwExPartnerWeek,
    (lwExPartnerWeek) => lwExPartnerWeek.lwExercisePartner
  )
  lwExPartnerWeeks: LwExPartnerWeek[];

  @ManyToOne(() => ResUsers, (resUsers) => resUsers.lwExercisePartners, {
    onDelete: "SET NULL",
  })
  @JoinColumn([{ name: "create_uid", referencedColumnName: "id" }])
  createU: ResUsers;

  @ManyToOne(() => LwExercise, (lwExercise) => lwExercise.lwExercisePartners, {
    onDelete: "SET NULL",
  })
  @JoinColumn([{ name: "exercise_id", referencedColumnName: "id" }])
  exercise: LwExercise;

  @ManyToOne(() => ResPartner, (resPartner) => resPartner.lwExercisePartners, {
    onDelete: "SET NULL",
  })
  @JoinColumn([{ name: "partner_id", referencedColumnName: "id" }])
  partner: ResPartner;

  @ManyToOne(() => ResUsers, (resUsers) => resUsers.lwExercisePartners2, {
    onDelete: "SET NULL",
  })
  @JoinColumn([{ name: "write_uid", referencedColumnName: "id" }])
  writeU: ResUsers;
}
