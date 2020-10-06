import {IsEmail, IsNumber, IsPhoneNumber, IsString, Matches} from "class-validator";
import {JsonProperty} from "json-object-mapper";

export class UserInfoRequest {
    @IsEmail()
    email!: string;

    @IsString()
    name!: string;

    @IsString()
    address!: string;

    weight!: number;

    height!: number;
}
