const db = require('../database/models');
const Sequelize = require('sequelize');
const op = db.Sequelize.Op;

module.exports = {
    detalle: function (req,res) {
        let id = req.params.id;
        db.Producto.findByPk(id)
        .then(function (unProducto) {
            res.render('detalle',{ unProducto: unProducto, title: unProducto.nombre })
        })
    },

    porCategoria: function (req,res) {
        let categoria = req.params.laCategoria;
        db.Producto.findAll({
            where: {
                categoria: categoria
            }
        })
        .then(function (productos) {
            res.render('porCategoria', { productos: productos, title: productos[0].categoria })
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
            console.log('LOS RESULTADOS DE LA BUSQUEDA:' + resultados);
            res.render('resultadoBusqueda', { title: busqueda , resultados: resultados});
        })
    },

    agregarProducto: function (req,res) {
        
    }
}