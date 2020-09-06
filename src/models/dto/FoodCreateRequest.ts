import {IsNotEmpty, IsNumber, IsString} from "class-validator";

export class FoodCreateRequest {
    @IsString()
    @IsNotEmpty()
    image!: string;

    @IsString()
    name!: string;

    @IsNumber()
    calo!: number;

    @IsString()
    description!: string;
}
