import {ExpressMiddlewareInterface} from "routing-controllers";

/**
 * Login Required middleware.
 */
export class Authentication implements ExpressMiddlewareInterface {
    use(request: any, response: any, next?: Function): any {
        console.log("logging request from question middleware...");
        next();
    }
}

