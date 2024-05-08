const superAdminDA = require("./superAdminDA");
const { httpUtil, customException } = require("../../utils");
const _ = require("lodash");
var moment = require("moment");
var voucher_codes = require("voucher-code-generator");
const uuid4 = require("uuid4");
const { SendMail } = require("../../utils/sendMail");
// const { is } = require("express/lib/request");
// const { send } = require("process");
const mysql = require("../../utils/db");
const jwt = require("jsonwebtoken");
const dateCheck = (from, to, check) => {
    let fDate,lDate,cDate;
    fDate = Date.parse(from);
    lDate = Date.parse(to);
    cDate = Date.parse(check);
    if((cDate <= lDate && cDate >= fDate))  return true
    return false;
}

exports.login = async (req, res) => {
  const { email: emailOrMobile, password } = req.body;
  const [data] = await superAdminDA.verifyUser(emailOrMobile, password);
  let dateObj = new Date();
  let month = dateObj.getUTCMonth() + 1; //months from 1-12
  let day = dateObj.getUTCDate();
  let year = dateObj.getUTCFullYear();
  let newdate = year + "/" + month + "/" + day;
  if (_.isEmpty(data))
    throw customException("User Not Found");
  else if (data.idSystemAttribute !== 73 && (!data.isRestaurantActive || !dateCheck(data.contractFrom,data.contractTo,newdate))){
    console.log("data",data)
    console.log(data.contractFrom,data.contractTo,newdate)
    console.log(dateCheck(data.contractFrom,data.contractTo,newdate))
    throw customException("Restaurant is Inactive. <br> Contact Awaitero");
  }
  else {
    const jwtToken = jwt.sign(
      {
        idRestaurant: data.idRestaurant,
        email: data.email,
        idUser: data.idUser,
        idSystemAttribute: data.idSystemAttribute,
      },
      "JqaXPsfAMN4omyJWj9ASVI97451Sc8o9nbEQStbsiJ",
      { expiresIn: "7d" }
    );
    data.token = jwtToken;
  }
  return res.json(httpUtil.getSuccess([data]));
};

exports.getRestaurants = async (req, res) => {
  let getRestaurants = await superAdminDA.getRestaurants();

  getRestaurants = await Promise.all(
    getRestaurants.map(async (val) => {
      val.contract = await superAdminDA.getRestaurantContract(val.idRestaurant);
      return val;
    })
  );
  const getRestaurantActiveCount =
    await superAdminDA.getRestaurantActiveCount();
  const getRestaurantInActiveCount =
    await superAdminDA.getRestaurantInActiveCount();
  let arr = getRestaurantActiveCount.concat(getRestaurantInActiveCount);
  let count = arr.reduce((r, c) => Object.assign(r, c), {});
  return res.json(
    httpUtil.getSuccess({
      restaurants: getRestaurants,
      count: count,
    })
  );
};

exports.getSpecificRestaurant = async (req, res) => {
  const getRestaurants = await superAdminDA.getSpecificRestaurant(
    +req.params.idRestaurant
  );
  let category = await superAdminDA.getAllCategory(+req.params.idRestaurant);
  const items = await superAdminDA.getAllItems(+req.params.idRestaurant);
  category = category.map((val) => {
    val.items = items.filter((va) => va.idCategory == val.idCategory);
    return val;
  });
  return res.json(
    httpUtil.getSuccess({ restaurant: getRestaurants, category, items })
  );
};
exports.saveUser = async (req, res) => {
  const data = req.body;
  const result = await superAdminDA.saveUser(data);
  return res.json(httpUtil.getSuccess(result));
};
exports.getAllUser = async (req, res) => {
  const result = await superAdminDA.getAllUser();
  return res.json(httpUtil.getSuccess(result));
};

exports.deleteUser = async (req, res) => {
  const idUser = req.params.idUser;
  const result = await superAdminDA.deleteUser(idUser);
  return res.json(httpUtil.getSuccess(result));
};

exports.generateBill = async (req, res) => {
  const conn = await mysql.getTransactionConnection();
  const data = req.body;
  try {
    const [result] = await superAdminDA.getUserDetailsByTable(data.idTable);
    if (!result.billNo) {
      const [{ billNo }] = await superAdminDA.generateBill(
        conn,
        data.idRestaurant
      );
      const updateBillNo = await superAdminDA.updateCustomer(
        conn,
        { billNo: billNo, billDate: new Date() },
        data.idCustomer
      );
      conn.commit();
      return res.json(httpUtil.getSuccess(updateBillNo));
    } else {
      throw customException("Bill Already Generated");
    }
  } catch (err) {
    conn.rollback();
    throw err;
  }
};
exports.orderItems = async (req, res) => {
  const data = req.body;
  const idReference = data.idReference;
  let saveRes = await superAdminDA.getAllTable(data.idRestaurant);
  saveRes = saveRes.filter((val) => val.idReference == idReference);
  const idTable = saveRes[0].idTable;
  const [getCustDetails] = await superAdminDA.getUserDetailsByTable(+idTable);
  const savePayload = data.cartValue.map((val) => {
    return [
      idReference,
      getCustDetails.idCustomer,
      val.idItem,
      val.price,
      idTable,
      new Date(),
      1,
    ];
  });

  const result = await superAdminDA.saveOrder(savePayload);


  // TODO SOCKET 
  // let id = `Rest${data.idRestaurant}`;
  // let tableId = `table${idTable}`;
  // let socket = global.socket;

  // socket.emit(id, { refresh: true, id: socket.id });
  // socket.emit(tableId, { refresh: true, id: socket.id });

  return res.json(httpUtil.getSuccess(result));
};
exports.confirmOrder = async (req, res) => {
  const conn = await mysql.getTransactionConnection();

  try {
    const { idOrder, cancelList, idRestaurant, idCustomer } = req.body;

    if (idOrder.length) {
      let sequence = null;
      let kotResult = await superAdminDA.getKotId(
        conn,
        idRestaurant,
        idCustomer
      );
      if (!kotResult.length) sequence = 1;
      else
        [{ sequence }] = await superAdminDA.getKotSequence(
          conn,
          idRestaurant,
          idCustomer
        );
      let kotData = {
        sequence,
        idRestaurant,
        idCustomer,
      };

      await superAdminDA.AddKot(conn, kotData);
      let [kot] = await superAdminDA.getKotId(conn, idRestaurant, idCustomer);
      await superAdminDA.confirmOrder(conn, kot.idKot, idOrder);
      conn.commit();
    }
    if (cancelList.length) {
      await superAdminDA.cancelItem(cancelList);
    }

    return res.json(httpUtil.getSuccess());
  } catch (err) {
    conn.rollback();
    throw err;
  }
};

exports.cancelConfirmedOrder = async (req, res) => {
  const data = req.body;
  const result = await superAdminDA.cancelConfirmedOrder(data);
  return res.json(httpUtil.getSuccess(result));
};

exports.updateRestaurantStatus = async (req, res) => {
  const getRestaurants = await superAdminDA.getSpecificRestaurant(
    +req.params.idRestaurant
  );
  let isActive = getRestaurants[0].isActive == 1 ? 0 : 1;
  const result = await superAdminDA.updateRestaurantStatus(
    isActive,
    +req.params.idRestaurant
  );
  return res.json(httpUtil.getSuccess(result));
};
exports.updateRestaurant = async (req, res) => {
  let { contractFrom, contractTo, ...data } = req.body;
  let idRestaurant = req.params.idRestaurant;
  const result = await superAdminDA.updateRestaurant(data, idRestaurant);
 await superAdminDA.updatePaymentTable(
    { contractFrom, contractTo },
    idRestaurant
  ); //  updatePaymentTable

  return res.json(httpUtil.getSuccess(result));
};
exports.getlist = async (req, res) => {
  const idUser = req.params.idUser;
  const data = await superAdminDA.getListOfStock(idUser);
  return res.json(httpUtil.getSuccess(data));
};

exports.createCategory = async (req, res) => {
  let data = req.body;

  const isCategoryExists = await superAdminDA.isCategoryExists(
    data.idRestaurant,
    data.name,
    data.type
  );
  if (isCategoryExists.length) throw customException("Category Already Exists");

  const result = await superAdminDA.createCategory(data);
  if (result) {
    const result = await superAdminDA.getAllCategory(data.idRestaurant);
    return res.json(httpUtil.getSuccess(result));
  }
};
exports.createCoupon = async (req, res) => {
  let { validFrom, validTo, couponCode, ...data } = req.body;
  validFrom = moment(validFrom).format();
  validTo = moment(validTo).format();
  couponCode = voucher_codes.generate({
    length: 10,
    count: 1,
    prefix: "BON",
    postfix: "2021",
    pattern: "##-####-###-##",
    charset: voucher_codes.charset("alphabetic"),
  });
  data = {
    createdOn: new Date(),
    validFrom,
    validTo,
    couponCode,
    ...data,
  };

  const isCouponCodeExists = await superAdminDA.isCouponExists(
    +data.idRestaurant,
    data.couponCode
  );
  if (isCouponCodeExists.length)
    throw customException("Coupon Code Already Exists");

  const result = await superAdminDA.createCoupon(data);

  return res.json(httpUtil.getSuccess(result));
};

exports.deleteCoupon = async (req, res) => {
  let { idCoupon } = req.body;

  let data = {
    updatedOn: new Date(),
    isDeleted: 1,
  };

  const result = await superAdminDA.updateCoupon(data, idCoupon);

  return res.json(httpUtil.getSuccess(result));
};

exports.emitMessage = async (req, res) => {
  let socket = global.socket;

  socket.emit("welcome", { message: "Welcome!", id: socket.id });

  console.log("EMITTED");

  return res.json(httpUtil.getSuccess());
};

exports.getBill = async (req, res) => {
  let idBill = req.params.idBill;
  const result = await superAdminDA.getBillByIdCustomer(idBill);
  return res.json(httpUtil.getSuccess(result));
};

exports.deleteCategory = async (req, res) => {
  let { idCategory, idRestaurant } = req.body;
  const isItemExists = await superAdminDA.getAllItemsByCategory(idCategory);
  if (isItemExists.length) {
    throw customException("Category is linked with the Items");
  } else {
    const result = await superAdminDA.deleteCategory(idCategory, idRestaurant);
    return res.json(httpUtil.getSuccess(result));
  }
};
exports.deleteItem = async (req, res) => {
  let { idItem, idRestaurant } = req.body;
  const result = await superAdminDA.deleteItem(idItem, idRestaurant);
  return res.json(httpUtil.getSuccess(result));
};

exports.updateCoupon = async (req, res) => {
  // const format1 = "YYYY-MM-DD HH:mm:ss";
  let { idCoupon, validFrom, validTo, ...data } = req.body;

  validFrom = moment(validFrom).format();
  validTo = moment(validTo).format();
  data = {
    updatedOn: new Date(),
    validFrom,
    validTo,
    ...data,
  };

  const result = await superAdminDA.updateCoupon(data, idCoupon);

  return res.json(httpUtil.getSuccess(result));
};
exports.createItem = async (req, res) => {
  let { idRestaurant: _, ...data } = req.body;
  
  data = {
    createdOn: new Date(),
    ...data,
  };

  const isItemExists = await superAdminDA.isItemExists(
    data.idCategory,
    data.idRestaurant,
    data.name
  );
  if (isItemExists.length)
    throw customException(
      "Item Name in Same Category Already Exists Please Verify"
    );
  const result = await superAdminDA.createItem(data);

  return res.json(httpUtil.getSuccess(result));
};

exports.updateItem = async (req, res) => {
  let { idItem, idRestaurant, ...data } = req.body;

  data = {
    updatedOn: new Date(),
    ...data,
  };

  const isItemExists = await superAdminDA.isItemExists(idRestaurant, idItem);
  if (isItemExists.length) {
    const result = await superAdminDA.updateItem(data, idItem);
    return res.json(httpUtil.getSuccess(result));
  } else {
    throw customException("Item Not Found");
  }
};
exports.getCategory = async (req, res) => {
  const result = await superAdminDA.getAllCategory(+req.params.idRestaurant);
  return res.json(httpUtil.getSuccess(result));
};
exports.updateRestaurantLogo = async (req, res) => {
  let { idRestaurant } = req.body;
  let arrofImages = req.files;
  let fileUrls = Object.keys(arrofImages).reduce(
    (previousValue, currentValue) => {
      let key = currentValue;
      let [arr] = arrofImages[key];
      // const { filename: image, path: ppp } = arr;
      return Object.assign(previousValue, {
        [currentValue]: "uploads\\" + arr.filename,
      });
    },
    {}
  );
  let result = await superAdminDA.updateRestaurantLogo(fileUrls, idRestaurant);
  return res.json(httpUtil.getSuccess(result));
};

function formatDate(date) {
  var d = new Date(date),
    month = "" + (d.getMonth() + 1),
    day = "" + d.getDate(),
    year = d.getFullYear();

  if (month.length < 2) month = "0" + month;
  if (day.length < 2) day = "0" + day;

  return [year, month, day].join("-");
}
exports.getReportByRestaurant = async (req, res) => {
  const idRestaurant = req.params.idRestaurant;
  let { fromDate, toDate } = req.body;
  if (!fromDate && !toDate) {
    fromDate = formatDate(new Date());
    toDate = fromDate;
  }
  const result = await superAdminDA.getReportByRestaurant(
    idRestaurant,
    fromDate,
    toDate
  );
  return res.json(httpUtil.getSuccess(result));
};
exports.getItemByCategory = async (req, res) => {
  const result = await superAdminDA.getAllItemsByCategory(
    req.params.idCategory
  );
  return res.json(httpUtil.getSuccess(result));
};
exports.getAllItem = async (req, res) => {
  const result = await superAdminDA.getAllItems(+req.params.idRestaurant);
  return res.json(httpUtil.getSuccess(result));
};

//extra API
exports.getAllStockTransaction = async (req, res) => {
  const result = await superAdminDA.getAllStockTransaction();
  res.json(httpUtil.getSuccess(result));
};

exports.getAllCouponByResturant = async (req, res) => {
  const idRestaurant = req.query.idRestaurant;
  const result = await superAdminDA.getAllCouponByRestaurant(idRestaurant);
  return res.json(httpUtil.getSuccess(result));
};

exports.createDealer = async (req, res) => {
  let data = req.body;
  let arrofImages = req.files;
  let isDealerExists = await superAdminDA.isDealerExists(
    data.mobile,
    data.email
  );
  if (isDealerExists.length == 0) {
    let fileUrls = Object.keys(arrofImages).reduce(
      (previousValue, currentValue) => {
        let key = currentValue;
        let [arr] = arrofImages[key];
        // const { filename: image, path: ppp } = arr;
        return Object.assign(previousValue, {
          [currentValue]: "uploads\\" + arr.filename,
        });
      },
      {}
    );
    data = {
      createdOn: new Date(),
      ...data,
      ...fileUrls,
    };
    // var tmp_path = req.file.path;
    // let arrOfImages = req.files;

    const result = await superAdminDA.createDealer(data);
    return res.json(httpUtil.getSuccess(result));
  } else throw customException("Mobile Number/ Email Already Registered");
};

exports.createRestaurant = async (req, res) => {
  const data = req.body;
  const result = await superAdminDA.createRestaurant(data);
  return res.json(httpUtil.getSuccess(result));
};

exports.getAllDealer = async (req, res) => {
  const result = await superAdminDA.getAllDealer();
  return res.json(httpUtil.getSuccess(result));
};
exports.updateDealer = async (req, res) => {
  let idDealer = req.params.idDealer;
  let isActive = req.body;
  const result = await superAdminDA.updateDealer(isActive, idDealer);
  return res.json(httpUtil.getSuccess(result));
};
exports.createTable = async (req, res) => {
  let { idRestaurant, name, ...data } = req.body;
  let idReference = uuid4();
  // const jwtToken = jwt.sign({ idReference: idReference , cardnumber: userdata.cardnumber }, 'JqaXPsfAMN4omyJWj9c8o9nbEQStbsiJ');
  data = {
    idRestaurant,
    idReference: idReference,
    name,
    createdOn: new Date(),
    ...data,
  };
  const isNameDuplicate = await superAdminDA.isNameDuplicate(
    name,
    idRestaurant
  );
  if (isNameDuplicate.length == 0) {
    const result = await superAdminDA.createTable(data);
    return res.json(httpUtil.getSuccess(result));
  } else throw customException("Table Name Already Exists");
};
exports.getAllTable = async (req, res) => {
  let { idRestaurant } = req.params;
  let result = await superAdminDA.getAllTable(idRestaurant);
  result = await Promise.all(
    result.map(async (val) => {
      let res = await superAdminDA.getItemByTable(val.idTable);
      val.items = res.filter((va) => (val.idTable = va.idTable));
      val.newlyOrderedCount = val.items.filter((va) => va.status == 1).length;

      val.newlyOrdered = val.items.some((va) => va.status == 1);
      return val;
    })
  );
  return res.json(httpUtil.getSuccess(result));
};
exports.getTable = async (req, res) => {
  let { idTable } = req.params;
  let result = await superAdminDA.getTable(idTable);
  const items = await superAdminDA.getItemByTable(idTable);
  result = result.map((val) => {
    val.items = items.filter((va) => va.idTable == idTable);
    return val;
  });
  const customer = await superAdminDA.getUserDetailsByTable(idTable);
  let data = {
    table: result,
    items,
    customer,
  };
  return res.json(httpUtil.getSuccess(data));
};

exports.updateTable = async (req, res) => {
  let { idTable } = req.params;
  let data = req.body;
  const result = await superAdminDA.updateTable(mysql, data, idTable);
  return res.json(httpUtil.getSuccess(result));
};

exports.cancelItem = async (req, res) => {
  let { idOrder } = req.body;

  const result = await superAdminDA.cancelItem(idOrder);
  return res.json(httpUtil.getSuccess(result));
};
exports.sendBill = async (req, res) => {
    const { link, billNo, email } = req.body; // { link, name, billNo, email }
    const mailOptions = {
      from: "awaiterobroucher@gmail.com",
      to: email,
      subject: `Awaitero Bill-${billNo}`,
      html: `<html><head></head><body>Dear Guest, <br> <p>Thank you for using Awaitero.<br>Click on link for bill : <a href="${link}">Link</a> </p> <p>Regards,<br> Team Awaitero</p></body></html>`,
    };
    // SendMail(mailOptions)
    // res.json(httpUtil.getSuccess());
    let mailResult = await SendMail(mailOptions);
    return res.json(httpUtil.getSuccess(mailResult));
};
exports.closeOrder = async (req, res) => {
  const conn = await mysql.getTransactionConnection();
  try {
    let { idTable } = req.params;
    const [userDetails] = await superAdminDA.getUserDetailsByTable(idTable);

    await superAdminDA.updateCustomer(
      conn,
      { isActive: 0, updatedOn: new Date() },
      userDetails.idCustomer
    );
    const result = await superAdminDA.updateTable(
      conn,
      { occupied: 0 },
      idTable
    );
    await superAdminDA.updateOrderItem(
      conn,
      userDetails.idCustomer
    );
    conn.commit();
    if (userDetails.email) {
      const mailOptions = {
        from: "info@awaitero.com",
        to: userDetails.email,
        subject: `Awaitero Bill-${userDetails.idCustomer}`,
        html: `<html><head></head><body>Dear Guest, <br><br> <p>Thank you for using Awaitero.<br>Click on link for bill : <a href="https://awaitero.com/Admin/bill.html?idBill=${userDetails.idCustomer}">Link</a> </p> <p>Regards,<br> Team Awaitero</p></body></html>`,
      };
      SendMail(mailOptions);
    }
    return res.json(httpUtil.getSuccess(result));
  } catch (err) {
    conn.rollback();
    throw err;
  }
};