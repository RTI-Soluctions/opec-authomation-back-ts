import { Request, Response } from "express";
import { instanceToPlain } from "class-transformer";
import { IClientRequest } from "../../interfaces/client";
import { createClientService } from "../../services/clients/createClient.service";

export const createClientController = async (req: Request, res: Response) => {
  const client: IClientRequest = req.body;

  const createdClient = await createClientService(client);

  return res.status(201).json(instanceToPlain(createdClient));
};
