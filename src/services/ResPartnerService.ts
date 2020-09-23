import {Service} from "typedi";
import {Users, ResPartner, LwFood} from "../models";
import {BaseService} from "./BaseService";
import {OrmRepository} from "typeorm-typedi-extensions";
import {ResPartnerRepository} from "../repositories/ResPartnerRepository";
import {UserCreateRequest} from "../models/dto/UserCreateRequest";
import argon2 from "argon2";
import logger from "../lib/logger/logger";
import {randomBytes} from "crypto";
import {UserExitsError} from "../api/errors/UserExitsError";
import {UserInfoRequest} from "../models/dto/UserInfoRequest";
import {UserChangePasswordRequest} from "../models/dto/UserChangePasswordRequest";
import {WrongPasswordErrors} from "../api/errors/WrongPasswordErros";
import {StatusCodes} from "http-status-codes";
import {LwWeightLossAreaPartnerRepository} from "../repositories/LwWeightLossAreaPartnerRepository";
import {LwWeightLossAreaPartner} from "../models/LwWeightLossAreaPartner";
import {LwWeightLossAreaRepository} from "../repositories/LwWeightLossAreaRepository";
import {LwWeightLossArea} from "../models/LwWeightLossArea";


@Service()
export class ResPartnerService extends BaseService<ResPartner> {
    constructor(@OrmRepository() private _resPartnerRepository: ResPartnerRepository,
                @OrmRepository() private _lwWeightLossAreaPartnerRepository: LwWeightLossAreaPartnerRepository,
                @OrmRepository() private _lwWeightLossAreaRepository: LwWeightLossAreaRepository) {
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

    public async changeInfoUser(userInfo: UserInfoRequest, user: ResPartner, avatarLocation: string): Promise<ResPartner> {
        if (userInfo.name) {
            user.name = userInfo.name;
        }
        if (userInfo.email) {
            user.email = userInfo.email;
        }
        if (userInfo.address) {
            user.address = userInfo.address;
        }
        if (userInfo.address) {
            user.avatar = avatarLocation;
        }
        user.writeDate = new Date();
        return this._resPartnerRepository.save(user);
    }

    public async create(user: UserCreateRequest): Promise<any> {
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
        payload.createDate = new Date();
        payload.writeDate = new Date();

        const muscleData: Partial<LwWeightLossAreaPartner>[] = [];
        const lwWeightLossAreaPartner: Partial<LwWeightLossAreaPartner> = {};
        const now = new Date();
        const userDb = await this._resPartnerRepository.save(payload);

        const weightLossArea = await this._lwWeightLossAreaRepository.getByName(user.muscle);

        weightLossArea.forEach((item: LwWeightLossArea) => {
            lwWeightLossAreaPartner.partnerId = userDb.id;
            lwWeightLossAreaPartner.weightLossAreaId = item.id;
            lwWeightLossAreaPartner.active = true;
            lwWeightLossAreaPartner.createDate = now;
            lwWeightLossAreaPartner.writeDate = now;
            muscleData.push(lwWeightLossAreaPartner);
        });
        await this._lwWeightLossAreaPartnerRepository.bulkInsert(muscleData);
        return userDb;
    }

    public async changePassword(userInfo: UserChangePasswordRequest, user: ResPartner): Promise<ResPartner> {
        const {old_pass, new_pass} = userInfo;
        const oldPassVerify = await argon2.verify(user.password, old_pass);

        if (!oldPassVerify) {
            throw new WrongPasswordErrors(StatusCodes.UNAUTHORIZED);
        }

        const salt = randomBytes(32);
        const password= await argon2.hash(new_pass, {salt});
        if (userInfo.new_pass) {
            user.password = password;
        }
        user.writeDate = new Date();
        return this._resPartnerRepository.save(user);
    }
}
