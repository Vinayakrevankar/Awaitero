const express = require('express');
const router = express.Router();
const { asyncMiddleware: _async } = require('../../common');
const adminHandler = require('./adminHandler')
router.use((req, res, next) => {
    next();
});

// Module access defining here
router.use((req, res, next) => {
    console.log('All Routes are configuring... Stock');
    next();
});


router.post('/login', [_async(adminHandler.login)]);
router.post('/save', [_async(adminHandler.saveStockValue)]);
router.get('/user/:idUser/list', [_async(adminHandler.getlist)])

router.get('/getAllStockTransaction', [_async(adminHandler.getAllStockTransaction)]);
router.get('/getAllUser', [_async(adminHandler.getAllUser)]);
router.get('/getAllSystemAttributes', [_async(adminHandler.getAllSystemAttributes)]);
router.get('/getAllUserGrants', [_async(adminHandler.getAllUserGrants)]);


module.exports = router;