var createError = require('http-errors');
var express = require('express');
var path = require('path');
var cookieParser = require('cookie-parser');
var logger = require('morgan');

var db = require('./database/models')

var indexRouter = require('./routes/index');
var productosRouter = require('./routes/productos');
var usuarioRouter = require('./routes/usuario');

var session = require('express-session');

var app = express();

// view engine setup
app.set('views', path.join(__dirname, 'views'));
app.set('view engine', 'ejs');

app.use(logger('dev'));
app.use(express.json());
app.use(express.urlencoded({ extended: false }));
app.use(cookieParser());
app.use(express.static(path.join(__dirname, 'public')));



app.use(session({ secret: "Cualquiercosa!!!" }));

app.use(function (req, res, next) {
  res.locals = {
    usuarioLogueado: req.session.usuarioLogueado
  }
  return next();
})

app.use(function (req, res, next) {

  if (req.cookies.idUsuario != undefined && req.session.usuarioLogueado == undefined) {
    db.Usuario.findByPk(req.cookies.idUsuario)
      .then(function (user) {
        req.session.usuarioLogueado = user;
        res.locals.usuarioLogueado = user
        return next()
      })
  } else {
    return next();
  }
})

app.use('/', indexRouter);
app.use('/productos', productosRouter);
app.use('/usuario', usuarioRouter);

// catch 404 and forward to error handler
app.use(function(req, res, next) {
  next(createError(404));
});

// error handler
app.use(function(err, req, res, next) {
  // set locals, only providing error in development
  res.locals.message = err.message;
  res.locals.error = req.app.get('env') === 'development' ? err : {};

  // render the error page
  res.status(err.status || 500);
  res.render('error');
});

module.exports = app;
