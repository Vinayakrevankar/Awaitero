const _ = require('lodash');
const jwt = require('jsonwebtoken');
const { httpUtil, customException } = require('../utils');
const securityDA = require('./securityDA');


exports.authFilterMiddleware = async (req, res, next) => {
    try {
      const token = req.get('Authorization');
      const key="JqaXPsfAMN4omyJWj9ASVI97451Sc8o9nbEQStbsiJ";  // this will go in environment variable or secure place
      if (token) {
        const rm = `${token}`.split(" ")[1];
        const userInfo = jwt.verify(rm, key); // Buffer.from(chucks[1], 'base64').toString('ascii');
       
        const { idRestaurant, email, idUser,  } = userInfo;  // idSystemAttribute
        if (_.isEmpty(userInfo)) {
          return res.json(httpUtil.getUnauthorized());
        }
  
        const [user = {}] = await securityDA.VERIFY_USER(idRestaurant, email, idUser);
        if (_.isEmpty(user)) {
          return res.json(httpUtil.getUnauthorized());
        } 
        res.locals.idUser = user.idUser;
        res.locals.email = user.email;
        next();
      }
      else {
        throw customException('Token Expired/ Invalid Token');
      }
    }
    catch (error) {
      return res.json(httpUtil.getUnauthorized());
    }
    
  };
  