const mongoose = require("mongoose");
const { Schema } = mongoose;

const UserSchema = new Schema({
  name: String,
  facebookPassportId: String,
  dateJoined: Date,
  lastAccessed: Date,
});

const User = mongoose.model("User", UserSchema);
exports.User = User;
