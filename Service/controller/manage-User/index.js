const express = require('express');
const router = express.Router();
const { asyncMiddleware: _async } = require('../../common');
const userHandler = require('./userHandler')

router.use((req, res, next) => {
    next();
});

// Module access defining here
router.use((req, res, next) => {
    console.log('All Routes are configuring...');
    next();
});


router.post('/login', [_async(userHandler.login)]);
router.get('/items/:idReference', [_async(userHandler.getAllItems)])
router.post('/:idReference', [_async(userHandler.checkTableStatus)])

router.post('/save', [_async(userHandler.saveStockValue)]);
router.get('/user/:idUser/list', [_async(userHandler.getlist)])

router.get('/getAllStockTransaction', [_async(userHandler.getAllStockTransaction)]);
router.get('/getAllUser', [_async(userHandler.getAllUser)]);
router.get('/getAllSystemAttributes', [_async(userHandler.getAllSystemAttributes)]);
router.get('/getAllUserGrants', [_async(userHandler.getAllUserGrants)]);


module.exports = router;