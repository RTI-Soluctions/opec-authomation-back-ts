import { Router } from "express";
import { createUserController } from "../controllers/users/createUser.controller";
import { listUsersController } from "../controllers/users/listUsers.controller";


const userRoutes = Router();

userRoutes.post("", createUserController);

userRoutes.get("", listUsersController);

// userRoutes.get("/:id",
//   ensureAuthMiddleware,
//   ensureIsEmployeeAdmMiddleware,
//   listUserIdController
// );

// userRoutes.patch(
//   "/:id",
//   ensureAuthMiddleware,
//   ensureUpdateMiddleware,
//   ensureIdUserMiddleware,
//   updateUserController
// );

// userRoutes.delete(
//   "/:id",
//   ensureAuthMiddleware,
//   ensureIsAdmMiddleware,
//   deleteUserController
// );

export default userRoutes;