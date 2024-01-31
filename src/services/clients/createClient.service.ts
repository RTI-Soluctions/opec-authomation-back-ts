import { AppError } from "../../errors/appError";
import { PrismaClient } from '@prisma/client';
import { IClientRequest } from "../../interfaces/client";

export const createClientService = async ({
  name,
  corporate_reason,
  cnpj_cpf,
  cep,
  street,                
  city,
  state,
  phone,1
}: IClientRequest): Promise<IClientRequest> => {

  const prisma = new PrismaClient();
  
  if (
    !name || 
    !corporate_reason ||
    !cnpj_cpf ||
    !cep || 
    !street || 
    !city || 
    !state || 
    !phone 
    ) {
    throw new AppError("Missing required key field", 400);
  }

  const findClient = await prisma.client.findUnique({
    where: {
      cnpj_cpf,
    },
  });
  
  if (findClient) {
    throw new AppError("Client already exists", 409);
  }
    
  const client = prisma.client.create({
    data: {
      name,
      corporate_reason,
      cnpj_cpf,
      cep,
      street,                
      city,
      state,
      phone,
    },
  });

  return client;
};
