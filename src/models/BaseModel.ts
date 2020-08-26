import {CreateDateColumn, PrimaryColumn, UpdateDateColumn, ValueTransformer, PrimaryGeneratedColumn} from "typeorm";
import {IsDate, IsInt} from "class-validator";

const bigIntTransformer: ValueTransformer = {
    to: (entityValue: bigint) => entityValue,
    from: (databaseValue: string) => Number(databaseValue),
};

export abstract class BaseModel {
    @IsInt()
    @PrimaryGeneratedColumn()
    @PrimaryColumn({type: "bigint", transformer: [bigIntTransformer]})
    id!: number;

    @IsDate()
    @CreateDateColumn()
    createDate!: Date;

    @IsDate()
    @UpdateDateColumn()
    writeDate!: Date;

}
