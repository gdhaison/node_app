import {EntityRepository, Repository} from "typeorm";
import {Service} from "typedi";
import {Users} from "../models/Users";

@Service()
@EntityRepository(Users)
export class UserRepository extends Repository<Users> {

    findByName(name: string) {
        return this.findOne({name});
    }
}
