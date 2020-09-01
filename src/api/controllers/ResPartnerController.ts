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
    async create(@Body() user: Partial<UserCreateRequest>) {
        return this._resPartnerService.create(user).then(function (result) {
            const res = JSON.parse(JSON.stringify(result));
            const jwt = Authentication.generateToken(result.phone);
            return snakeCase({
                id: res.id,
                access_token: jwt,
                full_name: "",
                email: res.email,
                phone: res.phone,
                avatar: "",
                address: res.address,
                dob: res.dob,
                gender: res.gender,
                height: res.height,
                weight: res.weight,
                target_weight: res.target_weight,
                physical: res.physical,
                muscle: res.muscle,
            });
        });
    }

    @Put("/infor")
    update(@CurrentUser({required: true}) user: ResPartner, @Body() form: any, @UploadedFile("avatar") fileAvatar: File) {
        form.avatar = fileAvatar.originalname;
        return this._resPartnerService.changeInfoUser(form, user).then(function (result) {
            return result;
        });
    }

    @Delete("/:id")
    remove(@Param("id") id: number, @QueryParam("search") search: string) {
        throw new UserNotFoundError();
    }

    @Post("/login")
    public async signIn(@Body() user: any) {
        const {phone, password} = user;
        const resPartners = await this._resPartnerService.getByPhone(phone);
        const userLogin = resPartners[0];
        if (!userLogin) {
            return {message: `User not found with phone ${phone}`};
        }

        const validPassword = await argon2.verify(userLogin.password, password);
        if (!validPassword) {
            return {message: `Login with phone ${phone} error, password not valid!`};
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
            dob: userLogin.dob,
            gender: userLogin.gender,
            height: userLogin.height,
            weight: userLogin.weight,
            target_weight: userLogin.targetWeight,
            physical: `${userLogin.physical}`,
            muscle: `${userLogin.muscle}`,
        };
    }

}
