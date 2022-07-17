const express = require("express");
const router = express.Router();
const db = require("../database/db.js");

router.post("/new-product", (req, res) => {
    db.none(`INSERT INTO flower_product(product_name, purchase_price, sell_price, color, length, product_image, description) VALUES ($1, $2, $3, $4, $5, $6, $7)`, 
        [req.body.name, req.body.purchase_price, req.body.price, req.body.color, req.body.length, req.body.image_filename, req.body.description])
    .then(data => {
        // console.log(data);
        res.redirect('http://localhost:3000/products');
    })
    .catch(error => {
        console.log(error);
    })
})

module.exports = router;