exports.GET_UPDATED_VALUE = `SELECT 
  st.id_stock,
  sa.name,
  value,
  last_updated
FROM stock_transaction st
  INNER JOIN (
    SELECT id_stock, MAX(last_updated) AS lastUpdated FROM stock_transaction GROUP BY id_stock
  ) ms ON st.id_stock = ms.id_stock AND last_updated = lastUpdated
  INNER JOIN system_attribute sa ON sa.id_attribute= st.id_stock`;

exports.GET_SPECIFIC_RESTAURANTS = `SELECT CONCAT(d.firstName,' ',d.lastName) dealerName,r.*,sa.value as businessType,rp.*,DATE_FORMAT(rp.contractFrom,'%a, %d %b %Y') contractFrom,DATE_FORMAT(rp.contractTo,'%a, %d %b %Y') contractTo  FROM restaurant r 


LEFT JOIN restaurant_payment rp ON rp.idRestaurant = r.idRestaurant 
LEFT JOIN dealer d ON d.idDealer=r.idDealer
INNER JOIN system_attribute sa ON sa.idSystemAttribute = r.businessType 
where r.idRestaurant=?`;

exports.CREATE_TABLE = `INSERT INTO restaurant_table SET ?`;
exports.GET_ALL_TABLE = `SELECT * from restaurant_table where idRestaurant=? ORDER BY idTable ASC`;
exports.UPDATE_TABLE = `UPDATE restaurant_table SET ? where idTable=?`;
exports.GET_TABLE = `SELECT * from restaurant_table where idTable=?`;
exports.GET_ITEMS_BY_TABLE = `SELECT i.*,oi.* FROM ordered_item oi INNER JOIN item i ON i.idItem=oi.idItem where oi.idTable=? AND oi.isCancelled=0 AND status=1 ORDER BY oi.createdOn DESC`;
exports.GET_USER_DETAILS_BY_TABLE = `SELECT * from customer where idTable=? and isActive=1`;
exports.CANCEL_ITEM = `UPDATE ordered_item SET isCancelled=1 where idOrder IN (?)`;
exports.CONFIRM_ORDER = `UPDATE ordered_item SET isConfirmed=1,idKot=?  where idOrder IN (?)`;
exports.GET_KOTID = `SELECT * FROM kot WHERE idRestaurant =? AND idCustomer=? ORDER BY sequence DESC LIMIT 1;`;
exports.GET_KOT_SEQUENCE = `SELECT IFNULL( (SELECT sequence+1 FROM kot WHERE idRestaurant =? AND idCustomer=? ORDER BY sequence DESC LIMIT 1) ,1) AS sequence;`;
exports.ADD_KOT = `INSERT INTO kot SET ?`;
// exports.GET_KOT_ID = `SELECT MAX(idKot) FROM kot where idRestaurant =? AND idCustomer=?;`
exports.CANCEL_CONFIRM_ORDER = `UPDATE ordered_item SET isCancelled=1 where idOrder IN (?)`;
exports.SAVE_ORDERS = `INSERT INTO ordered_item (idReference,idCustomer, idItem,price,idTable,createdOn,status) VALUES ?;`;
exports.UPDATE_RESTAURANT = `UPDATE restaurant SET ? where idRestaurant=?`;
exports.UPDATE_CONTRACT = `UPDATE restaurant_payment SET ? where idRestaurant=? `;
exports.UPDATE_RESTAURANT_LOGO = `UPDATE restaurant SET ? where idRestaurant=?`;
exports.GENERATE_BILL_NO = `SELECT COALESCE(MAX(billNo+1),1) AS billNo FROM customer WHERE idRestaurant=? ORDER BY billNo DESC LIMIT 1`;
exports.GET_REPORT_BY_RESTAURANT = (
  idRestaurant,
  start,
  end
) => `SELECT c.idTable,c.idCustomer,c.name,c.email,c.mobile,GROUP_CONCAT(oi.price) price,c.billNo,CAST(c.billDate AS DATE) billDate,
GROUP_CONCAT(oi.idItem) items 
FROM ordered_item oi 
INNER JOIN customer c ON c.idCustomer=oi.idCustomer
INNER JOIN restaurant_table rt ON rt.idTable = oi.idTable
WHERE rt.idRestaurant=${idRestaurant} AND oi.isCancelled=0 AND c.isActive = 0 AND c.billNo IS NOT NULL AND CAST(oi.createdOn AS DATE) BETWEEN CAST('${start}' AS DATE) AND CAST('${end}' AS DATE)
GROUP BY c.idCustomer,BillDate
ORDER BY c.billNo ASC`;
exports.GET_BILL_BY_ID_CUSTOMER = `SELECT c.idTable,c.idCustomer,r.name restaurantName,r.address,r.gst,r.restaurantNumber ,c.name,c.email,c.mobile,oi.price,oi.createdOn BillDate,
oi.idItem,i.name ItemName,r.gst FROM ordered_item oi 
INNER JOIN item i ON i.idItem = oi.idItem
INNER JOIN customer c ON c.idCustomer=oi.idCustomer    
INNER JOIN restaurant_table rt ON rt.idTable = oi.idTable
INNER JOIN restaurant r ON r.idRestaurant = rt.idRestaurant
WHERE c.idCustomer = ? AND oi.isCancelled<>1`;
exports.IS_NAME_DUPLICATE = `SELECT * from restaurant_table where name=? AND idRestaurant=?`;
exports.GET_RESTAURANTS = `SELECT * FROM restaurant`;
exports.GET_RESTAURANTS_CONTRACT = `Select * from restaurant_payment py where idRestaurant=?`;
exports.GET_RESTAURANTS_ACTIVE_COUNT = `Select count(*) activeCount from restaurant where isActive=1`;
exports.GET_RESTAURANTS_IN_ACTIVE_COUNT = `Select count(*) inactiveCount from restaurant where isActive=0`;
exports.CREATE_CATEGORY = `INSERT INTO category SET ?;`;
exports.IS_CATEGORY_EXISTS = `Select * from category where idRestaurant=? and name=? AND type=?`;
exports.IS_COUPON_EXISTS = `Select * from coupon where idRestaurant=? and couponCode=?`;
exports.UPDATE_COUPON = `UPDATE coupon SET ? where idCoupon=?`;
exports.CREATE_COUPON = `INSERT INTO coupon SET ?`;
exports.GET_CATEGORY = `Select * from category where idRestaurant=? ORDER BY idCategory ASC`;
exports.UPDATE_STATUS = `UPDATE restaurant SET isActive=? where idRestaurant=?`;
exports.GET_ALL_ITEMS = `Select i.* from category c 
JOIN item i ON i.idCategory = c.idCategory where idRestaurant=?`;

exports.GET_ALL_ITEM_BY_CATEGORY = `Select ii.* from category c 
JOIN item ii ON ii.idCategory = c.idCategory where c.idCategory=? `;
exports.GET_ALL_COUPON = `SELECT *,DATE_FORMAT(createdOn, '%m/%d/%Y %H:%i') as createdOn,DATE_FORMAT(validFrom, '%m/%d/%Y %H:%i') as validFrom,DATE_FORMAT(validTo, '%m/%d/%Y %H:%i') as validTo FROM coupon where isDeleted=0 AND idRestaurant = ? ORDER BY isActive DESC`;
exports.IS_ITEM_EXISTS = `Select ii.* from item ii
INNER JOIN category c ON c.idCategory = ii.idCategory where c.idRestaurant=? AND ii.idItem=?`;

exports.DELETE_CATEGORY = `DELETE from category where idCategory=? AND idRestaurant=?`;
exports.DELETE_ITEM = `DELETE item FROM item
INNER JOIN category ON item.idCategory = category.idCategory
WHERE item.idItem=? AND category.idRestaurant=?;`;
exports.CREATE_ITEM = `INSERT INTO item SET ?`;
exports.UPDATE_ITEM = `UPDATE item SET ? where idItem=?`;

exports.CREATE_DEALER = `INSERT INTO dealer SET ?`;
exports.UPDATE_DEALER = `UPDATE dealer SET ? where idDealer=?`;
exports.GET_ALL_DEALER = `Select *, DATE_FORMAT(createdOn,'%a, %d %b %Y %T') as createdOn from dealer`;
exports.CREATE_USER = `INSERT INTO sys_user SET ? `;
exports.GET_ALL_USER = `SELECT * FROM sys_user  ORDER BY idRestaurant ASC`;
exports.DELETE_USER = `DELETE FROM sys_user where idUser=?`;
exports.IS_DEALER_EXIST = `Select * from dealer where mobile=? OR email=?`;
exports.CREATE_RESTAURANT = `INSERT INTO restaurant SET ?`;

exports.CLOSE_TABLE = `UPDATE ordered_item SET status=0 where idCustomer=?`;
exports.UPDATE_TABLE_REFERENCE = `UPDATE restaurant_table SET ? where ?`;


exports.VERIFY_USER = `SELECT idUser,su.name,su.email,su.idRestaurant, su.idSystemAttribute,DATE_FORMAT(rp.contractFrom,'%Y/%m/%d') AS contractFrom,DATE_FORMAT(rp.contractTo,'%Y/%m/%d') AS contractTo,r.isActive isRestaurantActive 
FROM sys_user su 
INNER JOIN  system_attribute sa ON sa.idSystemAttribute = su.idSystemAttribute
LEFT JOIN restaurant r ON r.idRestaurant = su.idRestaurant
LEFT JOIN restaurant_payment rp ON rp.idRestaurant = r.idRestaurant
WHERE su.password=? AND su.isActive=1
AND su.email=? OR su.mobile=? LIMIT 0,1`;
// AND sa.type='SuperAdmin'
exports.SAVE_STOCK_VALUE = `INSERT INTO stock_transaction (id_stock, value,last_updated) VALUES (?, ?, NOW());`;

exports.CHECK_USER_WRITE_ACCESS = `Select * from user_grants where id_user=? AND id_stock=? AND grant_name='WRITE'`;

exports.GET_LIST_OF_STOCK = `SELECT DISTINCT st.*,sa.name FROM stock_transaction st 
INNER JOIN system_attribute sa ON sa.id_attribute= st.id_stock 
INNER JOIN user_grants ug ON ug.id_stock = sa.id_attribute 
INNER JOIN system_user su ON su.id_user = ug.id_user
where su.id_user=?
ORDER BY last_updated DESC LIMIT 5`;

exports.UPDATE_ORDERED_ITEM = `UPDATE ordered_item SET status=0 where idCustomer=?`;
exports.UPDATE_CUSTOMER = `UPDATE customer SET ? WHERE idCustomer=?`;
exports.GET_ALL_STOCK_Transaction = `Select * from stock_transaction ORDER BY last_updated DESC`;
// exports.GET_ALL_USER = `Select * from system_user`
exports.GET_ALL_SYSTEM_ATTRIBUTE = `Select * from system_attribute`;
exports.GET_ALL_USER_GRANTS = `Select * from user_grants`;
