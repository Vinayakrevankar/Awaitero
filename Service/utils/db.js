'user strict';

const mysql = require('mysql');
const util = require('util');
const config = require('../config/default.json');
let pool = mysql.createPool(config['db.config']);

if(config.ssl)
  pool = mysql.createPool(config['db.config']);
else
  pool = mysql.createPool(config['db.configLocalhost']);


pool.query = util.promisify(pool.query); 
pool.getConnection = util.promisify(pool.getConnection);

// To get transaction connection
pool.getTransactionConnection = async () => {
    const connection = await pool.getConnection();
    connection.beginTransaction = await util.promisify(connection.beginTransaction);
    await connection.beginTransaction();
    connection.query = await util.promisify(connection.query);
    connection.rollback = await util.promisify(connection.rollback);
    connection.commit = await util.promisify(connection.commit);
    connection.release = await util.promisify(connection.release);
    return connection;
};

// Get Commit and release Pool;
pool.commitAndReleaseConnection = async conn => {
    await conn.commit();
    conn.release();
    return conn;
};

// Commit the transaction and release connection to pool

pool.rollbackAndReleaseConnection = async conn => {
    await conn.rollback();
    conn.release();
    return conn;
};

pool.commit = async conn => {
  await conn.commit();
  conn.release();
  return conn;
};

pool.rollback = async conn => {
  await conn.rollback();
  conn.release();
  return conn;
};

module.exports = pool;
