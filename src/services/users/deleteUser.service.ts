import { AppError } from "../../errors/appError";
import { PrismaClient } from '@prisma/client';

export const deleteUserService = async (id: number): Promise<void> => {

  const prisma = new PrismaClient();
  
  const findUser = await prisma.user.findUnique({
    where: { id }
  });


  if (!findUser) {
    throw new AppError("User not found", 404);
  }

  await prisma.user.delete({
    where: { id }
  });
  
};
