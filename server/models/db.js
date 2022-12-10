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

module.exports = {
    getServices:getServices
}