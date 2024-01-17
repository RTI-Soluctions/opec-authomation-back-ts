import { IUser, IUserCreate, IUserRequest } from "../../interfaces/user";
import { PrismaClient } from '@prisma/client';

const listUsersService = async (): Promise<IUserRequest[]> => {

  const prisma = new PrismaClient();
  

  const findUsers = await prisma.user.findMany();
  
  return findUsers;
};

export default listUsersService;