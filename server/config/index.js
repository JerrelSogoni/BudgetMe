const dotenv = require("dotenv");

// Set the NODE_ENV to 'development' by default
process.env.NODE_ENV = process.env.NODE_ENV || "development";

const envFound = dotenv.config();
if (envFound.error) {
  // This error should crash whole process
  throw new Error("⚠️  Couldn't find .env file  ⚠️");
}

module.exports = {
  /**
   * Your favorite port
   */
  port: parseInt(process.env.PORT, 10),

  /**
   * MongoDb Database DB
   */
  databaseURL: process.env.MONGODB_URI,

  googleClientOAuth: {
    clientId: process.env.GOOGLE_CLIENT_ID,
    clientSecretKey: process.env.GOOGLE_CLIENT_SECRET_KEY,
  },

  cookieKey: process.env.COOKIE_KEY,

  /**
   * Used by winston logger
   */
  logs: {
    level: process.env.LOG_LEVEL || "silly",
  },
  /**
   * API configs
   */
  api: {
    prefix: "/api",
  },
};
