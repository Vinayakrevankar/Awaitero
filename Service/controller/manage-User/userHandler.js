const userDA = require('./userDA');
const { httpUtil, customException } = require('../../utils')
const { getDistanceFromLatLonInKm } = require('../../utils/common')
exports.login = async(req, res) => {
    let data = req.body;
    data = {
        createdOn: new Date(),
        ...data
    }
    const result = await userDA.saveUser(data);
   const updateObj = {
            occupied: 1
        }
    await userDA.updateTableOccupied(updateObj, data.idTable);

    return res.json(httpUtil.getSuccess(result));
};

exports.checkTableStatus = async(req, res) => {
    const idReference = req.params.idReference;
    let { latitude, longitude } = req.body;

    const [result] = await userDA.checkTableStatus(idReference);
    if ( result.radius !==0 && result.latitude !== 0 && result.longitude !== 0 && !getDistanceFromLatLonInKm(result.radius,latitude, longitude, result.latitude, result.longitude)) {
        throw customException(`Your not within the range of restaurant`);
    } else 
    // && getDistanceFromLatLonInKm(result.latitude, result.longitude, latitude, longitude)
    if (result && result.isActive && result.restaurantIsActive) {
       return res.json(httpUtil.getSuccess(result));
    } else if (result && !result.isActive)
        throw customException(`${result.name} is Inactive \n Contact Admin`);
        else if (result && result.isActive &&  !result.restaurantIsActive)  {
            throw customException(`Restaurant - ${result.restaurantName} is Inactive \n Contact Admin`);
        }
    else
        throw customException(`Something Went Wrong \n Contact Awaitero`);

};
exports.getAllItems = async(req, res) => {
    const idReference = req.params.idReference;
    let [result] = await userDA.getTable(idReference);
    const items = await userDA.getItemByTable(result.idTable);
    result.items = items.filter(va => va.idTable == result.idTable)
    return res.json(httpUtil.getSuccess(result));

}

exports.saveStockValue = async(req, res) => {
    const { idUser, idStock, value } = req.body;
    const checkUserGrants = await userDA.checkUserWriteAccess(idUser, idStock);
    if (checkUserGrants.length) {
        const data = await userDA.saveStockValue(idStock, value);
        return res.json(httpUtil.getSuccess(data));
    }
    throw customException('Access Denied');
};

exports.getlist = async(req, res) => {
    const idUser = req.params.idUser;
    const data = await userDA.getListOfStock(idUser);
    return res.json(httpUtil.getSuccess(data));
};

exports.updateStockValue = async() => {

    const result = await userDA.getStockValue();
    if (result && result.length) {
        await result.map(async val => {
            await userDA.saveStockValue(val.idStock, Math.floor(Math.random() * 999));
        })
        let getUpdateData = await userDA.getAllStockValue()
        return getUpdateData;
    } else
        return [];
};
