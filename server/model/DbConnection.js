const mcConfig = require("../config/config");
const { MongoClient } = require("mongodb");
// Makes connection asynchronously.  Mongoose will queue up database
// operations and release them when the connection is complete.
const mcMongoDbURI =
    "mongodb+srv://" +
    mcConfig.DbConnection.MONGODB_USERNAME +
    ":" +
    mcConfig.DbConnection.MONGODB_PASSWORD +
    "@" +
    mcConfig.DbConnection.MONGODB_PROJECT +
    ".m0i4k.mongodb.net/" +
    mcConfig.DbConnection.MONGODB_DATABASE +
    "?retryWrites=true&w=majority";
const mcClient = new MongoClient(mcMongoDbURI, { useNewUrlParser: true });

async function getConnection() {
    if (mcClient.isConnected()) {
        return mcClient;
    } else {
        try {
            // Connect to the MongoDB cluster
            await mcClient.connect();
            console.log("Connected to Db");
        } catch (acErr) {
            console.error(acErr);
        }
        return mcClient;
    }
}
exports.getConnection = getConnection;
