import { hash } from "bcryptjs";
import { AppError } from "../../errors/appError";
import { IUserRequest } from "../../interfaces/user";
import { PrismaClient } from '@prisma/client';

const createUserService = async ({
  name,
  email,
  password,
  cpf,
}: IUserRequest): Promise<IUserRequest> => {

  const prisma = new PrismaClient();
  
  if (!name || !email || !password || !cpf ) {
    throw new AppError("Missing required field", 400);
  }

  const findUser = await prisma.user.findUnique({
    where: {
      cpf: cpf,
    },
  });
  
  if (findUser) {
    throw new AppError("User already exists", 409);
  }
    
  const hashedPassword = await hash(password, 10);

  const user = prisma.user.create({
    data: {
      name,
      email,
      cpf,
      password: hashedPassword
    },
  });

  return user;
};

export default createUserService;