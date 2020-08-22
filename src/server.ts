import errorHandler from "errorhandler";
import {connectDatabase} from "./database/db";
import app from "./app";

const PORT = app.get("port");

/**
 * Error Handler. Provides full stack - remove for production
 */
app.use(errorHandler());

function runServer(port: number) {
    return new Promise((resolve, reject) => {
        app.listen(port, (err: any) => {
            if (err) {
                reject(err);
            }
            resolve();
        });
    });
}

async function startApplication() {
    try {
        await connectDatabase();
        console.log("Database is connected successfully");
        await runServer(PORT);
        console.log(`Server is running on ${PORT}`);
    } catch (err) {
        console.error(err);
        throw err;
    }
}

startApplication();
