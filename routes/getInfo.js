const express = require("express");
const router = express.Router();
const db = require("../database/db.js");

router.get('/getFlowers', (req, res) => {
    db.any("SELECT product_id, product_image, product_name, description, color, length, sell_price FROM flower_product;")
    .then(data => {
        // console.log(data);
        res.json(data)
    })
    .catch(error => {
        console.log(error)
    })
})

/* retreive deliveries with VIEW  */
router.get('/getPackages', (req, res) => {
    db.any("SELECT * FROM pendingdelivery_view;")
    .then(data => {
        // console.log(data);
        res.json(data)
    })
    .catch(error => {
        console.log(error)
    })
})

/* retrieve supply orders with VIEW */
router.get('/getSupplyOrder', (req, res) => {
    db.any("SELECT * FROM mySupplyOrders_view;")
    .then(data => {
        // console.log(data);
        res.json(data)
    })
    .catch(error => {
        console.log(error)
    })
})

/* retrieve recent orders with VIEW */
router.get('/getRecentOrders', (req, res) => {
    db.any("SELECT * FROM recent_orders_view;")
    .then(data => {
        // console.log(data);
        res.json(data)
    })
    .catch(error => {
        console.log(error)
    })
})

module.exports = router;