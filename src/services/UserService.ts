import {Service} from "typedi";
import {User} from "../models/Users";
import {BaseService} from "./BaseService";
import {OrmRepository} from "typeorm-typedi-extensions";
import {UserRepository} from "../repositories/UserRepository";

@Service()
export class UserService extends BaseService<User> {
    constructor(@OrmRepository() private userRepository: UserRepository) {
        super(User);
    }

    public async getById(id: number): Promise<User | undefined> {
        const relations: string[] = [];
        console.log("userId ===>:" + id);
        return super.getById(id, relations);
    }

    public findById(id: number): Promise<User | undefined> {
        return this.userRepository.findOne({id});
    }

    public async create(user: User): Promise<User> {
        const newUser = await this.userRepository.save(user);
        return newUser;
    }

}
