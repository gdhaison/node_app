import express, {NextFunction, Request, Response} from "express";
import compression from "compression";  //compresses requests
import bodyParser from "body-parser";
import lusca from "lusca";
import flash from "express-flash";

// Controllers (route handlers)
import * as userController from "./controllers/user";
import * as apiController from "./controllers/api";
import _ from "lodash";

// Create Express server
const app = express();


// Express configuration
app.set("port", process.env.PORT || 3000);
app.use(compression());
app.use(bodyParser.json());
app.use(bodyParser.urlencoded({ extended: true }));
app.use(flash());
app.use(lusca.xframe("SAMEORIGIN"));
app.use(lusca.xssProtection(true));

// app.use((req, res, next) => {
//     res.locals.user = req.user;
//     next();
// });


/**
 * Login Required middleware.
 */
export const isAuthenticated = (req: Request, res: Response, next: NextFunction) => {

    res.redirect("/login");
};

/**
 * Authorization Required middleware.
 */
export const isAuthorized = (req: Request, res: Response, next: NextFunction) => {
    const provider = req.path.split("/").slice(-1)[0];

    // const user = req.user as UserDocument;
    // if (_.find(user.tokens, { kind: provider })) {
    //     next();
    // } else {
    //     res.redirect(`/auth/${provider}`);
    // }
};


/**
 * Primary app routes.
 */
app.get("/", apiController.index);
app.post("/login", userController.postLogin);
app.get("/logout", userController.logout);
app.post("/forgot", userController.postForgot);
app.get("/signup", userController.getSignup);
app.post("/signup", userController.postSignup);
app.get("/account", isAuthenticated, userController.getAccount);
app.post("/account/profile", isAuthenticated, userController.postUpdateProfile);
app.post("/account/password", isAuthenticated, userController.postUpdatePassword);
app.post("/account/delete", isAuthenticated, userController.postDeleteAccount);

/**
 * API examples routes.
 */
app.get("/api", apiController.getApi);


export default app;
