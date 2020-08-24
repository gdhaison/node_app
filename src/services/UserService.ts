import {Service} from "typedi";
import {Users} from "../models/Users";
import {BaseService} from "./BaseService";
import {OrmRepository} from "typeorm-typedi-extensions";
import {UserRepository} from "../repositories/UserRepository";

@Service()
export class UserService extends BaseService<Users> {
    constructor(@OrmRepository() private userRepository: UserRepository) {
        super(Users);
    }

    public async getAll(): Promise<Users[] | undefined> {
        return this.userRepository.find();
    }

    public async getById(id: number): Promise<Users | undefined> {
        const relations: string[] = [];
        console.log("userId ===>:" + id);
        return super.getById(id, relations);
    }

    public findById(id: number): Promise<Users | undefined> {
        return this.userRepository.findOne({id});
    }

    public async create(user: Users): Promise<Users> {
        const newUser = await this.userRepository.save(user);
        return newUser;
    }

}
