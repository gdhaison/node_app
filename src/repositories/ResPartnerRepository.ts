import {EntityRepository, Repository} from "typeorm";
import {Service} from "typedi";
import {ResPartner} from "../models/ResPartner";

@Service()
@EntityRepository(ResPartner)
export class ResPartnerRepository extends Repository<ResPartner> {

    findByEmail(email: string) {
        return this.findOne({email});
    }
}
