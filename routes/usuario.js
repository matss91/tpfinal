var express = require('express');
var router = express.Router();
const usuarioController = require('../controllers/usuarioController')

/* GET users listing. */
router.get('/login', usuarioController.loginForm);

router.get('/logout', usuarioController.logout);

router.post('/loginCheck', usuarioController.login);

router.get('/registro', usuarioController.registro);

router.post('/registroCheck', usuarioController.registroCheck);

router.get('/comentarios', usuarioController.comentarios);

router.get('/borrarComentario/:id', usuarioController.borrarComentario);

router.post('/borrar/:id', usuarioController.dropComentario);


module.exports = router;
