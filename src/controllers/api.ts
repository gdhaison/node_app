import {Request, Response} from "express";
import {Container} from "typedi";
import {UserService} from "../services/UserService";

export const index = (req: Request, res: Response) => {
    res.status(200).json({title: "Home"});
};

/**
 * List of API examples.
 * @route GET /api
 */
export const getApi = async (req: Request, res: Response) => {
    const userService = Container.get(UserService);
    const user = await userService.findById(1);
    res.status(200).json(user);
};
