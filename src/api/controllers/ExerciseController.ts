import {JsonController, Get, QueryParam} from "routing-controllers";
import express from "express";
import {Param} from "routing-controllers/decorator/Param";
import {Req} from "routing-controllers/decorator/Req";
import {Res} from "routing-controllers/decorator/Res";
import {ExerciseService} from "../../services/ExerciseService";

@JsonController("/exercise-regimes")
export class ExerciseController {

    constructor(
        private _exerciseService: ExerciseService
    ) {
    }

    @Get()
    public async search(@QueryParam("day") day: string,
                        @QueryParam("page") page: number,
                        @QueryParam("page_size") pageSize: number,
                        @Req() req: express.Request, @Res() res: express.Response) {
        return this._exerciseService.paginate({
            page: page,
            limit: pageSize
        });
    }

    @Get("/:exercise_id")
    public async getById(@Param("exercise_id") exerciseId: number, @Req() req: express.Request, @Res() res: express.Response) {
        return this._exerciseService.getById(exerciseId);
    }

}
