import { Router } from "express";
import { loginUserController } from "../controllers/login/loginUser.controller";

export const loginRoutes = Router()

loginRoutes.post("", loginUserController)
