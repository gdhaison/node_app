import {Column, Entity, Unique} from "typeorm";
import {IsDate, IsEmail, IsPhoneNumber, IsString, IsUrl} from "class-validator";
import {BaseModel} from "./BaseModel";
import * as bcrypt from "bcrypt";

@Entity()
export class User extends BaseModel {
    @Column({length: 45})
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

    @Column({length: 45})
    password!: string;

    public static comparePassword(user: User, password: string): Promise<boolean> {
        return new Promise((resolve, reject) => {
            bcrypt.compare(password, user.password, (err, res) => {
                resolve(res === true);
            });
        });
    }

    public static hashPassword(password: string): Promise<string> {
        return new Promise((resolve, reject) => {
            bcrypt.hash(password, 10, (err, hash) => {
                if (err) {
                    return reject(err);
                }
                resolve(hash);
            });
        });
    }
}
