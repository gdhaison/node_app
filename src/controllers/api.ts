import {Response, Request, NextFunction} from "express";

export const index = (req: Request, res: Response) => {
    res.status(200).json({title: "Home"});
};

/**
 * List of API examples.
 * @route GET /api
 */
export const getApi = (req: Request, res: Response) => {
    res.status(200).json({title: "API Examples"});
};
