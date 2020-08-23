import {ExpressMiddlewareInterface} from "routing-controllers";

/**
 * Authorization Required middleware.
 */
export class Authorization implements ExpressMiddlewareInterface {
    use(request: any, response: any, next?: Function): any {
        console.log("logging request from question middleware...");
        next();
    }
}
