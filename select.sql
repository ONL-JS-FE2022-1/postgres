CREATE TABLE A
(
    v char(3),
    t int
);

CREATE TABLE B
(
    v char(3)
);

INSERT INTO A VALUES
('XXX', 1), --5
('XXY', 1), --10
('XXZ', 1), --15
('XYX', 2), --20
('XYY', 2), --25
('XYZ', 2), --30
('YXX', 3), --35
('YXY', 3), --40
('YXZ', 3); --45

INSERT INTO B VALUES
('ZXX'), ('XXX'), ('ZXZ'), ('YXZ'), ('YXY');

SELECT * FROM A, B;

---- UNION - об'єднання (все те, що в А + все те, що в В, а те, що є і там, і там - в 1 екземплярі)
---- INTERSECT (перетин) - все те, що є і в A, і в B, в єдиному екземплярі
---- Різниця
    ---- А мінус В - все з А мінус спільні елементи для А і В,
    ---- В мінус А - все з В мінус спільні елементи для А і В




SELECT v FROM A
UNION
SELECT * FROM B;

SELECT v FROM A
INTERSECT
SELECT * FROM B;

SELECT v FROM A
EXCEPT
SELECT * FROM B;

INSERT INTO users (
    first_name,
    last_name,
    email,
    gender,
    is_subscribe,
    birthday
  )
VALUES (
    'User1',
    'Test1',
    'mail@1',
    'male',
    true,
    '1954-09-15'
  ),
  (
    'User3',
    'Test3',
    'mail@3',
    'male',
    true,
    '1954-04-15'
  ),
  (
    'User2',
    'Test2',
    'mail@2',
    'male',
    true,
    '1954-07-15'
  )
  ;


  ---- id юзерів, які робили замовлення

  SELECT id FROM users
  INTERSECT
  SELECT customer_id FROM orders;


  -- id юзерів, які ніколи не робили замовлень
    SELECT id FROM users
    EXCEPT
    SELECT customer_id FROM orders;


-----------------

SELECT A.v AS "id",
        A.t AS "price",
        B.v AS "phone_id"
 FROM A, B
WHERE A.v = B.v;

SELECT *
FROM A JOIN B
ON A.v = B.v;


-------------------------------------
---Знайти всі замовлення юзера, у якого id = 5

SELECT u.*, o.id AS "order_id" 
FROM users AS u
JOIN orders AS o
ON o.customer_id = u.id
WHERE u.id = 5;



-----------------------------
SELECT *
FROM A 
JOIN B ON A.v = B.v
JOIN products ON A.t = products.id;

------Знайти id всіх замовлень, де були замовлені телефони Samsung
SELECT *
FROM products AS p
JOIN orders_to_products AS otp
ON p.id = otp.product_id
WHERE p.brand = 'Samsung';

-----Порахуйте, скільки замовлень бренду Samsung було всього
SELECT count(*)
FROM products AS p
JOIN orders_to_products AS otp
ON p.id = otp.product_id
WHERE p.brand = 'Samsung';


---топ продаж
SELECT p.brand, count(*) AS "quantity"
FROM products AS p
JOIN orders_to_products AS otp
ON p.id = otp.product_id
GROUP BY p.brand
ORDER BY "quantity" DESC;


----------------------------юзери і кількість їх замовлень

SELECT count(*), u.*
FROM users AS u
JOIN orders AS o
ON u.id = o.customer_id
GROUP BY u.id;

-------------LEFT JOIN

--v1
SELECT *
FROM orders AS o
RIGHT JOIN users AS u
ON u.id = o.customer_id
WHERE o.customer_id IS NULL;

--v2
SELECT *
FROM users
WHERE id IN (
    SELECT id FROM users
    EXCEPT
    SELECT customer_id FROM orders
);

INSERT INTO products (
    brand,
    model,
    category,
    price,
    quantity
  )
VALUES (
    'LG',
    '10',
    'phones',
    200,
    2
  );

  /*
Знайдіть всі телефони, які ніхто ніколи не купував
Підказка. Об'єднуйте таблицю orders_to_products і таблицю products
  */

  SELECT *
  FROM products AS p
  LEFT JOIN orders_to_products AS otp
  ON p.id = otp.product_id
  WHERE otp.product_id IS NULL;

  /*
  Домашня практика 31.01.2023

1. Знайти повну вартість кожного замовлення.
2. Знайти кількість позицій в кожному замовленні.
3. Знайти найпопулярніший товар.
4. Прорахувати середній чек по всьому магазину.
5. Витягти всі замовлення вище середнього чека.
6. Витягти всіх користувачів, в яких кількість замовлень вище середньої.
7. Витягти користуачів та кількість телефонів, які вони замовляли (кількість замовлень * quantity)
  */

  ----1
  SELECT otp.order_id, sum(p.price * otp.quantity)
  FROM orders_to_products AS otp
  JOIN products AS p
  ON otp.product_id = p.id
  GROUP BY otp.order_id;

  -----2
  SELECT order_id, count(*)
  FROM orders_to_products AS otp
  GROUP BY order_id;

  -----3
  SELECT p.id, p.brand, p.model, sum(otp.quantity)
  FROM products AS p
  JOIN orders_to_products AS otp
  ON p.id = otp.product_id
  GROUP BY p.id
  ORDER BY sum(otp.quantity) DESC
  LIMIT 1;

  ----4
  SELECT avg(owc.cost)
  FROM (
    SELECT otp.order_id, sum(p.price * otp.quantity) AS cost
    FROM orders_to_products AS otp
    JOIN products AS p
    ON otp.product_id = p.id
    GROUP BY otp.order_id
  ) AS owc;

  ----5
  SELECT owc.*
  FROM (
      SELECT otp.order_id, sum(p.price * otp.quantity) AS cost
      FROM orders_to_products AS otp
      JOIN products AS p
      ON otp.product_id = p.id
      GROUP BY otp.order_id
    ) AS owc
  WHERE owc.cost > (
    SELECT avg(owc.cost)
    FROM (
      SELECT otp.order_id, sum(p.price * otp.quantity) AS cost
      FROM orders_to_products AS otp
      JOIN products AS p
      ON otp.product_id = p.id
      GROUP BY otp.order_id
    ) AS owc
  );




  /*

  WITH ..alias.. AS table
  SELECT ......

  */


  WITH owc AS (
    SELECT otp.order_id, sum(p.price * otp.quantity) AS cost
    FROM orders_to_products AS otp
    JOIN products AS p
    ON otp.product_id = p.id
    GROUP BY otp.order_id
  )
  SELECT owc.*
  FROM owc
  WHERE owc.cost > (
    SELECT avg(owc.cost)
    FROM owc
  );


  --------6
  WITH orders_with_counts AS (
    SELECT customer_id, count(*) AS order_count
    FROM orders
    GROUP BY customer_id
  )
  SELECT orders_with_counts.order_count, users.* FROM orders_with_counts
  JOIN users ON users.id = orders_with_counts.customer_id
  WHERE orders_with_counts.order_count > (
    SELECT avg(orders_with_counts.order_count)
    FROM orders_with_counts
  );


  ----------7
  SELECT u.id, u.first_name, u.last_name, sum(otp.quantity)
  FROM users AS u
  JOIN orders AS o
  ON u.id = o.customer_id
  JOIN orders_to_products AS otp
  ON o.id = otp.order_id
  GROUP BY u.id;