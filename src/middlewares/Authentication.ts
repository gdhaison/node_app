import {ExpressMiddlewareInterface} from "routing-controllers";
import httpStatus from "http-status";

/**
 * Login Required middleware.
 */
export class Authentication implements ExpressMiddlewareInterface {
    use(request: any, response: any, next?: Function): any {
        console.log("logging request from question middleware...");
        if (request.headers.authauthorization) {
            next();
        } else {
            response.status(httpStatus.INTERNAL_SERVER_ERROR).json({
                name: "INTERNAL_SERVER_ERROR",
                message: "INTERNAL_SERVER_ERROR",
                errors: [],
            });
        }
    }
}

