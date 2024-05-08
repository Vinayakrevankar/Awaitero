const db = require('./db');
const httpUtil = require('./httpUtil');
const sendMail = require('./sendMail');

function customException(message, code) {
  const error = new Error(message);
  error.code = code;
  error.custome = true;
  return error;
}
module.exports = {
  httpUtil,
  db,
  customException,
  sendMail
};
