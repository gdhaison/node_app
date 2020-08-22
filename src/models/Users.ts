import {Column, Entity, Unique} from "typeorm";
import {IsDate, IsEmail, IsInt, IsPhoneNumber, IsString, IsUrl} from "class-validator";
import {BaseModel} from "./BaseModel";

@Entity()
@Unique(["nickname", "phone", "email"])
export class User extends BaseModel {
    @Column({length: 45})
    @IsInt()
    nickname!: string;

    @Column({length: 10})
    @IsString()
    name!: string;

    @Column({type: "date"})
    @IsDate()
    birthday!: Date;

    @Column({length: 200})
    @IsUrl()
    profile!: string;

    @Column({length: 25})
    @IsPhoneNumber("KR")
    phone!: string;

    @Column({length: 35})
    @IsEmail()
    email!: string;
}
