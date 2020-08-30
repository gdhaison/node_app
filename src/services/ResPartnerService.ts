import {Service} from "typedi";
import {Users} from "../models/Users";
import {BaseService} from "./BaseService";
import {OrmRepository} from "typeorm-typedi-extensions";
import {ResPartnerRepository} from "../repositories/ResPartnerRepository";
import {ResPartner} from "../models/ResPartner";
import {UserCreateRequest} from "../models/dto/UserCreateRequest";
import {DateUtils} from "../utils/DateUtils";
import argon2 from "argon2";
import logger from "../lib/logger/logger";
import {randomBytes} from "crypto";
import {UpdateResult} from "typeorm/query-builder/result/UpdateResult";
import {UserNotFoundError} from "../api/errors/UserNotFoundError";

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

    public async getByEmail(email: string): Promise<ResPartner[] | undefined> {
        return this._resPartnerRepository.find({email});
    }

    public async getById(id: number): Promise<ResPartner | undefined> {
        return this._resPartnerRepository.findOne({id});
    }

    public async changeInfoUser(userInfo: any, user: ResPartner): Promise<ResPartner> {
        if (userInfo.email) {
            user.email = userInfo.email;
        }
        if (userInfo.avatar) {
            user.avatar = userInfo.avatar;
        }
        if (userInfo.address) {
            user.address = userInfo.address;
        }
        user.writeDate = new Date();
        return this._resPartnerRepository.save(user);
    }

    public async create(user: UserCreateRequest): Promise<ResPartner> {
        logger.info(user);
        const userValid = await this.getByPhone(user.phone);
        if (userValid && userValid.length > 0)
            throw new UserNotFoundError(`User already exists with phone ${user.phone}!`);

        const salt = randomBytes(32);
        const payload: Partial<ResPartner> = {};
        const now = DateUtils.now("YYYY-MM-DD HH:mm:ss");
        user.createDate = now;
        user.writeDate = now;
        if (user.email) {
            payload.email = user.email;
        }
        if (user.password) {
            payload.password = await argon2.hash(user.password, {salt});
        }
        if (user.dob) {
            payload.dob = new Date(user.dob);
        }
        if (user.gender) {
            payload.gender = user.gender;
        }
        if (user.phone) {
            payload.phone = user.phone;
        }
        if (user.address) {
            payload.address = user.address;
        }
        if (user.height) {
            payload.height = user.height;
        }
        if (user.weight) {
            payload.weight = user.weight;
        }
        if (user.target_weight) {
            payload.targetWeight = user.target_weight;
        }
        if (user.physical) {
            payload.physical = user.physical;
        }
        if (user.muscle) {
            payload.muscle = user.muscle;
        }
        payload.createDate = new Date();
        payload.writeDate = new Date();
        return this._resPartnerRepository.save(payload);
    }

}
