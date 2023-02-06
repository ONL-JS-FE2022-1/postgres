-----VIEWS----


SELECT u.*, count(o.id) AS "orders_amount"
FROM users AS u
LEFT JOIN orders AS o
ON u.id = o.customer_id
GROUP BY u.id, u.email
ORDER BY "orders_amount";


CREATE OR REPLACE VIEW users_with_orders_amount AS (
    SELECT u.*, count(o.id) AS "orders_amount"
    FROM users AS u
    LEFT JOIN orders AS o
    ON u.id = o.customer_id
    GROUP BY u.id, u.email
    ORDER BY "orders_amount"
);

DROP VIEW users_with_orders_amount;


SELECT * FROM users_with_orders_amount;




---------Витягти всі мейли юзерів, які мають замовлення
SELECT email FROM users_with_orders_amount
WHERE orders_amount = 1;





------Представлення, яке зберігає замовлення з їхньою вартістю

CREATE VIEW orders_with_price AS (
    SELECT o.id, o.customer_id, sum(p.price * otp.quantity) AS "order_sum", o.status
    FROM orders AS o
    JOIN orders_to_products AS otp
    ON o.id = otp.order_id
    JOIN products AS p
    ON p.id = otp.product_id
    GROUP BY o.id
);


SELECT * FROM orders_with_price;



--------Вивести юзерів з сумою коштів, які вони витратили в нашому магазині
SELECT u.id, u.email, sum(owp.order_sum) AS sum_amount
FROM users AS u
JOIN orders_with_price AS owp
ON u.id = owp.customer_id
GROUP BY u.id
ORDER BY sum_amount DESC
LIMIT 10;










CREATE VIEW users_with_total_amounts AS (
    SELECT u.*, sum(owp.order_sum) AS "total_amount"
    FROM users AS u
    JOIN orders_with_price AS owp
    ON u.id = owp.customer_id
    GROUP BY u.id
);

SELECT * FROM users_with_total_amounts
ORDER BY total_amount DESC
LIMIT 10;