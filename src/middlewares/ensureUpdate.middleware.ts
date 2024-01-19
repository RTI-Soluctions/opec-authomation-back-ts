import { Request, Response, NextFunction } from "express";

export const ensureUpdateMiddleware = async (
  req: Request,
  res: Response,
  next: NextFunction
) => {
  const idParams = req.params.id;

  const idNum = parseInt(idParams);

  if (idNum === req.user.id) {
    return next();
  }


  if (!req.user.is_adm) {
    return res.status(401).json({
      message: "No authorization",
    });
  }

  return next();
};

