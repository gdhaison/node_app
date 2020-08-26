import {Action} from "routing-controllers";
import {Connection} from "typeorm";
import {Authentication} from "../utils/Authenticate";
import {Users} from "../models/Users";

export function currentUserChecker(connection: Connection): (action: Action) => Promise<Users | undefined> {
    return async function innerCurrentUserChecker(action: Action): Promise<Users | undefined> {
        const jwt: string = action.request.headers.authorization as string;
        if (jwt !== undefined) {
            const bearerToken = jwt.replace(/Bearer\s/, "");
            const token = Authentication.refreshToken(bearerToken);
            action.response.setHeader("authorization", `Bearer ${token}`);
        }
        const userRepository = connection.getRepository(Users);
        return userRepository.findOne(1);
    };
}
