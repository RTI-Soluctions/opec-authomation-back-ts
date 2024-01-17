import { AppError } from "../../errors/appError";
import { IUserRequest } from "../../interfaces/user";
import { PrismaClient } from '@prisma/client';

export const listUserIdService = async (id: number): Promise<IUserRequest> => {

  const prisma = new PrismaClient();
  

  const findUser = await prisma.user.findUnique({
    where: { id },
    include: {
      PI: true
    }
  });


  if (!findUser) {
    throw new AppError("User not found", 404);
  }

  
  return findUser;
};
