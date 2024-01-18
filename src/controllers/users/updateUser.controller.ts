
import { instanceToPlain } from "class-transformer";
import { Request, Response } from "express";
import { IUserUpdate } from "../../interfaces/user";
import { updateUserService } from "../../services/users/updateUser.service";

export const updateUserController = async (req: Request, res: Response) => {
  const user: IUserUpdate = req.body;

  const { id } = req.params;

  const idNum = parseInt(id);

  await updateUserService(user, idNum);

  return res.json({ message: "User updated" });
};

