import {EntityRepository, Repository} from "typeorm";
import {Service} from "typedi";
import {ResPartner} from "../models/ResPartner";

@Service()
@EntityRepository(ResPartner)
export class ResPartnerRepository extends Repository<ResPartner> {

    updateInfo(userInfo: any, id: number) {
        return this.createQueryBuilder().update(ResPartner).set({
            email: userInfo.email,
            address: userInfo.address,
            avatar: userInfo.avatar
        }).where("id = :id", {id: id}).execute();
    };
}
