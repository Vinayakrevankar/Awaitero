var express = require('express');
const apiConfig = require('./constants/apiConfig');
const { errorHandlers } = require('./common');
const controllers = require('./controller');
const { isLocalHost } = require('./config/default.json')
var app = express();
var cors = require('cors');
var corsOptions = {
  origin: 'https://awaitero.com',
  optionsSuccessStatus: 200 // For legacy browser support
}
app.use(express.json());
if(isLocalHost)
app.use(cors())
else
app.use(cors(corsOptions))

app.use(apiConfig.ROOT_URL,controllers);

app.use('/uploads', express.static(__dirname + '/uploads'));

app.use([
    errorHandlers.errorLogMiddleware,
    errorHandlers.customError,
    errorHandlers.validationErrorMiddleware,
    errorHandlers.handleExceptionSQLMiddleware
  ]);
module.exports = app;
