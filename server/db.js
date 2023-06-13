const Pool = require("pg").Pool;

const pool = new Pool ({
    user: "alexanderparisi",
    password: "caramu",
    host: "localhost",
    port: 5432,
    database: "pernbank"
});

module.exports = pool;