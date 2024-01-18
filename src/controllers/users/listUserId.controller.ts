import { instanceToPlain } from "class-transformer";
import { Request, Response } from "express";
import { listUserIdService } from "../../services/users/listUserId.service";

export const listUserIdController = async (req: Request, res: Response) => {
  const { id } = req.params;

  const idNum = parseInt(id);

  const userId = await listUserIdService(idNum);

  return res.json(instanceToPlain(userId));
};

