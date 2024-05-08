const nodemailer = require('nodemailer');

let obj  ={
  host: 'smtpout.secureserver.net',//'smtp.gmail.com',
  port: 587,
  secureConnection: true,
  // secure: true, // use SSL
  auth: {
    user: 'info@awaitero.com',
    pass: 'awaitero@123'
  },
  tls: {
    ciphers:'SSLv3'
 },
}
// let obj1 = {
//   host: 'smtp.gmail.com',
//   port: 465,
//   secure: true, // use SSL
//   auth: {
//     user: 'awaiterobroucher@gmail.com',
//     pass: 'awaitero@123.'
//   }
// }
const transporter = nodemailer.createTransport(obj);

const SendMail = (mailOptions) => transporter.sendMail(mailOptions, (error) => {
  if (error) {
    // console.log('Something Went Wrong',error);
    return error;
  }
  // console.log('Sent Mail');
});

// const mailOptions = {
//   from: 'vinayakrevankar1996@gmail.com',
//   to: email,
//   subject: 'OTP Verification',
//   html: `<html><head></head><body>Hi ${firstname} <br> Your one time password OTP: ${otp} and is valid for 10 minutes </body></html>`
// };
// const mailOptions = {
//   from: 'awaiterobroucher@gmail.com',
//   to: 'teamAwaitero@gmail.com',
//   subject: `Awaitero Bill-9999`,
//   html: `<html><head></head><body>Dear Guest, <br> <p>Thank you for using Awaitero.<br>Click on link for bill : <a href="#">Link</a> </p> <p>Regards,<br> Team Awaitero</p></body></html>`
// };
// SendMail(mailOptions)

exports.SendMail = SendMail;
