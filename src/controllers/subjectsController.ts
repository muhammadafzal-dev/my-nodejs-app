import { Request, Response } from "express";
import mongoose from "mongoose";
// import User, { IUser } from "../models/User";

const subjectSchema = new mongoose.Schema({
  name: String,
  code: String,
});

const Subject = mongoose.model("Subject", subjectSchema);

export const createSubject = async (req: Request, res: Response) => {
  try {
    // const { name = "", code = "" } = req.body || {};

    // if (!name || !code) {
    //   return res.status(400).json({ message: "fill all fields" });
    // }

    const subject = await Subject.create({ name: "Math", code: "MATH101" });
    res.status(201).json(subject);
  } catch (err) {
    res.status(500).json({ message: "Server error" + err });
  }
};

export const getSubjects = async (req: Request, res: Response) => {
  try {
    const subjects = await Subject.find();
    res.status(200).json(subjects);
  } catch (err) {
    res.status(500).json({ message: "Server error:" + err });
  }
};
