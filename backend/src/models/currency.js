module.exports = (sequelize, DataTypes) => {
  const Currency = sequelize.define(
    "currency",
    {
      description: {
        type: DataTypes.STRING,
        allowNull: false,
      },
      symbol: {
        type: DataTypes.STRING,
        allowNull: false,
      },
    },
    { timestamps: false }
  );
  return Currency;
};
