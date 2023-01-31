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
FROM users AS u
LEFT JOIN orders AS o
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