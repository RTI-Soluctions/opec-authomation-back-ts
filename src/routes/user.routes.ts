import { Router } from "express";
import { createUserController } from "../controllers/users/createUser.controller";
import { listUsersController } from "../controllers/users/listUsers.controller";
import { listUserIdController } from "../controllers/users/listUserId.controller";
import { updateUserController } from "../controllers/users/updateUser.controller";
import { deleteUserController } from "../controllers/users/deleteUser.controller";
import { ensureAuthMiddleware } from "../middlewares/ensureAuth.middleware";
import { ensureIsActiveMiddleware } from "../middlewares/ensureIsActive.middleware";
import { ensureIsAdmMiddleware } from "../middlewares/ensureIsAdm.middleware";
import { ensureUpdateMiddleware } from "../middlewares/ensureUpdate.middleware";
import { ensureIdUserMiddleware } from "../middlewares/ensureIdUser.middleware";


const userRoutes = Router();

userRoutes.post("", 
ensureAuthMiddleware, 
ensureIsAdmMiddleware, 
ensureIsActiveMiddleware, 
createUserController
);

userRoutes.get("", 
ensureIsAdmMiddleware, 
ensureIsActiveMiddleware, 
listUsersController
);

userRoutes.get("/:id",
  ensureAuthMiddleware,
  ensureIsAdmMiddleware,
  ensureIsActiveMiddleware,
  listUserIdController
);

userRoutes.patch(
  "/:id",
  ensureAuthMiddleware,
  ensureIsActiveMiddleware, 
  ensureUpdateMiddleware,
  ensureIdUserMiddleware,
  updateUserController
);

userRoutes.delete(
  "/:id",
  ensureAuthMiddleware,
  ensureIsActiveMiddleware, 
  ensureIsAdmMiddleware,
  deleteUserController
);

export default userRoutes;