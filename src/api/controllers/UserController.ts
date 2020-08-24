import {Body, Delete, Get, JsonController, Param, Post, Put, UseBefore} from "routing-controllers";
import {Authentication} from "../../middlewares";
import {UserService} from "../../services/UserService";
import {Users} from "../../models";

@JsonController("/users")
@UseBefore(Authentication)
export class UserController {
    constructor(
        private _userService: UserService
    ) { }

    @Get()
    async getAll() {
        return await this._userService.getAll();
    }

    @Get("/:id")
    async getById(@Param("id") id: number) {
        return await this._userService.getById(id);
    }

    @Post()
    create(@Body() user: any): Promise<Users> {
        const currentDate = new Date();
        const userSave = new Users();
        userSave.birthday = currentDate;
        userSave.email = user.email;
        userSave.name = user.name;
        userSave.phone = user.phone;
        userSave.createdAt = currentDate;
        userSave.updatedAt = currentDate;
        userSave.password = user.password;
        return this._userService.create(user);
    }

    @Put("/:id")
    put(@Param("id") id: number, @Body() user: any) {
        return "Updating a user...";
    }

    @Delete("/:id")
    remove(@Param("id") id: number) {
        return "Removing user...";
    }

}
