import {EntityManager, EntityRepository, Repository} from "typeorm";
import {Service} from "typedi";
import {InjectManager} from "typeorm-typedi-extensions";
import {LwWeightLossAreaPartner} from "../models/LwWeightLossAreaPartner";

@Service()
@EntityRepository(LwWeightLossAreaPartner)
export class LwWeightLossAreaPartnerRepository extends Repository<LwWeightLossAreaPartner> {
    constructor(@InjectManager() private entityManager: EntityManager) {
        super();
    }

    bulkInsert(data: Partial<LwWeightLossAreaPartner>[]) {
        return this.createQueryBuilder()
            .insert()
            .into(LwWeightLossAreaPartner)
            .values(data)
            .execute();
    };
}
