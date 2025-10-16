import { Router } from "express";
import { createSubject, getSubjects } from "../controllers/subjectsController";
const router = Router();

router.get("/create", createSubject);
router.get("/", getSubjects);

export default router;
