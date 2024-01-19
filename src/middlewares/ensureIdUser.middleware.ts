import { Request, Response, NextFunction } from "express";

export const ensureIdUserMiddleware = async (
  req: Request,
  res: Response,
  next: NextFunction
) => {
  const key = Object.keys(req.body);

  if (
    key[0] === "id" ||
    key[0] === "is_adm" ||
    key[0] === "is_active"
  ) {
    return res.status(401).json({
      message: "No authorization",
    });
  }

  return next();
};

