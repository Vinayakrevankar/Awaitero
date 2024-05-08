var express = require('express');
const router = express.Router();
const {apiConfig} = require('../constants')
const superAdminController = require('./manage-SuperAdmin')
const UserController = require('./manage-User')
const {
  HOTEL_MANGEMENT
} = apiConfig;
const httpUtil = require('./../utils/httpUtil');

router.use((req, res, next) => {
  console.log('All Routes are configuring...');
  next();
});

router.use(HOTEL_MANGEMENT.SUPER_ADMIN_API, superAdminController);
router.use(HOTEL_MANGEMENT.USER_API, UserController);
router.use((_, res) => res.json(httpUtil.getNotFound()));

module.exports = router;