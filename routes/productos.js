var express = require('express');
var router = express.Router();
const productosController = require('../controllers/productosController')

/* GET users listing. */
router.get('/detalle/:id', productosController.detalle);

router.get('/categoria/:laCategoria', productosController.porCategoria);

router.get('/buscar', productosController.buscar);

router.post('/agregarComentario/:id', productosController.agregarComentario);

router.get('/agregarProducto', productosController.agregarProducto);

router.post('/agregarProducto', productosController.productoSubmit);

router.get('/misProductos', productosController.misProductos);

router.get('/editar/:id', productosController.editarProducto);

router.post('/editar/:id', productosController.editarConfirm);

router.get('/borrar/:id', productosController.borrarProducto);

router.post('/borrar/:id', productosController.borrarConfirm);

module.exports = router;
