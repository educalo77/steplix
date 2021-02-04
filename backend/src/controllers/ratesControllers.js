const { Valor, Moneda } = require("../db");

const createOne = (id_currency, value) => {
  return new Promise((resolve, reject) => {
    Valor.create({ id_currency, value })
      .then((valor) => {
        resolve(valor);
      })
      .catch((err) => {
        reject(err);
      });
  });
};

const getAll = (entrada) => {
  if (entrada === "btc") curId = 1;
  if (entrada === "eth") curId = 2;
  if (entrada === "ada") curId = 3;
  return new Promise((resolve, reject) => {
    Valor.findAll({
      where: { id_currency: curId },
      include: [Moneda],
    })
      .then((rates) => {
        resolve(rates[rates.length - 1]);
      })
      .catch((err) => reject(err));
  });
};

const getAllRates = () => {
  return new Promise((resolve, reject) => {
    Valor.findAll({ include: [Moneda] })
      .then((rate) => {
        let currencyIds = {};
        for (let object of rate) {
          let currencyId = object.currency.id;
          if (!currencyIds.hasOwnProperty(currencyId))
            currencyIds[currencyId] = object.id;
          else {
            if (object.id > currencyIds[currencyId])
              currencyIds[currencyId] = object.id;
          }
        }
        let data = rate.filter((el) => {
          return Object.values(currencyIds).includes(el.id);
        });
        resolve(data.sort((a, b) => (a.id_currency < b.id_currency ? -1 : 1)));
      })
      .catch((err) => reject(err));
  });
};

module.exports = {
  createOne,
  getAll,
  getAllRates,
};
