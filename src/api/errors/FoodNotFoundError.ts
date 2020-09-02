import {HttpError} from "routing-controllers/http-error/HttpError";
import {StatusCodes} from "http-status-codes";

export class FoodNotFoundError extends HttpError {
    code: number;
    constructor() {
        super(StatusCodes.NOT_FOUND, "Food not found!");
    }
}
