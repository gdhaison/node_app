import {Body, CurrentUser, Delete, Get, JsonController, Param, Post, Put, UseBefore} from "routing-controllers";
import {Authentication} from "../../middlewares";
import {ResPartnerService} from "../../services/ResPartnerService";
import {Users} from "../../models";
import {UserCreateRequest} from "../../models/dto/UserCreateRequest";

@JsonController("/users")
export class ResPartnerController {
    constructor(
        private _resPartnerService: ResPartnerService
    ) {
    }

    @Get()
    @UseBefore(Authentication)
    getAll(@CurrentUser({required: true}) user: Users) {
        return this._resPartnerService.getAll();
    }

    @Get("/:id")
    async getById(@Param("id") id: number) {
        return await this._resPartnerService.getById(id);
    }

    @Post("/register")
    create(@Body() user: UserCreateRequest){
        const response = this._resPartnerService.create(user).then(function(result) {
            const res = JSON.parse(JSON.stringify(result));
            res.accessToken = "";
            return res;
        });
        return response;
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
