import { Request, Response } from "express";
import { deleteUserService } from "../../services/users/deleteUser.service";

export const deleteUserController = async (req: Request, res: Response) => {
  const { id } = req.params;

  const idNum = parseInt(id);

  await deleteUserService(idNum);

  return res.status(204).json("");

};
