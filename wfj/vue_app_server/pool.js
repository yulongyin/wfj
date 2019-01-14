//加载模块
const mysql = require("mysql");
//创建对象
var pool = mysql.createPool({
    host:"127.0.0.1",
    port:3306,
    user:"root",
    password:"",
    database:"wfj",
    multipleStatements: true,   //允许执行多条sql语句
    connectionLimit:20
});

module.exports = pool;