--------Підзапити----

----IN, NOT IN, SOME, ANY, EXISTS, ALL


SELECT * FROM users AS u
WHERE u.id NOT IN (
    SELECT customer_id FROM orders
);


---Знайти телефони, які ніхто не замовляв

SELECT * FROM products AS p
WHERE p.id NOT IN (
    SELECT product_id FROM orders_to_products
);

------EXISTS


SELECT EXISTS 
(SELECT * FROM users
WHERE id = 23564);


SELECT *
FROM users AS u
WHERE EXISTS
(SELECT * FROM orders AS o
WHERE u.id = o.customer_id
);



SELECT EXISTS
(SELECT * FROM orders AS o
WHERE o.customer_id = 546);


------SOME/ANY


SELECT * FROM users AS u
WHERE u.id = ANY 
(SELECT customer_id FROM orders);

SELECT * FROM users AS u
WHERE u.id = SOME 
(SELECT customer_id FROM orders);

SELECT * FROM users AS u
WHERE u.id IN (
    SELECT customer_id FROM orders
);


------ALL

SELECT * FROM products AS p
WHERE p.id != ALL
(SELECT product_id FROM orders_to_products);