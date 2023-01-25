const _ = require("lodash");

module.exports.mapUsers = (userArray) => {
  return userArray
    .map(
      ({ name: { first, last }, gender, email, dob: { date } }) =>
        `('${first}', 
        '${last}', 
        '${email}', 
        ${Boolean(Math.random() > 0.5)}, 
        '${date}', 
        '${gender}')`
    )
    .join(",");
};

/*
`('(${user.firstName}', '${user.lastName}', '${user.email}', ${user.isSubscribe})`,
`('(${user.firstName}', '${user.lastName}', '${user.email}', ${user.isSubscribe})`,
`('(${user.firstName}', '${user.lastName}', '${user.email}', ${user.isSubscribe})`
*/

const PHONES_BRANDS = [
  "Samsung",
  "Huawei",
  "Nokia",
  "Sony",
  "Xiaomi",
  "iPhone",
];

const generateOnePhone = (key) => ({
  brand: PHONES_BRANDS[_.random(0, PHONES_BRANDS.length - 1, false)],
  model: `model ${key}`,
  quantity: _.random(10, 1500, false),
  price: _.random(150, 10000, false),
  category: "phones",
});

module.exports.generatePhones = (length) =>
  new Array(length).fill(null).map((el, i) => generateOnePhone(i));
