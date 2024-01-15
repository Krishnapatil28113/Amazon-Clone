const express = require("express");
const auth = require("./../middlewares/auth");
const Product = require("./../models/product");
const productRouter = new express.Router();

productRouter.get("/api/products/", auth, async (req, res) => {
  try {
    console.log(req.query.category);
    // Note: category is already a type of Product model, therefore we are specifying to look for category: req.query.category,
    const products = await Product.find({ category: req.query.category });
    res.json(products);
  } catch (err) {
    res.status(500).json({ error: err.message });
  }
});

module.exports = productRouter;
