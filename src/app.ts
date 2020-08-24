import "reflect-metadata";
import "./utils/env";
import {connectDatabase} from "./database/db";
import {createExpressServer, useContainer} from "routing-controllers";
import {PostController, UserController, AuthController} from "./api/controllers";
import { Container } from "typedi";

useContainer(Container);

const app = createExpressServer({
    controllers: [UserController, PostController, AuthController]
});

const PORT = process.env.PORT || 5000;

async function startApplication() {
    try {
        await connectDatabase();
        console.log("Database is connected successfully");
        app.listen(PORT);
    } catch (err) {
        console.error(err);
        throw err;
    }
}

startApplication().then(() => {
    console.log(`Server is running on ${PORT}`);
});
