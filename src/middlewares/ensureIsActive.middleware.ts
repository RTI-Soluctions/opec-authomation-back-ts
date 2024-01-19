import { Request, Response, NextFunction } from "express";

export const ensureIsActiveMiddleware = async (
  req: Request,
  res: Response,
  next: NextFunction
) => {
  if (!req.user.is_active) {
    return res.status(403).json({
      message: "User is not adm",
    });
  }

  return next();
};

