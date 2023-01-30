--- ASC - за збільшенням
--- DESC - за зменшенням

SELECT * FROM users
ORDER BY birthday,
         first_name;

UPDATE users
SET birthday = '1940-05-12'
WHERE id BETWEEN 5 AND 10;


SELECT *
FROM products
ORDER BY quantity ASC
LIMIT 3;

/*

1. Відсортувати юзерів за віком (кількістю повних років)
2. Відсортуйте телефони за ціною, від найдорожчого до найдешевшого
3. Виведіть топ-5 телефонів, які частіше за все купують (більше за все продано)
4*. Знайти кількість однорічок (кількість юзерів з однаковою кількістю повних років)

*/


----1
--v1
SELECT *, extract('years' from age(birthday))
FROM users
ORDER BY extract('years' from age(birthday));

--v2
SELECT *
FROM (
    SELECT *, extract('years' from age(birthday)) AS age
    FROM users
) AS "u_w_age"
ORDER BY "u_w_age".age;


----2
SELECT *
FROM products
ORDER BY price DESC;

----3
SELECT product_id, sum(quantity)
FROM orders_to_products
GROUP BY product_id
ORDER BY sum(quantity) DESC
LIMIT 5;


----4
SELECT count(*), extract('years' from age(birthday)) AS age
FROM users
GROUP BY age
HAVING count(*) >= 6
ORDER BY age;

---HAVING


SELECT sum(quantity), brand
FROM products
GROUP BY brand
HAVING sum(quantity) > 10000;


SELECT product_id, sum(quantity)
FROM orders_to_products
GROUP BY product_id
HAVING sum(quantity) > 50;