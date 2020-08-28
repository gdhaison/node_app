import {
    Body,
    CurrentUser,
    Delete,
    Get,
    JsonController,
    Param,
    QueryParam,
    Post,
    Put,
    UseBefore, UploadedFile
} from "routing-controllers";
import {ResPartnerService} from "../../services/ResPartnerService";
import {ResPartner} from "../../models";
import {UserNotFoundError} from "../errors/UserNotFoundError";
import bodyParser from "body-parser";
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
    create(@Body() user: any){
        const response = this._resPartnerService.create(user).then(function(result) {
            const res = JSON.parse(JSON.stringify(result));
            res.accessToken = "";
            return res;
        });
        return response;
    }

    @Put("/infor/:id")
    update(@Param("id") id: number, @Body() form: any, @UploadedFile("avatar") fileAvatar: File) {
        form.avatar = fileAvatar.originalname;
        const response = this._resPartnerService.changeInfoUser(form, id).then(function(result) {
            return result;
        });
        return response;
    }

    @Delete("/:id")
    remove(@Param("id") id: number, @QueryParam("search") search: string) {
        throw new UserNotFoundError();

        return "Removing user...";
    }

}
