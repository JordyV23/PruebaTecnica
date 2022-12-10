const config = require('../config/dbsqlConfig');
const sql = require('mssql');


const getServices = async function () {
    try {
        let pool = await sql.connect(config);
        let data = await pool.request().execute("spGetServices");
        return data.recordsets;
    } catch (error) {
        console.log(error);
    }
}

const getClients = async function () {
    try {
        let pool = await sql.connect(config);
        let data = await pool.request().execute("spGetClients");
        return data.recordsets;
    } catch (error) {
        console.log(error);
    }
}


const insertClient = async function (correo,telefono) {
    try {
        let pool = await sql.connect(config);
        let data = await pool.request()
        .input("correo",sql.NVarChar,correo)
        .input("telefono",sql.NVarChar,telefono)
        .execute("SpCreateClient");
        return data.recordsets;
    } catch (error) {
        console.log(error);
    }
}

const insertPaymentServices = async function (idCobro,idServicio,volumen) {
    try {
        let pool = await sql.connect(config);
        let data = await pool.request()
        .input("idcobro",sql.Int,idCobro)
        .input("idServicio",sql.Int,idServicio)
        .input("volumen",sql.Decimal,volumen)
        .execute("SpCreatePaymentServices");
        return data.recordsets;
    } catch (error) {
        console.log(error);
    }
}

const getPaymentService = async function (id) {
    try {
        let pool = await sql.connect(config);
        let data = await pool.request()
        .input("idCliente",sql.Int,id)
        .execute("SpGetPaymentServiceById");
        return data.recordsets;
    } catch (error) {
        console.log(error);
    }
}

module.exports = {
    getServices:getServices,
    getClients:getClients,
    insertClient:insertClient,
    insertPaymentServices:insertPaymentServices,
    getPaymentService,getPaymentService
}