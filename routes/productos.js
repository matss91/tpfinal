var express = require('express');
var router = express.Router();
const productosController = require('../controllers/productosController')

/* GET users listing. */
router.get('/detalle/:id', productosController.detalle);

router.get('/categoria/:laCategoria', productosController.porCategoria);

router.get('/buscar', productosController.buscar);

module.exports = router;
