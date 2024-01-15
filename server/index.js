const express = require("express");
const mongoose = require("mongoose");
const authRouter = require(`${__dirname}/routes/auth.js`);
const adminRouter = require(`${__dirname}/routes/admin.js`);
const productRouter = require("./routes/product.js");
const searchRouter = require("./routes/search.js");
const app = new express(); //new

app.use(express.json());
app.use(authRouter);
app.use(adminRouter);
app.use(productRouter);
app.use(searchRouter);

const connectionString =
  "mongodb+srv://kp7282:FwbXitN1Dq2lZXnt@cluster0.mv7qmbf.mongodb.net/?retryWrites=true&w=majority";
// console.log(process.env);
mongoose.connect(connectionString).then(() => {
  console.log("Database successfully connected!");
});

const PORT = 3000;
app.listen(PORT, "192.168.1.5", () => {
  console.log("Started the server on the port: 3000!");
});
