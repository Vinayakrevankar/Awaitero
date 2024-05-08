exports.SAVE_USER = `INSERT INTO customer SET ? `
exports.UPDATE_TABLE_OCCUPIED = `UPDATE restaurant_table SET ? where idTable=?`
exports.GET_TABLE_DETAILS = `SELECT * from restaurant_table where idTable=?`
exports.GET_TABLE_DETAILS_BY_ID_REFERENCE = `SELECT * from restaurant_table where idReference=?`
exports.CHECK_TABLE_STATUS = `Select rt.*,r.gst,r.latitude,r.longitude,r.radius,r.isActive restaurantIsActive,r.name restaurantName from restaurant_table rt 
JOIN restaurant r ON r.idRestaurant = rt.idRestaurant  where idReference=?`
exports.GET_ITEMS_BY_TABLE = `SELECT i.*,oi.* FROM ordered_item oi INNER JOIN item i ON i.idItem=oi.idItem where oi.idTable=? AND oi.isCancelled=0 AND status=1 ORDER BY oi.createdOn DESC`

exports.GET_UPDATED_VALUE = `SELECT 
  st.id_stock,
  sa.name,
  value,
  last_updated
FROM stock_transaction st
  INNER JOIN (
    SELECT id_stock, MAX(last_updated) AS lastUpdated FROM stock_transaction GROUP BY id_stock
  ) ms ON st.id_stock = ms.id_stock AND last_updated = lastUpdated
  INNER JOIN system_attribute sa ON sa.id_attribute= st.id_stock`


exports.VERIFY_USER = `Select id_user idUser,user userName from system_user where user=? AND password=?`;