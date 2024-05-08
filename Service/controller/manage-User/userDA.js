const mysql = require('../../utils/db');
const sql = require('./sql');


exports.saveUser = (data) => mysql.query(sql.SAVE_USER,[data]);
exports.updateTableOccupied = (data,idTable) => mysql.query(sql.UPDATE_TABLE_OCCUPIED,[data,idTable]);
exports.getTable = (idReference) =>  mysql.query(sql.GET_TABLE_DETAILS_BY_ID_REFERENCE,[idReference]);
exports.getItemByTable =  (idTable) => mysql.query(sql.GET_ITEMS_BY_TABLE,[idTable])

exports.getTableDetails = (idTable) => mysql.query(sql.GET_TABLE_DETAILS,[idTable]);
exports.checkTableStatus = (idReference) => mysql.query(sql.CHECK_TABLE_STATUS,[idReference])



exports.getAllStockValue = () => mysql.query(sql.GET_UPDATED_VALUE);

exports.verifyUser = (user,password) => mysql.query(sql.VERIFY_USER,[user,password])

exports.saveStockValue = (idStock,value) => mysql.query(sql.SAVE_STOCK_VALUE,[idStock,value])

exports.getStockValue = () => mysql.query(sql.GET_LIST_OF_STOCK_VALUE)

exports.checkUserWriteAccess = (idUser,idStock) => mysql.query(sql.CHECK_USER_WRITE_ACCESS,[idUser,idStock])

exports.getListOfStock =(idUser)=> mysql.query(sql.GET_LIST_OF_STOCK,[idUser])
