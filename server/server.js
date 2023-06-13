const express = require("express");
const app = express();
const cors = require("cors");
const pool = require("./db");
const path = require("path");
const PORT = process.env.PORT || 3000;




// Middleware
app.use(cors())
app.use(express.json());

if(process.env.NODE_ENV === "production") {
  app.use(express.static(path.join(__dirname, "client/build")))
}
console.log(path.join(__dirname, "client/build"))

//ROUTES//

// register and login routes

app.use("/auth", require("./routes/jwtAuth"));

// dashboard route

app.use("/dashboard", require("./routes/dashboard"));


app.post("/banktwo", async (req, res) => {
  try {
    const newFunds = await pool.query(
      "CREATE TABLE transactionsTwo( transaction_id SERIAL PRIMARY KEY, name varchar(30), amount numeric(12,2), date varchar(30), category varchar(30))"
    );

    res.json(newFunds);
  } catch (err) {
    console.error(err.message);
  }
 
});


app.listen(PORT, () => {
    console.log("server started");
});