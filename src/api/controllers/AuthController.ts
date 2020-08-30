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



}
