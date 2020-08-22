import {Service} from "typedi";
import {User} from "../models/Users";
import {BaseService} from "./BaseService";

export interface IuserDTO {
    nickname: string;
    name: string;
    birthday: Date;
    profile: string;
    phone: string;
    email: string;
    deletedAt?: Date;
}

@Service()
export class UserService extends BaseService<User> {
    constructor() {
        super(User);
    }

    async getById(userId: number): Promise<User> {
        const relations: string[] = [];
        console.log("userId ===>:" + userId);
        return super.getById(userId, relations);
    }

}
