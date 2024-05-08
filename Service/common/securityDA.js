const { db: MySQL } = require('../utils');

exports.VERIFY_USER = async (idRestaurant, email, idUser) => MySQL.query(`Select idUser,name,email,idRestaurant, su.idSystemAttribute from sys_user su
INNER JOIN system_attribute sa ON sa.idSystemAttribute = su.idSystemAttribute
where isActive=1 AND idRestaurant=? AND email=? AND idUser=?`, [idRestaurant, email, idUser]);
