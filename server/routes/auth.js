const express = require("express");
const bcryptjs = require("bcryptjs");
const User = require("../models/user");
const jwt = require("jsonwebtoken");
const authRouter = express.Router();
const auth = require("./../middlewares/auth");

authRouter.post("/api/signup", async (req, res) => {
  //get data from the client

  try {
    const { name, email, password } = req.body;

    //post the data to the database
    const existingUser = await User.findOne({ email });
    if (existingUser) {
      return res.status(400).json({
        status: "bad request",
        msg: "User with same email already exists!",
      });
    }

    const hashedPassword = await bcryptjs.hash(password, 8);

    let user = new User({
      name,
      password: hashedPassword,
      email,
    });
    user = await user.save();

    res.json(user);
  } catch (err) {
    res.status(500).json({ error: err.message });
  }
});

authRouter.post("/api/signin", async (req, res) => {
  try {
    const { email, password } = req.body;

    const user = await User.findOne({ email });
    if (!user) {
      return res.status(400).json({
        msg: "User with this email does not exist!",
      });
    }

    // Comparing password if the user exists
    const isMatch = await bcryptjs.compare(password, user.password);
    if (!isMatch) {
      return res.status(400).json({
        msg: "Incorrect password",
      });
    }

    const token = jwt.sign({ id: user._id }, "passwordKey");

    res.json({
      token,
      ...user._doc,
    });
    // return res.status(200).json({
    //   status: "success",
    //   data: {
    //     isMatch,
    //   },
    // });
  } catch (err) {
    res.status(500).json({
      error: err.message,
    });
  }
});

authRouter.post("/tokenIsValid", async (req, res) => {
  try {
    const token = req.header("x-auth-token");
    if (!token) return res.json(false);
    const verified = jwt.verify(token, "passwordKey");

    if (!verified) return res.json(false);
    const user = await User.findById(verified.id);

    if (!user) return res.json(false);
    res.json(true);
  } catch (err) {
    res.status(500).json({
      error: err.message,
    });
  }
});

// auth is the middleware
// auth will get processed before the request is recieved
// by the callback function written below
authRouter.get("/", auth, async (req, res) => {
  const user = await User.findById(req.user);
  res.json({ ...user._doc, token: req.token });
});

module.exports = authRouter;
