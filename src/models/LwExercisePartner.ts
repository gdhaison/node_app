import {BaseModel} from "./BaseModel";
import {Entity, Column} from "typeorm";

@Entity({name: "lw_exercise_partner"})
export class LwExercisePartner extends BaseModel {
    @Column({name: "exercise_id"})
    public exerciseId: number;

    @Column({name: "partner_id"})
    public partnerId: number;

    @Column({name: "progress"})
    public progress: number;

    @Column({name: "emotion"})
    public emotion: string;
}
