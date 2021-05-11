const db = require('../database/models');
const Sequelize = require('sequelize');
const { restart } = require('nodemon');
const op = db.Sequelize.Op;
const bcrypt = require('bcryptjs');const { log } = require('debug');
;

module.exports = {
    loginForm: function (req,res) {
        if (req.session.usuarioLogueado != undefined) {
            res.redirect("/");
        }

        if(req.query.error == 'usuario'){
            res.render('login', { title: 'Login', error: 'usuario' })

        } else if (req.query.error == 'password'){
            res.render('login', { title: 'Login', error: 'password' })

        }else{
            res.render('login', { title: 'Login', error: false })
        }
    },

    login: function (req,res) {
        if (req.session.usuarioLogueado != undefined) {
            res.redirect("/");
        }
        db.Usuario.findOne({
            where: {
                [op.or]: [
                    {email: req.body.nombre},
                    {nombre: req.body.nombre}
                ]
            }
        })
        .then(function (usuario) {
            if(!usuario){
                res.redirect('/usuario/login?error=usuario');
            } else if (bcrypt.compareSync(req.body.password, usuario.password) == false ){
                res.redirect('/usuario/login?error=password');
            }else{
                req.session.usuarioLogueado = usuario;
                if(req.body.recordar != undefined){
                    res.cookie('usuarioLogueadoId', usuario.id, { maxAge: 1000 * 60 * 60 * 24 * 365});
                }
                
                res.redirect('/')
            }
        })
    },

    registro: function (req,res) {
        if (req.session.usuarioLogueado != undefined) {
            res.redirect("/");
        }
        if(req.query.error){
            res.render('registro', {title: 'Registración', error: true});
        }else{
            res.render('registro', {title: 'Registración', error: false});
        }
    },

    registroCheck: function (req,res) {
        if (req.session.usuarioLogueado != undefined) {
            res.redirect("/");
        }
        db.Usuario.findOne({
            where: {
                [op.or]:[
                    {email: req.body.email},
                    {nombre: req.body.nombre}
                ]
            }
        })
        .then(function (usuario) {
            if(usuario == null){
                let password = bcrypt.hashSync(req.body.password, 10);

                db.Usuario.create({
                    nombre: req.body.nombre,
                    email: req.body.email,
                    password: password,
                })
                .then(function () {
                    res.redirect('/usuario/login');
                })
            }else {
                res.redirect('/usuario/registro?error=true');
            }
            
        })
    },

    logout: function (req,res) {
        if (req.session.usuarioLogueado != undefined) {
            res.redirect("/");
        }
        req.session.usuarioLogueado = undefined;
        res.clearCookie('idUsuario');
        return res.redirect('/');
    },

    comentarios: function (req, res) {
        if (req.session.usuarioLogueado == undefined) {
            res.redirect("/");
        }
        let usuario_id = req.session.usuarioLogueado.id;
        db.Comentario.findAll({
            where: [
                {usuario_id: usuario_id}
            ],
            order:[
                ['createdAt', 'DESC']
            ],
            include: [  
                {association: 'producto'},
                {association: 'usuario'}
            ]
        })
        .then(function (comentarios) {
            res.render('misComentarios', { comentarios: comentarios, title: 'Mis comentarios' })
        })
    },

    borrarComentario: function (req,res) {
        if (req.session.usuarioLogueado == undefined) {
            res.redirect("/");
        }
        let id = req.params.id;
        db.Comentario.findByPk(id)
        .then(function (comentario) {
            res.render('borrarComentario', {comentario: comentario, title: 'Borrar comentario'})
        })
    },

    dropComentario: function (req,res) {
        if (req.session.usuarioLogueado == undefined) {
            res.redirect("/");
        }
        let id = req.params.id;
        db.Comentario.destroy({
            where: [
                { id:id }
            ]
        })
        .then(function (result) {
            console.log(result);
            res.redirect('/usuario/comentarios');
        })
    }

}




