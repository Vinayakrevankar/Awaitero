const mysql = require('../../utils/db');
const sql = require('./sql');

exports.getAllStockValue = () => mysql.query(sql.GET_UPDATED_VALUE);

exports.verifyUser = (emailOrMobile,password) => mysql.query(sql.VERIFY_USER,[password,emailOrMobile,emailOrMobile])

exports.getRestaurants = () => mysql.query(sql.GET_RESTAURANTS)
exports.getRestaurantContract = (idRestaurant) => mysql.query(sql.GET_RESTAURANTS_CONTRACT,[idRestaurant])
exports.getSpecificRestaurant = (idRestaurant) => mysql.query(sql.GET_SPECIFIC_RESTAURANTS,[idRestaurant])

exports.getRestaurantActiveCount = () => mysql.query(sql.GET_RESTAURANTS_ACTIVE_COUNT);
exports.getRestaurantInActiveCount = () => mysql.query(sql.GET_RESTAURANTS_IN_ACTIVE_COUNT);


exports.createTable = (data) => mysql.query(sql.CREATE_TABLE,[data])
exports.isNameDuplicate = (name,idRestaurant)=> mysql.query(sql.IS_NAME_DUPLICATE,[name,idRestaurant])
exports.getStockValue = () => mysql.query(sql.GET_LIST_OF_STOCK_VALUE)

exports.checkUserWriteAccess = (idUser,idStock) => mysql.query(sql.CHECK_USER_WRITE_ACCESS,[idUser,idStock])


exports.getAllTable = (idRestaurant) => mysql.query(sql.GET_ALL_TABLE,[idRestaurant])
exports.getTable =  (idTable) => mysql.query(sql.GET_TABLE,[idTable])

exports.getItemByTable =  (idTable) => mysql.query(sql.GET_ITEMS_BY_TABLE,[idTable])
exports.cancelItem = (idOrder) => mysql.query(sql.CANCEL_ITEM,[idOrder])
exports.getUserDetailsByTable =  (idTable) => mysql.query(sql.GET_USER_DETAILS_BY_TABLE,[idTable])
exports.getCustDetails = (idReference) => mysql.query(sql.GET_USER_DETAILS,[idReference])
exports.saveOrder = (data) => mysql.query(sql.SAVE_ORDERS,[data])


exports.updateTable = (conn,data,idTable) => conn.query(sql.UPDATE_TABLE,[data,idTable])
exports.confirmOrder = (conn,idKot,data) => conn.query(sql.CONFIRM_ORDER,[idKot,data])
exports.getKotId = (conn,idRestaurant,idCustomer) => conn.query(sql.GET_KOTID,[idRestaurant,idCustomer])
exports.getKotSequence = (conn,idRestaurant,idCustomer) => conn.query(sql.GET_KOT_SEQUENCE,[idRestaurant,idCustomer])
exports.AddKot =(conn,data) => conn.query(sql.ADD_KOT,[data])
exports.cancelConfirmedOrder = (data) => mysql.query(sql.CANCEL_CONFIRM_ORDER,[data])
exports.createCategory =(data)=> mysql.query(sql.CREATE_CATEGORY,[data])
exports.isCategoryExists =(idRestaurant,name,type)=> mysql.query(sql.IS_CATEGORY_EXISTS,[idRestaurant,name,type])
exports.isCouponExists  =(idRestaurant,couponCode)=> mysql.query(sql.IS_COUPON_EXISTS,[idRestaurant,couponCode])
exports.createCoupon = (data) => mysql.query(sql.CREATE_COUPON,[data])
exports.updateCoupon = (data,idCoupon) => mysql.query(sql.UPDATE_COUPON,[data,idCoupon])
exports.getAllCategory = (idRestaurant) => mysql.query(sql.GET_CATEGORY,[idRestaurant])
exports.getAllItemsByCategory = (idCategory) => mysql.query(sql.GET_ALL_ITEM_BY_CATEGORY,[idCategory]) 
exports.getAllItems = (idRestaurant) => mysql.query(sql.GET_ALL_ITEMS,[idRestaurant])
exports.isItemExists = (idRestaurant,idItem) => mysql.query(sql.IS_ITEM_EXISTS,[idRestaurant,idItem])
exports.createItem = (data) => mysql.query(sql.CREATE_ITEM,[data])
exports.updateItem = (data,idItem) => mysql.query(sql.UPDATE_ITEM,[data,idItem])
exports.updateRestaurantStatus = (isActive,idRestaurant,) => mysql.query(sql.UPDATE_STATUS,[isActive,idRestaurant])
exports.updateRestaurant = (data,idRestaurant) =>  mysql.query(sql.UPDATE_RESTAURANT,[data,idRestaurant])
exports.updateRestaurantLogo = (data,idRestaurant) => mysql.query(sql.UPDATE_RESTAURANT_LOGO,[data,idRestaurant])
exports.updatePaymentTable = (data,idRestaurant)=>  mysql.query(sql.UPDATE_CONTRACT,[data,idRestaurant])
exports.getReportByRestaurant = (idRestaurant,start,end) => mysql.query(sql.GET_REPORT_BY_RESTAURANT(idRestaurant,start,end))
exports.generateBill = (conn,idRestaurant) => conn.query(sql.GENERATE_BILL_NO,[idRestaurant])
exports.getBillByIdCustomer = (idBill) => mysql.query(sql.GET_BILL_BY_ID_CUSTOMER,[idBill])
exports.createDealer  = (data) => mysql.query(sql.CREATE_DEALER,[data])
exports.getAllDealer = () => mysql.query(sql.GET_ALL_DEALER)
exports.saveUser = (data) => mysql.query(sql.CREATE_USER,[data])
exports.getAllUser = () => mysql.query(sql.GET_ALL_USER)
exports.deleteUser = (idUser) => mysql.query(sql.DELETE_USER,[idUser])
exports.isDealerExists = (mobile,email) => mysql.query(sql.IS_DEALER_EXIST,[mobile,email])
exports.updateDealer = (data,idDealer) =>  mysql.query(sql.UPDATE_DEALER,[data,idDealer])
//Extra
exports.createRestaurant = (data) => mysql.query(sql.CREATE_RESTAURANT,[data])

exports.getAllCouponByRestaurant = (idRestaurant) => mysql.query(sql.GET_ALL_COUPON,[idRestaurant])

exports.deleteCategory = (idCategory,idRestaurant) => mysql.query(sql.DELETE_CATEGORY,[idCategory,idRestaurant])
exports.deleteItem = (idItem,idRestaurant) => mysql.query(sql.DELETE_ITEM,[idItem,idRestaurant])

exports.closeTable = (idCustomer) => mysql.query(sql.CLOSE_TABLE,[idCustomer])
exports.idCartExists = (idCustomer) => mysql.query(sql.IS_CART_EXISTS,[idCustomer])
exports.saveOrders = (data) => mysql.query(sql.SAVE_ORDERS,[data])

exports.updateTableByIdReference = (idReference) => mysql.query(sql.UPDATE_TABLE_REFERENCE,[idReference])
exports.updateOrderItem = (conn,idCustomer) => conn.query(sql.UPDATE_ORDERED_ITEM,[idCustomer])
exports.updateCustomer = (conn,data,idCustomer)=>conn.query(sql.UPDATE_CUSTOMER,[data,idCustomer])