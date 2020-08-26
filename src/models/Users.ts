import {Column, Entity, Unique} from "typeorm";
import {IsDate, IsEmail, IsPhoneNumber, IsString, IsUrl} from "class-validator";
import {BaseModel} from "./BaseModel";
import * as bcrypt from "bcrypt";

@Entity()
@Unique(["email"])
export class Users extends BaseModel {
    constructor(id: number, name: string, fullName: string) {
        super();
        this.id = id;
        this.name = name;
        this.fullName = fullName;
    }

    @Column({length: 10})
    @IsString()
    name!: string;

    @Column({length: 200})
    @IsString()
    fullName!: string;

    @Column({length: 25})
    // @IsPhoneNumber("KR")
    phone!: string;

    @Column({length: 35})
    @IsEmail()
    email!: string;

    @Column({length: 45})
    password!: string;

    @Column({length: 200})
    address!: string;

    @Column({length: 200})
    avatar!: string;

    @Column({type: "date"})
    @IsDate()
    birthday!: Date;

    @IsDate()
    @Column({nullable: true, type: "date", default: null})
    deletedAt?: Date | null;

    public static comparePassword(user: Users, password: string): Promise<boolean> {
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
