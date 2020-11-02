module.exports = (sequelize, DataTypes) => {

    let cols = {
        id: {
            type: DataTypes.INTEGER,
            autoIncrement: true,
            primaryKey: true
        },
       texto_comentario: {
           type: DataTypes.STRING
       },
       calificacion: {
           type: DataTypes.INTEGER
       },
       producto_id: {
           type: DataTypes.INTEGER
       },
       usuario_id: {
           type: DataTypes.INTEGER
       }
    };

    let config = {
        tableName: "comentarios"
    };

    const Comentario = sequelize.define("Comentario", cols, config);

    Comentario.associate = function (models) {
        Comentario.belongsTo(models.Producto, {
            foreignKey: 'producto_id',
            as: 'producto'
        })
        
        Comentario.belongsTo(models.Usuario, { 
            foreignKey: 'usuario_id',
            as: 'usuario'
        })
    }


    return Comentario;

}