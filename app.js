const express = require("express");
const app = express();
const path = require('path');
const port = 3000;

const productsRouter = require("./routes/products.js");
const getInfoRouter = require("./routes/getInfo.js");
const getReportsRouter = require("./routes/getReports.js");

app.use(express.json());
//app.use(express.urlencoded({extended: false}));
app.use(express.static(path.join(__dirname, 'public')));

app.get('/dashboard', (req, res) => {
    res.sendFile(path.join(__dirname+'/dashboard.html'));
});

app.get('/inventory', (req, res) => {
    res.sendFile(path.join(__dirname+'/inventory.html'));
});

app.get('/new-order', (req, res) => {
    res.sendFile(path.join(__dirname+'/new-order.html'));
});

app.get('/packages', (req, res) => {
    res.sendFile(path.join(__dirname+'/packages.html'));
});

app.get('/products', (req, res) => {
    res.sendFile(path.join(__dirname+'/products.html'));
});

app.get('/sales', (req, res) => {
    res.sendFile(path.join(__dirname+'/sales.html'));
});

app.get('/supply-order', (req, res) => {
    res.sendFile(path.join(__dirname+'/supply-order.html'));
});

app.use("/", productsRouter);
app.use("/", getInfoRouter);
app.use("/", getReportsRouter);

app.listen(port, () => 
    console.log(`Server running at http://localhost:${port}/dashboard`)
);