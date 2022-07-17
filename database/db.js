const pgp = require ('pg-promise')({
    // Initialization Options
});
const cn = `postgresql://postgres:70223@localhost:5432/flowershop`
const db = pgp(cn);
module.exports = db;