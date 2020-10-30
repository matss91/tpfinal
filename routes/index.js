var express = require('express');
var router = express.Router();
const indexController = require('../controllers/indexController')

/* GET users listing. */
router.get('/', indexController.home);

module.exports = router;
