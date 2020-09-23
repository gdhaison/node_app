import {EntityManager, EntityRepository, In, Repository} from "typeorm";
import {Service} from "typedi";
import {InjectManager} from "typeorm-typedi-extensions";
import {LwWeightLossArea} from "../models/LwWeightLossArea";

@Service()
@EntityRepository(LwWeightLossArea)
export class LwWeightLossAreaRepository extends Repository<LwWeightLossArea> {
    constructor(@InjectManager() private entityManager: EntityManager) {
        super();
    }

    async getByName(data: string[]): Promise<LwWeightLossArea[]> {
        // return this.entityManager.createQueryBuilder(LwWeightLossArea, "lossArea")
        //     .where("lossArea.name IN (:...names)", {names: data})
        //     .orderBy("lossArea.createDate")
        //     .getMany();

        return await this.entityManager.getRepository(LwWeightLossArea)
            .find({
                where: {name: In(data)},
                order: {createDate: "ASC"},
            });
    };
}
