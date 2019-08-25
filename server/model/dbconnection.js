const mysql      = require('mysql');
const port = process.ENV || 5000;
const keys = require('../config/dev');

const connection = mysql.createConnection({
  host     : 'den1.mysql1.gear.host',
  user     : 'budgetmedev',
  password : keys.devDbPass,
  database : 'budgetmedev'
});
 
connection.connect(function(err) {
  if (err) {
    console.error('error connecting: ' + err.stack);
    return;
  }
 
  console.log('connected as id ' + connection.threadId);
});

module.exports = connection;