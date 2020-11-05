module.exports = (sequelize, DataTypes) => {

    let cols = {
        id: {
            type: DataTypes.INTEGER,
            autoIncrement: true,
            primaryKey: true
        },
        nombre: {
            type: DataTypes.STRING
        },
        marca: {
            type: DataTypes.STRING
        },
        precio: {
            type: DataTypes.STRING
        },
        img_url: {
            type: DataTypes.STRING
        },
        categoria_id: {
            type: DataTypes.INTEGER,
        },
        usuario_id: {
            type: DataTypes.INTEGER
        }
    };

    let config = {
        tableName: "products"
    };

    const Producto = sequelize.define("Producto", cols, config);

 
    Producto.associate = function (models) {
        Producto.belongsTo(models.Categoria, {
            as: 'categorias',
            foreignKey: 'categoria_id'
        })

        Producto.belongsTo(models.Usuario, {
            as: 'usuario',
            foreignKey: 'usuario_id'
        })
        
        Producto.hasMany(models.Comentario, {
            foreignKey: 'producto_id',
            as: 'comentarios'
        })  
    }



    return Producto;

}