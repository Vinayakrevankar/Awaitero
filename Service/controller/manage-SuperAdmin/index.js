const express = require('express');
const router = express.Router();
const {asyncMiddleware:_async,authFilterMiddleware} = require('../../common');
const superAdminHandler = require('./superAdminHandler')
var uuid4 = require("uuid4");
const multer  = require('multer');

var storage = multer.diskStorage({
  destination: function (req, file, cb) {
    cb(null, './uploads')
  },
  filename: function (req, file, cb) {
    var d =''
    if(req.body.idRestaurant)
      d = `idRestaurant-${req.body.idRestaurant}`
    let ex = file.originalname.split(".")
    cb(null, d+uuid4()+`.${ex[ex.length-1]}`)
  }
})
const upload = multer({ storage: storage })

// Module access defining here
router.use((req, res, next) => {
  console.log('All Routes are configuring... Super Admin'+new Date());
  next();
});
router.get('/emit',[_async(superAdminHandler.emitMessage)]);

router.get('/bill/:idBill',[_async(superAdminHandler.getBill)]);
router.get('/checkpoint',[_async(superAdminHandler.checkpoint)]);
router.put('/dealer/:idDealer',[authFilterMiddleware,_async(superAdminHandler.updateDealer)]);
router.get('/getCategory/:idRestaurant',[authFilterMiddleware,_async(superAdminHandler.getCategory)])
router.get('/getItemByCategory/:idCategory',[authFilterMiddleware,_async(superAdminHandler.getItemByCategory)])
router.get('/getItem/:idRestaurant/All',[authFilterMiddleware,_async(superAdminHandler.getAllItem)])
 router.post('/login',[_async(superAdminHandler.login)]);
 router.put('/getRestaurants/:idRestaurant/details',[authFilterMiddleware,_async(superAdminHandler.updateRestaurant)])
 router.put('/restaurant/image',[authFilterMiddleware,upload.fields([{name: 'restaurantLogo', maxCount: 1}]),_async(superAdminHandler.updateRestaurantLogo)])

 router.get('/getRestaurants',[authFilterMiddleware,_async(superAdminHandler.getRestaurants)]);
 router.get('/getRestaurants/:idRestaurant',[_async(superAdminHandler.getSpecificRestaurant)])
 router.put('/getRestaurants/:idRestaurant',[authFilterMiddleware,_async(superAdminHandler.updateRestaurantStatus)])

 router.post('/getReport/:idRestaurant',[authFilterMiddleware,_async(superAdminHandler.getReportByRestaurant)])
 router.get('/getAllCouponByRestaurant',[authFilterMiddleware,_async(superAdminHandler.getAllCouponByResturant)]);
 router.post('/createCategory',[authFilterMiddleware,_async(superAdminHandler.createCategory)]);
 router.post('/createCoupon',[authFilterMiddleware,_async(superAdminHandler.createCoupon)]);
 router.put('/updateCoupon',[authFilterMiddleware,_async(superAdminHandler.updateCoupon)]);
 router.post('/createItem',[authFilterMiddleware,_async(superAdminHandler.createItem)]);
 router.put('/updateItem',[authFilterMiddleware,_async(superAdminHandler.updateItem)]);
 router.delete('/deleteCoupon',[authFilterMiddleware,_async(superAdminHandler.deleteCoupon)]);
 router.delete('/deleteCategory',[authFilterMiddleware,_async(superAdminHandler.deleteCategory)]);
 router.post('/generateBill',[authFilterMiddleware,_async(superAdminHandler.generateBill)]);
// ref ---> upload.single('avatar')
 router.post('/dealer/create',[upload.fields([{name: 'aadharIdProofPath', maxCount: 1}, {name: 'pancardIdProofPath', maxCount: 1}]),_async(superAdminHandler.createDealer)]);
 router.get('/dealer/list',[authFilterMiddleware,_async(superAdminHandler.getAllDealer)]);

router.delete('/deleteItem',[authFilterMiddleware,_async(superAdminHandler.deleteItem)]);


//  router.get('/getAllSystemAttributes',[_async(superAdminHandler.getAllSystemAttributes)]);
//  router.get('/getAllUserGrants',[_async(superAdminHandler.getAllUserGrants)]);
 router.post('/createTable',[authFilterMiddleware,_async(superAdminHandler.createTable)])
 router.get('/getAllTable/:idRestaurant',[authFilterMiddleware,_async(superAdminHandler.getAllTable)])
 router.get('/getTable/:idTable',[authFilterMiddleware,_async(superAdminHandler.getTable)])

 router.put('/updateTable/:idTable',[authFilterMiddleware,_async(superAdminHandler.updateTable)])
 router.put('/cancelItem',[authFilterMiddleware,_async(superAdminHandler.cancelItem)]);
 router.put('/closeOrder/:idTable',[authFilterMiddleware,_async(superAdminHandler.closeOrder)]);
 router.post('/sendBill',[authFilterMiddleware,_async(superAdminHandler.sendBill)]);

 router.post('/restaurant',[_async(superAdminHandler.createRestaurant)]);

 router.post('/confirmOrder',[_async(superAdminHandler.confirmOrder)]);
 router.put('/confirmOrder',[_async(superAdminHandler.cancelConfirmedOrder)]);

// [upload.fields([{name: 'aadharIdProofPath', maxCount: 1}, {name: 'pancardIdProofPath', maxCount: 1}])
 router.post('/users',[authFilterMiddleware,_async(superAdminHandler.saveUser)]);
 router.get('/users',[authFilterMiddleware,_async(superAdminHandler.getAllUser)]);
 router.delete('/users/:idUser',[authFilterMiddleware,_async(superAdminHandler.deleteUser)]);

 router.post('/orderItems',[_async(superAdminHandler.orderItems)]);

module.exports = router;
