const express = require("express");
const cookieParser = require("cookie-parser");
const bodyParser = require("body-parser");
const morgan = require("morgan");
const cors = require("cors");
const { conn } = require("./db");
const routes = require("./routes/index.js");

require("./db.js");

const app = express();

app.name = "API";

app.use(
  bodyParser.urlencoded({
    extended: true,
    limit: "50mb",
  })
);
app.use(
  bodyParser.json({
    limit: "50mb",
  })
);

app.use(cookieParser());
app.use(morgan("dev"));
app.use(cors());

app.use("/", routes);

// Syncing all the models at once.
conn.sync({ force: false }).then(() => {
  app.listen(3001, () => {
    console.log("%s listening at 3001"); // eslint-disable-line no-console
  });
});
