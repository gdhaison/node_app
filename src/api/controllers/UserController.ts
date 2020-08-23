import {Body, Delete, Get, JsonController, Param, Post, Put, UseAfter, UseBefore} from "routing-controllers";
import {Authentication, Authorization} from "../../middlewares";
import {UserService} from "../../services/UserService";

@JsonController("/users")
@UseBefore(Authentication)
@UseAfter(Authorization)
export class UserController {
    constructor(
        private _userService: UserService
    ) { }

    @Get()
    async getAll() {
        const user1 = await this._userService.getById(1);
        const user = await this._userService.findById(1);
        return user;
    }

    @Get("/:id")
    getOne(@Param("id") id: number) {
        return "This action returns user #" + id;
    }

    @Post()
    post(@Body() user: any) {
        return "Saving user...";
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
