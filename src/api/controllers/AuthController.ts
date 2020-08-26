import {Body, JsonController, Post} from "routing-controllers";
import {ResPartnerService} from "../../services/ResPartnerService";
import {AuthService} from "../../services/AuthService";
import jwt from "jsonwebtoken";

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
        const userRecord = await this._resPartnerService.getByPhone(phone);
        const token = jwt.sign(user, "quangHoa", {expiresIn: 3600});
        const refreshToken = jwt.sign(user, "quangHoa", {expiresIn: 86400});
        // const { users, token } = await this._authService.SignIn(email, password);
        return user;
    }

}
