SELECT *, extract('years'from age(birthday)) AS years 
FROM users
WHERE extract('years'from age(birthday)) BETWEEN 20 AND 40;

SELECT first_name AS "Ім'я", 
last_name AS "Прізвище", 
id AS "Особистий номер" 
FROM users;

SELECT * FROM orders_to_products AS "Чек";