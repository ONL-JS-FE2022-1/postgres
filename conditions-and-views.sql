SELECT * FROM users
WHERE gender IS NULL;

ALTER TABLE orders
ADD COLUMN status boolean;

UPDATE orders
SET status = true
WHERE id % 2 = 0;

UPDATE orders
SET status = false
WHERE id % 2 = 1;

SELECT id, created_at, customer_id, status AS order_status
FROM orders
ORDER BY id; ---- alias for attribute


-----1 syntax
CASE
    WHEN condition1 = true
    THEN result1
    WHEN condition2 = true
    THEN result2
    ........
    ELSE 
    result3
END;

/*
Вивести всі замовлення, 
там де статус true написати "виконано",
там де статус false написати "нове"
*/

SELECT id, created_at, customer_id, (
    CASE
        WHEN status = TRUE
        THEN 'виконано'
        WHEN status = FALSE
        THEN 'нове замовлення'
        ELSE 'інший статус'
    END
) AS status
FROM orders
ORDER BY id;



----------2 syntax

CASE condition WHEN value1 THEN result1
                WHEN value2 THEN result2
                .........
                ELSE default_result
END;