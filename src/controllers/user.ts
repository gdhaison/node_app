import {NextFunction, Request, Response} from "express";
import {check, sanitize, validationResult} from "express-validator";
import {Container} from "typedi";
import {UserService} from "../services/UserService";

/**
 * Sign in using email and password.
 * @route POST /login
 */
export const postLogin = async (req: Request, res: Response, next: NextFunction) => {
    await check("email", "Email is not valid").isEmail().run(req);
    await check("password", "Password cannot be blank").isLength({min: 1}).run(req);
    // eslint-disable-next-line @typescript-eslint/camelcase
    await sanitize("email").normalizeEmail({gmail_remove_dots: false}).run(req);

    const errors = validationResult(req);

    if (!errors.isEmpty()) {
        res.status(500).json(errors.array());
    }
};

/**
 * Log out.
 * @route GET /logout
 */
export const logout = (req: Request, res: Response) => {
    res.redirect("/");
};

/**
 * Signup page.
 * @route GET /signup
 */
export const getSignup = (req: Request, res: Response) => {
    //TODO logout
    res.render("account/signup", {
        title: "Create Account"
    });
};

/**
 * Create a new local account.
 * @route POST /signup
 */
export const postSignup = async (req: Request, res: Response, next: NextFunction) => {
    await check("email", "Email is not valid").isEmail().run(req);
    await check("password", "Password must be at least 4 characters long").isLength({min: 4}).run(req);
    await check("confirmPassword", "Passwords do not match").equals(req.body.password).run(req);
    // eslint-disable-next-line @typescript-eslint/camelcase
    await sanitize("email").normalizeEmail({gmail_remove_dots: false}).run(req);

    const errors = validationResult(req);

    if (!errors.isEmpty()) {
        //req.flash("errors", errors.array());
        // TODO handler errors
    }
};

/**
 * Profile page.
 * @route GET /account
 */
export const getAccount = (req: Request, res: Response) => {
    res.render("account/profile", {
        title: "Account Management"
    });
};

/**
 * Update profile information.
 * @route POST /account/profile
 */
export const postUpdateProfile = async (req: Request, res: Response, next: NextFunction) => {
    await check("email", "Please enter a valid email address.").isEmail().run(req);
    // eslint-disable-next-line @typescript-eslint/camelcase
    await sanitize("email").normalizeEmail({gmail_remove_dots: false}).run(req);

    const errors = validationResult(req);

    if (!errors.isEmpty()) {
        //req.flash("errors", errors.array());
        // TODO handler errors
        res.status(500).json(errors.array());
    }
};

/**
 * Update current password.
 * @route POST /account/password
 */
export const postUpdatePassword = async (req: Request, res: Response, next: NextFunction) => {
    await check("password", "Password must be at least 4 characters long").isLength({min: 4}).run(req);
    await check("confirmPassword", "Passwords do not match").equals(req.body.password).run(req);

    const errors = validationResult(req);

    if (!errors.isEmpty()) {
        //req.flash("errors", errors.array());
        // TODO handler errors
        return res.redirect("/account");
    }
};

/**
 * Delete user account.
 * @route POST /account/delete
 */
export const postDeleteAccount = (req: Request, res: Response, next: NextFunction) => {
    console.log("sdsdsd");
};

/**
 * Create a random token, then the send user an email with a reset link.
 * @route POST /forgot
 */
export const postForgot = async (req: Request, res: Response, next: NextFunction) => {
    await check("email", "Please enter a valid email address.").isEmail().run(req);
    // eslint-disable-next-line @typescript-eslint/camelcase
    await sanitize("email").normalizeEmail({gmail_remove_dots: false}).run(req);

    const errors = validationResult(req);

    if (!errors.isEmpty()) {
        // TODO handler errors
        // req.flash("errors", errors.array());
        return res.status(500).json({
            msg: "Error when change pass"
        });
    }

    return res.status(20).json({
        msg: "Change pass success"
    });
};

export const userInfor = async (req: Request, res: Response, next: NextFunction) => {
    const userService = Container.get(UserService);
    const user = await userService.findById(1);
    if (user)
        return res.status(200).json(user);
    return res.status(200).json({
        msg: "No data found!"
    });
};
