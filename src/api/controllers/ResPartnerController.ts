import {
    Body,
    CurrentUser,
    Delete,
    Get,
    JsonController,
    Param,
    Post,
    Put,
    QueryParam,
    Req,
    Res,
    UploadedFile,
    UseBefore
} from "routing-controllers";
import {ResPartnerService} from "../../services/ResPartnerService";
import {ResPartner} from "../../models";
import {UserNotFoundError} from "../errors/UserNotFoundError";
import bodyParser from "body-parser";
import argon2 from "argon2";
import logger from "../../lib/logger/logger";
import {Authentication} from "../../auth/Authenticate";
import snakeCase from "snakecase-keys";
import {UserCreateRequest} from "../../models/dto/UserCreateRequest";
import {StatusCodes} from "http-status-codes";
import {ErrorCode} from "../../enums/ErrorCode";
import express from "express";
import {UserInfoRequest} from "../../models/dto/UserInfoRequest";
import {addPhoto} from "../../utils/S3Utils";
import {S3Album} from "../../enums/S3Album";
import {UserChangePasswordRequest} from "../../models/dto/UserChangePasswordRequest";
type File = Express.Multer.File;

@JsonController("/users")
@UseBefore(bodyParser.urlencoded({extended: true}))
export class ResPartnerController {
    constructor(
        private _resPartnerService: ResPartnerService
    ) {
    }

    @Get()
    getAll(@CurrentUser({required: true}) user: ResPartner) {
        return this._resPartnerService.getAll();
    }

    @Get("/:id")
    async getById(@Param("id") id: number) {
        return await this._resPartnerService.getById(id);
    }

    @Post("/register")
    async create(@Body() user: UserCreateRequest) {
        return this._resPartnerService.create(user).then(function (result) {
            const jwt = Authentication.generateToken(result.phone);
            return snakeCase({
                id: result.id,
                access_token: jwt,
                full_name: result.name,
                email: result.email,
                phone: result.phone,
                avatar: result.avatar,
                address: result.address,
                dob: result.dob,
                gender: result.gender,
                height: result.height,
                weight: result.weight,
                target_weight: result.targetWeight,
                physical: result.physical,
                muscle: user.muscle,
            });
        });
    }

    @Put("/infor")
    update(@CurrentUser({required: true}) user: ResPartner, @Body() form: UserInfoRequest,
           @UploadedFile("avatar") fileAvatar: File) {
        let location: string = "";
        if (fileAvatar) {
            logger.info(`File name avatar is ===>>>: ${fileAvatar.originalname}`);
            location = addPhoto(S3Album.AVATAR, fileAvatar, {width: 256, height: 256});
        }
        return this._resPartnerService.changeInfoUser(form, user, location).then(function (result) {
            const jwt = Authentication.generateToken(result.phone);
            return {
                id: result.id,
                access_token: jwt,
                full_name: result.name,
                email: result.email,
                phone: result.phone,
                avatar: location,
                address: result.address,
                dob: result.xLwDob,
                gender: result.xLwGender,
                height: result.xLwHeight,
                weight: result.xLwWeight,
                target_weight: result.xLwExpectedWeight,
                physical: result.physical,
                muscle: result.muscle,
            };
        });
    }

    @Delete("/:id")
    remove(@Param("id") id: number, @QueryParam("search") search: string) {
        throw new UserNotFoundError();
    }

    @Post("/login")
    public async signIn(@Req() req: express.Request, @Res() res: express.Response, @Body() user: any) {
        const {phone, password} = user;
        const resPartners = await this._resPartnerService.getByPhone(phone);
        const userLogin = resPartners[0];
        if (!userLogin) {
            res.status(StatusCodes.NOT_FOUND);
            return {
                message: `User not found with phone ${phone}`,
                code: ErrorCode.USER_NOT_FOUND,
                status: StatusCodes.NOT_FOUND,
            };
        }
        const validPassword = await argon2.verify(userLogin.xLwPassword, password);
        if (!validPassword) {
            res.status(StatusCodes.UNAUTHORIZED);
            return {
                message: `Login with phone ${phone} error, password not valid!`,
                code: ErrorCode.PASSWORD_INVALID,
                status: StatusCodes.UNAUTHORIZED,
            };
        }
        logger.info("Password is valid!");
        logger.info("Generating JWT");
        const jwt = Authentication.generateToken(phone);
        return {
            id: `${userLogin.id}`,
            access_token: jwt,
            full_name: `${userLogin.name}`,
            email: `${userLogin.email}`,
            phone: `${userLogin.phone}`,
            avatar: `${userLogin.avatar}`,
            address: `${userLogin.address}`,
            dob: userLogin.xLwDob,
            gender: userLogin.xLwGender,
            height: userLogin.xLwHeight,
            weight: userLogin.xLwWeight,
            target_weight: userLogin.xLwExpectedWeight,
            physical: `${userLogin.physical}`,
            muscle: `${userLogin.muscle}`,
        };
    }

    @Post("/facebook/login")
    public async signInFacebook(@Req() req: express.Request, @Res() res: express.Response, @Body() user: any) {
        const userId = user.user_id;
        const resPartners = await this._resPartnerService.getByFacebookUserId(user.user_id);
        const userLogin = resPartners[0];
        const jwt = Authentication.generateToken(userId);
        if (!userLogin) {
            return this._resPartnerService.create(user).then(function (result) {
                return {
                    id: result.id,
                    access_token: jwt,
                    full_name: result.name,
                    email: result.email,
                    phone: result.phone,
                    avatar: result.avatar,
                    address: result.address,
                    dob: result.dob,
                    gender: result.gender,
                    height: result.height,
                    weight: result.weight,
                    target_weight: result.targetWeight,
                    physical: result.physical,
                    muscle: user.muscle,
                };
            });
        } else {
            return {
                id: `${userLogin.id}`,
                userId: `${userId}`,
                access_token: jwt,
                full_name: `${userLogin.name}`,
                email: `${userLogin.email}`,
                phone: `${userLogin.phone}`,
                avatar: `${userLogin.avatar}`,
                address: `${userLogin.address}`,
                dob: userLogin.xLwDob,
                gender: userLogin.xLwGender,
                height: userLogin.xLwHeight,
                weight: userLogin.xLwWeight,
                target_weight: userLogin.xLwExpectedWeight,
                physical: `${userLogin.physical}`,
                muscle: `${userLogin.muscle}`,
            };
        }
    }

    @Put("/change-password")
    async changePassword(@CurrentUser({required: true}) user: ResPartner,@Res() res: express.Response, @Body() form: UserChangePasswordRequest) {
        res.status(StatusCodes.NO_CONTENT);
        return await this._resPartnerService.changePassword(form, user);
    }
}
