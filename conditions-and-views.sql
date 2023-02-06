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









-----Знайти всі телефони, які купував юзер з id 23


SELECT * FROM products AS p
WHERE p.id = ANY
(SELECT product_id FROM orders_to_products AS otp
WHERE order_id = SOME
    (
        SELECT id FROM orders AS o
        WHERE customer_id = 23
    )
);



SELECT * FROM products AS p
JOIN orders_to_products AS otp
ON otp.product_id = p.id
JOIN orders AS o
ON otp.order_id = o.id
WHERE o.customer_id = 23;