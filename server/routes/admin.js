const express = require("express");
const adminRouter = express.Router();
const admin = require("../middlewares/admin");
const Product = require("./../models/product");
const jwt = require("jsonwebtoken");
const User = require(`./../models/user`);

adminRouter.post("/admin/add-product", admin, async (req, res) => {
  try {
    const { name, description, images, quantity, price, category } = req.body;
    let product = new Product({
      name,
      description,
      images,
      quantity,
      price,
      category,
    });
    product = await product.save();
    res.json(product);
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
});

adminRouter.get("/admin/get-products", admin, async (req, res) => {
  try {
    const products = await Product.find();
    res.json(products);
  } catch (err) {
    res.status(500).json({ error: err.message });
  }
});

adminRouter.post("/admin/delete-product/", admin, async (req, res) => {
  try {
    // const _id = req.body["id"];
    const { id } = req.body;

    await Product.findByIdAndDelete(id);

    // We are doing this to send a status code of 200
    res.json({ msg: "All went well!" });
  } catch (err) {
    res.status(500).json({ error: err.message });
  }
});

module.exports = adminRouter;
