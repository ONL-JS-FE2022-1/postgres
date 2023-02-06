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