import { hash } from "bcryptjs";
import { AppError } from "../../errors/appError";
import { IUserRequest, IUserUpdate } from "../../interfaces/user";
import { PrismaClient } from '@prisma/client';

export const updateUserService = async ({
  name,
  email,
  password,
  cpf,
}: IUserUpdate, id: number): Promise<IUserRequest> => {

  const prisma = new PrismaClient();
  
  const findUser = await prisma.user.findUnique({
    where: {
      id,
    },
  });
  
  if (!findUser) {
    throw new AppError("User not found", 404);
  }

  const user = prisma.user.update({
    where: {
        id
    },
    data: {
      name: name ? name : findUser.name,
      email: email ? email : findUser.email,
      cpf: cpf ? cpf : findUser.cpf,
      password: password ? await hash(password, 10) : findUser.password
    },
  });

  return user;
};

