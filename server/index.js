const express = require('express');
const bodyParser = require('body-parser');
const app = express();
const port = process.ENV || 5000;
const mysql      = require('mysql');

// const connection = mysql.createConnection({
//   host     : 'localhost',
//   user     : 'me',
//   password : 'secret',
//   database : 'my_db'
// });
 
// connection.connect();

app.listen(port, () => console.log(`Listening on port ${port}`));