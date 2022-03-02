const mongoose = require("mongoose");
const url = "mongodb://127.0.0.1:27017/corona";

mongoose.connect(url, {
    useNewUrlParser: true,
    useUnifiedTopology: true,
});
const db = mongoose.connection;
db.on('error', () => console.log('couldnot connect to db'));
db.once('open', () => console.log(`connection success`));