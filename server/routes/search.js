const express = require("express");
const auth = require("./../middlewares/auth");
const Product = require("../models/product");
const searchRouter = express.Router();

// searchRouter.get("/api/products/search", auth, async (req, res) => {
//   try {
//     const { name } = req.query;

//     const product = await Product.find({ name: name });
//     console.log(product);
//     res.json(product);
//   } catch (error) {
//     res.status(500).json({ error: error.message });
//   }
// });

searchRouter.get("/api/products/search/:name", auth, async (req, res) => {
  try {
    const { name } = req.query;

    const product = await Product.find({
      name: { $regex: req.params.name, $options: "i" },
    });
    console.log(product);
    res.json(product);
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
});

module.exports = searchRouter;
