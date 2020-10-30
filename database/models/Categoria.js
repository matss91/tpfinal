module.exports = (sequelize, DataTypes) => {

    let cols = {
        id: {
            type: DataTypes.INTEGER,
            autoIncrement: true,
            primaryKey: true
        },
        nombre: {
            type: DataTypes.STRING
        }
    };

    let config = {
        tableName: "categorias"
    };

    const Categoria = sequelize.define("Categoria", cols, config);


    return Categoria;

}