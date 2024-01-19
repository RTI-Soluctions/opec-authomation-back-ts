import "reflect-metadata";
import express from "express";
import "express-async-errors";
import userRoutes from "./routes/user.routes";
import { handleErrorMiddleware } from "./middlewares/handleError.middlewares";
import { loginRoutes } from "./routes/loginUser.routes";

const app = express();
app.use(express.json());

app.use("/users", userRoutes);
app.use("/login", loginRoutes);
app.use(handleErrorMiddleware);


export default app;