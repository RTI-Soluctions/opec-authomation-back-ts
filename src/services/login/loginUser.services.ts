import { IUserLogin } from "../../interfaces/user";
import { compare } from "bcryptjs";
import jwt from "jsonwebtoken";
import { AppError } from "../../errors/appError";
import { PrismaClient } from "@prisma/client";

export const loginUserService = async ({
  email,
  password,
}: IUserLogin): Promise<string> => {

  const prisma = new PrismaClient()

  const user = await prisma.user.findUnique({
    where: {
      email
    }
  });

  if (!user) {
    throw new AppError("Invalid user or password", 403);
  }
  const passwordMatch = await compare(password, user.password);

  if (!passwordMatch) {
    throw new AppError("Invalid user or password", 403);
  }
  const token = jwt.sign(
    {
      id: user.id,
      is_adm: user.is_adm,
      is_active: user.is_active,
    },
    process.env.SECRET_KEY as string,
    {
      expiresIn: "8h"
    }
  );
  return token;
};
