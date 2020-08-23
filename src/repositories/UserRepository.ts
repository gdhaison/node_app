import {EntityRepository, Repository} from "typeorm";
import {Service} from "typedi";
import {User} from "../models/Users";

@Service()
@EntityRepository(User)
export class UserRepository extends Repository<User> {

    findByName(nickname: string, name: string) {
        return this.findOne({nickname, name});
    }
}
