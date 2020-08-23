import "reflect-metadata";
import "./utils/env";
import {connectDatabase} from "./database/db";
import {createExpressServer, useContainer} from "routing-controllers";
import {PostController, UserController} from "./api/controllers";
import { Container } from "typedi";

useContainer(Container);

const app = createExpressServer({
    controllers: [UserController, PostController]
});

const PORT = 3001;

async function startApplication() {
    try {
        await connectDatabase();
        console.log("Database is connected successfully");
        app.listen(3001);
    } catch (err) {
        console.error(err);
        throw err;
    }
}

startApplication().then(() => {
    console.log(`Server is running on ${PORT}`);
});
