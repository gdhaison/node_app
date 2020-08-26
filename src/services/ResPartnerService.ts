import {Service} from "typedi";
import {Users} from "../models/Users";
import {BaseService} from "./BaseService";
import {OrmRepository} from "typeorm-typedi-extensions";
import {ResPartnerRepository} from "../repositories/ResPartnerRepository";
import {ResPartner} from "../models/ResPartner";
import {UserCreateRequest} from "../models/dto/UserCreateRequest";
import {DateUtils} from "../utils/DateUtils";
import logger from "../lib/logger/logger";

@Service()
export class ResPartnerService extends BaseService<ResPartner> {

    constructor(@OrmRepository() private _resPartnerRepository: ResPartnerRepository) {
        super(Users);
    }

    public async getAll(): Promise<ResPartner[] | undefined> {
        return this._resPartnerRepository.find();
    }

    public async getByPhone(phone: string): Promise<ResPartner[] | undefined> {
        return this._resPartnerRepository.find({phone});
    }

    public async getById(id: number): Promise<ResPartner | undefined> {
        return this._resPartnerRepository.findOne({id});
    }

    public create(user: UserCreateRequest): Promise<ResPartner> {
        logger.info(user);
        const now = DateUtils.dateToString(new Date(), "YYYY-MM-DD HH:mm:ss");
        user.createDate = now;
        user.writeDate = now;
        return this._resPartnerRepository.save(user);
    }

}
