import { AppError } from "../../errors/appError";
import { PrismaClient } from '@prisma/client';
import { IUser } from "../../interfaces/user";

export const deleteUserService = async (id: number): Promise<void> => {

  const prisma = new PrismaClient();
  
  const findUser = await prisma.user.findUnique({
    where: { id }
  });


  if (!findUser) {
    throw new AppError("User not found!", 404);
  }

  console.log(findUser)

  if (!findUser.is_active) {
    throw new AppError("User is not active!", 404);
  }

  prisma.user.update({
    where: {
        id
    },
    data: {
      is_active: false,
    },
  });

};
