const express = require("express");
const bodyParser = require("body-parser");
const app = express();
const port = process.ENV || 5000;
const mysql = require("mysql");
const connection = require("./model/dbconnection");

app.get("/", (req, res) => {
  console.log("testing");
});

app.listen(port, () => console.log(`Listening on port ${port}`));
