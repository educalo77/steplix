module.exports = (sequelize, DataTypes) => {
  const Rates = sequelize.define(
    "Rates",
    {
      value: {
        type: DataTypes.REAL,
        allowNull: false,
      },
      id_currency: {
        type: DataTypes.INTEGER,
        allowNull: false,
      },
    },
    {
      timestamps: true,
      updatedAt: false,
    }
  );
  return Rates;
};
