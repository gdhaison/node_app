import {Body, JsonController, Post} from "routing-controllers";
import {ResPartnerService} from "../../services/ResPartnerService";
import {AuthService} from "../../services/AuthService";
import argon2 from "argon2";
import {Authentication} from "../../auth/Authenticate";
import logger from "../../lib/logger/logger";

@JsonController("/auth")
export class AuthController {
    constructor(
        private _resPartnerService: ResPartnerService,
        private _authService: AuthService
    ) {
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
            dob: `${userLogin.dob}`,
            gender: `${userLogin.gender}`,
            height:userLogin.height,
            weight: userLogin.weight,
            target_weight:userLogin.targetWeight,
            physical: `${userLogin.physical}`,
            muscle: `${userLogin.muscle}`,
        };
    }

}
