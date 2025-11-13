import express from "express";
import mongoose from "mongoose";
import dotenv from "dotenv";
import cors from "cors";
import path from "path";

import userRoutes from "./routes/userRoutes";
import taskRoutes from "./routes/taskRoutes";
import contactRoutes from "./routes/contactRoutes";
import subjectRoutes from "./routes/subjectRoutes";

dotenv.config();

const app = express();

// ===========================================
// 🚀 CORS configuration
// ===========================================

app.use(
  cors({
    origin(requestOrigin, callback) {
      const allowedOrigins = ["http://localhost:3000"];
      // Allow requests with no origin (like mobile apps or curl requests)
      if (!requestOrigin) {
        callback(null, true);
        return;
      }
      if (allowedOrigins.includes(requestOrigin)) {
        callback(null, true);
      } else {
        callback(new Error("CORS: Request origin is not allowed"));
      }
    },
  })
);

// ===========================================
// 🚀 JSON middleware
// ===========================================

app.use(express.json());

// ===========================================
// 🚀 Basic root route (for browser testing)
// ===========================================

app.get("/", (_, res) => {
  res.send("API is working ✅: test#2");
});

// ===========================================
// 🚀 API routes
// ===========================================

app.use("/api/users", userRoutes);
app.use("/api/tasks", taskRoutes);
app.use("/api/subjects", subjectRoutes);

// ===========================================
// 🚀 Template engine for render html pages
// ===========================================

// this line of code is only for tell express where to find the views
app.set("views", path.join(__dirname, "views"));

// this line of code is for tell express which template engine to use
app.set("view engine", "ejs");
app.use("/contact", contactRoutes);

// ===========================================
// 🚀 Static files setup for serve static files
// ===========================================

app.use(express.static(path.join(__dirname, "../public")));

// ===========================================
// 🚀 Error handling middleware
// ===========================================

// testing route
app.get("/error", (_, res) => {
  throw new Error("Test error");
});

// error handler middleware
app.use(function errorHandler(err: any, req: any, res: any, next: any) {
  if (res?.headersSent) {
    return next(err);
  }
  res.status(500);
  res.render("error", { error: err });
});

// ===========================================
// 🚀 Start the server
// ===========================================

const PORT = process.env.PORT || 5000;

mongoose
  .connect(process.env.MONGO_URI || "")
  .then(() => {
    console.log("MongoDB connected");
    app.listen(PORT, () => console.log(`Server running on port ${PORT}`));
  })
  .catch((err) => console.error("Mongo error:", err));
