const { Client } = require("pg");

const configs = {
  host: "localhost",
  port: 5432,
  user: "postgres",
  password: "postgres",
  database: "students",
};

const client = new Client(configs);

async function start() {
  await client.connect();

  const res = await client.query(
    `INSERT INTO users (first_name, last_name, email, is_subscribe) VALUES
    ('Iron', 'Man', 'tonystark@mail.com', true)`
  );

  console.log(res);

  await client.end();
}

start();
