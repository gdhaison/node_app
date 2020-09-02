import * as express from "express";
import {ExpressErrorMiddlewareInterface, HttpError, Middleware} from "routing-controllers";

@Middleware({type: "after"})
export class ErrorHandlerMiddleware implements ExpressErrorMiddlewareInterface {

    public error(error: HttpError, req: express.Request, res: express.Response, next: express.NextFunction): void {
        res.status(error.httpCode || 500);
        if (error.httpCode === 404)
            res.json({
                code: "not found url",
            });
        next();
    }
}
