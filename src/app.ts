import "reflect-metadata";
import "./utils/env";
import {connectDatabase} from "./database/db";
import {authorizationChecker} from "./auth/authorizationChecker";
import {currentUserChecker} from "./auth/currentUserChecker";
import {getConnection} from "typeorm";
import {Container} from "typedi";
import {AuthController, PostController, ResPartnerController} from "./api/controllers";
import {createExpressServer, useContainer} from "routing-controllers";

useContainer(Container);


const PORT = process.env.PORT || 5000;

async function startApplication() {
    try {
        await connectDatabase();
        const connection = getConnection();
        console.log("Database is connected successfully");
        const app = createExpressServer({
            controllers: [ResPartnerController, PostController, AuthController],
            authorizationChecker: authorizationChecker(connection),
            currentUserChecker: currentUserChecker(connection),
        });
        app.listen(PORT);
    } catch (err) {
        console.error(err);
        throw err;
    }
}

startApplication().then(() => {
    console.log(`Server is running on ${PORT}`);
});
