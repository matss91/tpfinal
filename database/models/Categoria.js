module.exports = (sequelize, DataTypes) => {

    let cols = {
        id: {
            type : DataTypes.INTEGER.UNSIGNED,
            primaryKey : true,
            allowNull : true,
            autoIncrement :true 
        },
       nombre: {
            type : DataTypes.STRING(45),
         
            allowNull : true,
           
        },
    };

    let config = {
        tableName :'categorias',
       timestamps : false,
       underscored : false,
    };

    const Categoria = sequelize.define("Categoria", cols, config);

  

    return Categoria;

}