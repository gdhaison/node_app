import {EntityManager, EntityRepository, Repository} from "typeorm";
import {Service} from "typedi";
import {InjectManager} from "typeorm-typedi-extensions";
import {LwWeightlossAreaPartner} from "../models/LwWeightlossAreaPartner";

@Service()
@EntityRepository(LwWeightlossAreaPartner)
export class LwWeightLossAreaPartnerRepository extends Repository<LwWeightlossAreaPartner> {
    constructor(@InjectManager() private entityManager: EntityManager) {
        super();
    }

    bulkInsert(data: Partial<LwWeightlossAreaPartner>[]) {
        return this.createQueryBuilder()
            .insert()
            .into(LwWeightlossAreaPartner)
            .values(data)
            .execute();
    };
}
