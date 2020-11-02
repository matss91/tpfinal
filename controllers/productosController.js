const db = require('../database/models');
const Sequelize = require('sequelize');
const { log } = require('debug');
const op = db.Sequelize.Op;

module.exports = {
    detalle: function (req,res) {
        let id = req.params.id;
        db.Producto.findByPk(id, {
           include: [{all: true, nested: true}]
        })
        .then(function (unProducto) {
            // res.send(unProducto);
            res.render('detalle',{ unProducto: unProducto, title: unProducto.nombre })
        })
    },

    porCategoria: function (req,res) {
        let categoria = req.params.laCategoria;
        db.Producto.findAll({
            where: {
                categoria_id: categoria
            },
            include: [{
                association: 'categorias'
            }]
        })  
        .then(function (resultado) {
            res.render('porCategoria', { resultado: resultado, title: resultado[0].categorias.nombre })
        })
    },

    buscar: function (req,res) {
        let busqueda = req.query.busqueda;
        db.Producto.findAll({
            where:
                {
                    [op.or]: [
                            {
                                nombre: {
                                    [op.like]: `%${busqueda}%`
                                }
                            },
                            {
                                marca: {
                                [op.like]: `%${busqueda}%`

                                }
                            }
                   ]

                }
            
        })
        .then(function (resultados) {
            res.render('resultadoBusqueda', { title: busqueda , resultados: resultados});
        })
    },

    agregarComentario: function (req,res) {
        let idProducto = req.params.id;
        let idUsuario = req.session.usuarioLogueado.id;
        db.Comentario.create({
            texto_comentario: req.body.texto_comentario,
            calificacion: req.body.calificacion,
            usuario_id: idUsuario,
            producto_id: idProducto
        })
        .then(function () {
            res.redirect('/productos/detalle/'+idProducto)
        })
    }
}