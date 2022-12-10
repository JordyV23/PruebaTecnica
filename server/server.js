const express = require('express');
const app = express();
const db = require('./models/db')

app.get("/", (req,res) => {
    res.redirect("/services")
})

app.get("/services", (req,res) => {
    db.getServices().then((data) => {
        //res.send(data[0])
        res.json(data[0])
    })
})



app.listen('2323', () => {console.log("servidor en: http://localhost:2323")})