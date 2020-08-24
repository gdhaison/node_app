import {Body, JsonController, Post} from "routing-controllers";
import {UserService} from "../../services/UserService";
import {Users} from "../../models";

@JsonController("/auth")
export class AuthController {
    constructor(
        private _userService: UserService
    ) {
    }

    // @Post("/sign-up")
    // public signUp(@Body() user: any): Promise<User> {
    //     const userSave = new User();
    //     userSave.birthday = new Date("2020-08-22T18:01:07");
    //     userSave.email = "hoa9x31111@gmail.com";
    //     userSave.name = "Quang Hoa";
    //     userSave.nickname = "hoaronal";
    //     userSave.phone = "0939300981";
    //     userSave.profile = "Hahahah";
    //     userSave.createdAt = new Date("2020-08-22T18:01:07");
    //     userSave.deletedAt = new Date("2020-08-22T18:01:07");
    //     userSave.updatedAt = new Date("2020-08-22T18:01:07");
    //     userSave.password = "Quanghoa1993";
    //     return this._userService.create(userSave);
    // }

    @Post("sign-in")
    public signIn(@Body() user: any) {
        return "Saving user...";
    }

}
