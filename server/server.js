const express = require('express');
const app = express();
const db = require('./models/db')

app.get("/services", (req,res) => {
    db.getServices().then((data) => {
        res.json(data[0])
    })
})

app.get("/listClients", (req,res) => {
    db.getClients().then((data) => {
        res.json(data[0])
    })
})

app.post("/createClient", (req,res) => {
   db.insertClient(req.body.correo, req.body.telefono);
   res.redirect('listClients');
})

app.post("/createServices", (req,res) => {
    db.insertPaymentServices(req.body.cobro,req.body.servicio,req.body.volumen);
})


app.listen('2323', () => {console.log("servidor en: http://localhost:2323")})