const express = require("express");
const app = express();
const port = process.ENV || 5000;
const connection = require("./model/DbConnection");
connection.getConnection();
app.get("/", (req, res) => {
  console.log("testing");
});

app.listen(port, () => console.log(`Listening on port ${port}`));
