import {Get, JsonController, QueryParam} from "routing-controllers";
import express from "express";
import {Param} from "routing-controllers/decorator/Param";
import {Req} from "routing-controllers/decorator/Req";
import {Res} from "routing-controllers/decorator/Res";
import {ExerciseService} from "../../services/ExerciseService";
import {ResPartner} from "../../models";
import {CurrentUser} from "routing-controllers/decorator/CurrentUser";

@JsonController("/exercise-regimes")
export class ExerciseController {

    constructor(
        private _exerciseService: ExerciseService
    ) {
    }

    @Get()
    public async search(@CurrentUser({required: true}) user: ResPartner,
                        @QueryParam("day") day: string,
                        @QueryParam("page") page: number,
                        @QueryParam("page_size") pageSize: number,
                        @Req() req: express.Request, @Res() res: express.Response) {
        return this._exerciseService.paginate({page: page, limit: pageSize}, user.id);
    }

    @Get("/:exercise_id")
    public async getById(@Param("exercise_id") exerciseId: number, @Req() req: express.Request, @Res() res: express.Response) {
        return this._exerciseService.getById(exerciseId);
    }

}
