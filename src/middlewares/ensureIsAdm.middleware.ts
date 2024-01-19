import { Request, Response, NextFunction } from "express";

export const ensureIsAdmMiddleware = async (
  req: Request,
  res: Response,
  next: NextFunction
) => {
  if (!req.user.is_adm) {
    return res.status(403).json({
      message: "User is not adm",
    });
  }

  return next();
};

