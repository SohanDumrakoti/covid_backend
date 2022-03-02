const express = require("express");
const app = express();
const cors = require("cors");
const path = require("path");
const port = 5000;
require('./cloudinary/cloudinary.config');
app.use(cors());
app.use(express.urlencoded({ extended: true }));
app.use(express.json());

app.use(express.static(
	path.join(__dirname, '/src/uploads')
));

app.use(function(req, res, next) {
       res.header("Access-Control-Allow-Origin", "*");
       res.header("Access-Control-Allow-Headers", "X-Requested-With");
       res.header('Access-Control-Allow-Headers', 'Content-Type');
       next();
});

app.get('/', (req, res) => {
    res.json({
      message: 'Hello World!',
    });
});

require("./db/db");
const userRoutes = require("./routes/auth.routes");
const profileRoutes = require("./routes/profile.routes");
const caseRoutes = require("./routes/cases.routes");
const newsRoutes = require("./routes/news.routes");

app.use('/api', userRoutes);
app.use('/api', profileRoutes);
app.use('/api', caseRoutes);
app.use('/api', newsRoutes);


app.listen(port, () => {
    console.log("listening at port",port)
});