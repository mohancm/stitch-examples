#require "MongoDBStitch.agent.lib.nut:1.0.0"

//Create the connection to Stitch
stitch <- MongoDBStitch("<STITCH APP ID>");

//Add an API key to link this device to a specific Stitch User
const API_KEY = "<STITCH API KEY>";

function log(data) {
    //Ensure you are authenticated to Stitch
    stitch.loginWithApiKey(API_KEY);
    stitch.executeFunction("Imp_Write", [data], function (error, response) {
        if (error) {
            server.log("error: " + error.details);
        } else {
            server.log(response.message);
        }
    });
}

// Register a function to receive sensor data from the device
device.on("reading.sent", log);