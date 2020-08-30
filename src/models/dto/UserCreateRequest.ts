import {IsEmail, IsNumber, IsPhoneNumber, IsString, Matches} from "class-validator";
import {JsonProperty} from "json-object-mapper";

export class UserCreateRequest {
    @IsEmail()
    email!: string;

    @IsString()
    @Matches(RegExp(/^(?=.*\d)(?=.*[a-z])(?=.*[A-Z])[0-9a-zA-Z]{8,}$/))
    password!: string;

    @Matches(RegExp(/^([0-2][0-9]{3})\-(0[1-9]|1[0-2])\-([0-2][0-9]|3[0-1]) ([0-1][0-9]|2[0-3]):([0-5][0-9])\:([0-5][0-9])( ([\-\+]([0-1][0-9])\:00))?$/))
    dob!: string;

    @IsString()
    gender: string;

    @IsPhoneNumber("VN")
    phone!: string;

    @IsString()
    address!: string;

    @IsNumber()
    height!: number;

    @IsNumber()
    weight!: number;

    @JsonProperty({name: "target_weight"})
    target_weight!: number;

    @IsString()
    physical!: string;

    @IsString()
    muscle!: string;

    @JsonProperty({name: "create_date"})
    createDate!: string;

    @JsonProperty({name: "write_date"})
    writeDate!: string;
}
