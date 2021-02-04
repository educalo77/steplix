const { Moneda } = require("../db");

const getAll = () => {
  return new Promise((resolve, reject) => {
    Moneda.findAll()
      .then((currencies) => {
        resolve(currencies);
      })
      .catch((err) => reject(err));
  });
};

const createOne = (description, symbol) => {
  return new Promise((resolve, reject) => {
    console.log(description, symbol);
    Moneda.create({ description, symbol })
      .then((currency) => {
        resolve(currency);
      })
      .catch((err) => {
        reject(err);
      });
  });
};

module.exports = {
  createOne,
  getAll,
};
