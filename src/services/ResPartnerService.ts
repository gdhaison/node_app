import {Service} from "typedi";
import {Users, ResPartner} from "../models";
import {BaseService} from "./BaseService";
import {OrmRepository} from "typeorm-typedi-extensions";
import {ResPartnerRepository} from "../repositories/ResPartnerRepository";
import {UserCreateRequest} from "../models/dto/UserCreateRequest";
import {DateUtils} from "../utils/DateUtils";
import argon2 from "argon2";
import logger from "../lib/logger/logger";
import {randomBytes} from "crypto";
import {UserExitsError} from "../api/errors/UserExitsError";
import {UserInfoRequest} from "../models/dto/UserInfoRequest";

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

    public async changeInfoUser(userInfo: UserInfoRequest, user: ResPartner): Promise<ResPartner> {
        if (userInfo.name) {
            user.name = userInfo.name;
        }
        if (userInfo.email) {
            user.email = userInfo.email;
        }
        if (userInfo.address) {
            user.address = userInfo.address;
        }
        user.writeDate = new Date();
        user.avatar = "";
        return this._resPartnerRepository.save(user);
    }

    public async create(user: UserCreateRequest): Promise<ResPartner> {
        logger.info(user);
        const userValid = await this.getByPhone(user.phone);
        if (userValid && userValid.length > 0)
            throw new UserExitsError();

        const salt = randomBytes(32);
        const payload: Partial<ResPartner> = {};
        if (user.email) {
            payload.email = user.email;
        }
        if (user.name) {
            payload.name = user.name;
            payload.displayName = user.name;
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
