/* ENUM */

----- order status:
--- true - виконано
--- false - не виконано


--- processing -- procesg -- procesing

-----('new', 'processing', 'shiped', 'done')

DROP VIEW users_with_total_amounts;
DROP VIEW users_with_orders_amount;
DROP VIEW orders_with_price;

SELECT * FROM orders
WHERE status = true;

CREATE TYPE order_status AS ENUM('new', 'processing', 'shiped', 'done');

ALTER TABLE orders
ALTER COLUMN status TYPE order_status; --- problem!

ALTER TABLE orders
ALTER COLUMN status TYPE order_status
USING(
    CASE status
    WHEN false THEN 'processing'
    WHEN true THEN 'done'
    ELSE 'new'
    END
)::order_status;

INSERT INTO orders(customer_id, status) VALUES
(4, 'new');

SELECT * FROM orders
WHERE id = 14;

UPDATE orders
SET status = 'shiped'
WHERE id = 14;