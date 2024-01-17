import { Request, Response } from "express";
import { IUserRequest } from "../../interfaces/user";
import { instanceToPlain } from "class-transformer";
import createUserService from "../../services/users/createUser.service";

export const createUserController = async (req: Request, res: Response) => {
  const user: IUserRequest = req.body;

  const createdUser = await createUserService(user);

  return res.status(201).json(instanceToPlain(createdUser));
};
