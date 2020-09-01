import {EntityRepository, Repository, Like} from "typeorm";
import {Service} from "typedi";
import {LwFood} from "../models/LwFood";
import {types} from "node-sass";
import Null = types.Null;

@Service()
@EntityRepository(LwFood)
export class LwFoodRepository extends Repository<LwFood> {

    findByNameAndCategory(search_text: string, category: string): Promise<LwFood[] | undefined> {
        let result = this.createQueryBuilder("lwFood").leftJoin("lwFood.category", "lwFoodCategory")
            .where("lwFood.name like '%" + search_text + "%'");
        if(category) {
            result = result.andWhere(
                "lwFoodCategory.code like '%" + category + "%'"
            );
        }

        return result.getMany();
    };

}
