const { User, Phone, Order, client } = require('./model');
const { getUsers } = require('./api/fetch');
const { generatePhones } = require('./utils');

async function start() {
  await client.connect();

  const userArray = await getUsers(); // запрос на АПІ (randomuser)
  const res = await User.bulkCreate(userArray); // вставка userArray в таблицю users
  const { rows: users } = await User.findAll(); // запрос к таблиці users на получення всіх користувачів з таблиці
  const phones = await Phone.bulkCreate(generatePhones(100)); // генеруєте 100 рандомних телефонів + додаєте їх у таблицю products
  const orders = await Order.bulkCreate(users, phones); // генерація замовлень для юзерів

  await client.end();
}

start();
