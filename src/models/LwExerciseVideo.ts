import { Column, Entity, Index, PrimaryGeneratedColumn } from "typeorm";

@Index("lw_exercise_video_pkey", ["id"], { unique: true })
@Entity("lw_exercise_video", { schema: "public" })
export class LwExerciseVideo {
  @PrimaryGeneratedColumn({ type: "integer", name: "id" })
  id: number;

  @Column("integer", { name: "exercise_id", nullable: true })
  exerciseId: number | null;

  @Column("integer", { name: "video_id", nullable: true })
  videoId: number | null;
}
