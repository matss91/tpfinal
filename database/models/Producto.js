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
        categoria: {
            type: DataTypes.INTEGER
        }
    };

    let config = {
        tableName: "products"
    };

    const Producto = sequelize.define("Producto", cols, config);


    return Producto;

}