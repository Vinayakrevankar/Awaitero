const adminDA = require('./adminDA');
const  { httpUtil, customException } = require('../../utils')
const _ = require('lodash');

exports.login = async (req, res) => {
      const { username,password }= req.body;
      const data = await adminDA.verifyUser(username,password);
      if (_.isEmpty(data)) throw customException('User Not Found');
      
      return res.json(httpUtil.getSuccess(data));
};

exports.saveStockValue = async (req, res) => {
  const { idUser,idStock,value }= req.body;
  const checkUserGrants =  await adminDA.checkUserWriteAccess(idUser,idStock);
  if(checkUserGrants.length)
      { 
        const data = await adminDA.saveStockValue(idStock,value);    
       return res.json(httpUtil.getSuccess(data));
      }
  throw customException('Access Denied');
};
  
exports.getlist = async (req, res) => {
  const idUser = req.params.idUser;
  const data = await adminDA.getListOfStock(idUser);
  return res.json(httpUtil.getSuccess(data));
};

exports.updateStockValue= async () => {

  const result = await adminDA.getStockValue();
    if(result && result.length){
      await result.map(async val=>{
            await adminDA.saveStockValue(val.idStock,Math.floor(Math.random() * 999));
      })
      let getUpdateData = await adminDA.getAllStockValue() 
      return getUpdateData;
    }else 
      return [];
};

//extra API
exports.getAllStockTransaction =  async (req, res) => {
  const result = await  adminDA.getAllStockTransaction();
  res.json(httpUtil.getSuccess(result))
}

exports.getAllUser =  async (req, res) => {
  const result = await  adminDA.getAllUser();
  res.json(httpUtil.getSuccess(result))
}
exports.getAllSystemAttributes =  async (req, res) => {
  const result = await  adminDA.getAllSystemAttributes();
  res.json(httpUtil.getSuccess(result))
}
exports.getAllUserGrants =  async (req, res) => {
  const result = await  adminDA.getAllUserGrants();
  res.json(httpUtil.getSuccess(result))
}
