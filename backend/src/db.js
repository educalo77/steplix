require("dotenv").config();
const { Sequelize, DataTypes } = require("sequelize");

const Currency = require("./models/currency");
const Rates = require("./models/rates");

const sequelize = new Sequelize(
  process.env.POSTGRES_DB,
  process.env.POSTGRES_USER,
  process.env.POSTGRES_PASSWORD,
  {
    host: "db",
    dialect: "postgres",
    operatorsAliases: false,

    pool: {
      max: 5,
      min: 0,
      acquire: 30000,
      idle: 10000,
    },
  }
);

const Moneda = Currency(sequelize, DataTypes);
const Valor = Rates(sequelize, DataTypes);

Moneda.hasMany(Valor, {
  foreignKey: "id_currency",
  sourceKey: "id",
});
Valor.belongsTo(Moneda, {
  foreignKey: "id_currency",
  targetKey: "id",
});

module.exports = {
  conn: sequelize,
  Moneda,
  Valor,
};
