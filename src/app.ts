// import express, {NextFunction, Request, Response} from "express";
// import compression from "compression"; //compresses requests
// import bodyParser from "body-parser";
// import lusca from "lusca";
//
// import * as userController from "./controllers/user";
// import * as apiController from "./controllers/api";
//
// // Create Express server
// const app = express();
//
// // Express configuration
// app.set("port", process.env.PORT || 3000);
// app.use(compression());
// app.use(bodyParser.json());
// app.use(bodyParser.urlencoded({extended: true}));
// app.use(lusca.xframe("SAMEORIGIN"));
// app.use(lusca.xssProtection(true));
//
// /**
//  * Login Required middleware.
//  */
// export const isAuthenticated = (req: Request, res: Response, next: NextFunction) => {
//     console.log("isAuthenticated");
//     next();
// };
//
// /**
//  * Authorization Required middleware.
//  */
// export const isAuthorized = (req: Request, res: Response, next: NextFunction) => {
//     console.log("isAuthorized");
//     next();
// };
//
// /**
//  * Primary app routes.
//  */
// app.get("/", apiController.index);
// app.post("/login", userController.postLogin);
// app.get("/logout", userController.logout);
// app.post("/forgot", userController.postForgot);
// app.get("/signup", userController.getSignup);
// app.post("/signup", userController.postSignup);
// app.get("/account", isAuthenticated, userController.getAccount);
// app.get("/account/profile", isAuthenticated, userController.userInfor);
// app.post("/account/profile", isAuthenticated, userController.postUpdateProfile);
// app.post("/account/password", isAuthenticated, userController.postUpdatePassword);
// app.post("/account/delete", isAuthenticated, userController.postDeleteAccount);
// app.get("/api", apiController.getApi);
//
//
// export default app;
