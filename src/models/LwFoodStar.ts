import {Column, Entity, Unique, PrimaryGeneratedColumn, ManyToOne, OneToMany} from "typeorm";
import {PrimaryColumn, ValueTransformer} from "typeorm";
import {IsInt} from "class-validator";

const bigIntTransformer: ValueTransformer = {
    to: (entityValue: bigint) => entityValue,
    from: (databaseValue: string) => Number(databaseValue),
};

@Entity({name: "lw_food_star"})
export class LwFoodStar {
    @IsInt()
    @PrimaryGeneratedColumn()
    @PrimaryColumn({type: "bigint", transformer: [bigIntTransformer]})
    id!: number;

    @Column({name: "food_id"})
    public foodId: number;

    @Column({name: "res_partner_id"})
    public resPartnerId: number;

    @Column({name: "star"})
    public star: number;

    @Column({name: "like_flag"})
    public likeFlag: number;
}
