var express = require('express');
var router = express.Router();
const usuarioController = require('../controllers/usuarioController')

/* GET users listing. */
router.get('/login', usuarioController.loginForm);

router.post('/loginCheck', usuarioController.login);

router.get('/registro', usuarioController.registro);

router.post('/registroCheck', usuarioController.registroChech);

module.exports = router;
