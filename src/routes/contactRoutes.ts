import { Router } from "express";

const router = Router();

// Template of html pages
router.get("/", (_, res) => {
  res.render("contact", {
    name: "John Doe",
    email: "john.doe@example.com",
    message: "Hello, this is a test message.",
  });
});

export default router;
