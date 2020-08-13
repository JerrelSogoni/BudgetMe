const express = require("express");
const mongoose = require("mongoose");
const cookieSession = require("cookie-session");
const passport = require("passport");
const config = require("./config");
require("./models/User");
require("./services/passport");

mongoose.connect(config.databaseURL);

const app = express();

app.use(
  cookieSession({
    maxAge: 30 * 24 * 60 * 60 * 1000,
    keys: [config.cookieKey],
  })
);

app.use(passport.initialize());
app.use(passport.session());

require("./routes/authRoutes")(app);

const port = process.ENV || 5000;

app.listen(port, () => console.log(`Listening on port ${port}`));
