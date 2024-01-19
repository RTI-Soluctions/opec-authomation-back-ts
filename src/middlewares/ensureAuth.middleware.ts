import { Request, Response, NextFunction } from "express";
import jwt from "jsonwebtoken";

export const ensureAuthMiddleware = async (
  req: Request,
  res: Response,
  next: NextFunction
) => {
  if (!req.headers) {
    return res.status(401).json({ message: "Token required" });
  }

  let token = req.headers.authorization;

  if (!token) {
    return res.status(401).json({ message: "Missing authorization token" });
  }

  token = token.split(" ")[1];

  jwt.verify(token, process.env.SECRET_KEY as string, (error, decoded: any) => {
    if (error) {
      return res.status(401).json({ message: "Missing authorization token" });
    }

    req.user = {
      is_active: decoded.is_active,
      is_adm: decoded.is_adm,
      id: decoded.id,
    };

    return next();
  });
};


