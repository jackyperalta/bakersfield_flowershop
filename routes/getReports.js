const express = require("express");
const router = express.Router();
const db = require("../database/db.js");

/* retrieve data for inventory report */
router.get('/getreport', (req, res) => {
    db.any("SELECT * FROM inventoryOnHand_view;")
    .then(data => {
        // console.log(data);
        res.json(data)
    })
    .catch(error => {
        console.log(error)
    })
})

/* retrieve data with VIEW for sales report */
router.get('/getreport2', (req, res) => {
    db.any("SELECT * FROM salesReport_view;")
    .then(data => {
        // console.log(data);
        res.json(data);
    })
    .catch(error => {
        console.log(error)
    })
})

router.get('/packageAmount', (req, res)=> {
    db.any("SELECT COALESCE(SUM(status_id),0) AS total FROM product_order WHERE status_id = 2000;")
    .then(data => {
        res.json(data);
        //res.redirect('http://localhost:3000/dashboard');
    })
    .catch(error => {
        console.log(error)
    })
})
module.exports = router;