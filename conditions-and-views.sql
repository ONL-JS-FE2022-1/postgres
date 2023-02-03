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


/*

Витягти місяць народження юзера і на його основі вивести, в яку пору року народився юзер

*/

SELECT *, (
    CASE extract('month' from birthday)
        WHEN 1 THEN 'winter'
        WHEN 2 THEN 'winter'
        WHEN 3 THEN 'spring'
        WHEN 4 THEN 'spring'
        WHEN 5 THEN 'spring'
        WHEN 6 THEN 'summer'
        WHEN 7 THEN 'summer'
        WHEN 8 THEN 'summer'
        WHEN 9 THEN 'fall'
        WHEN 10 THEN 'fall'
        WHEN 11 THEN 'fall'
        WHEN 12 THEN 'winter'
        ELSE 'unkown'
    END
)
FROM users;



-------Вивевсти юзерів, в яких в полі "стать" буде українською написано "жінка" або "чоловік", або "інше"

SELECT *, (
    CASE gender
        WHEN 'female' THEN 'жінка'
        WHEN 'male' THEN 'чоловік'
        ELSE 'інше'
    END
) AS "стать"
FROM users;


------Вивести на основі кількості років користувача, що він повнолітній чи неповнолітній
SELECT *, (
    CASE
        WHEN extract(year from age(birthday)) < 18
        THEN 'неповнолітній'
        WHEN extract(year from age(birthday)) >= 18
        THEN 'повнолітній'
        ELSE 'невідомо'
    END
)
FROM users;

/*

Вивести користувачів з інформацією про їхні замовлення у вигляді:
- якщо у користувача >= 3 - постійний клієнт
- якщо у користувача від 1 до 2 - активний клієнт
- якщо 0 замовлень - новий

*/

SELECT u.id, u.first_name, u.last_name, u.email, count(o.id), (
    CASE
        WHEN count(o.id) >= 3
        THEN 'Постійний клієнт'
        WHEN count(o.id) BETWEEN 1 AND 2
        THEN 'Активний клієнт'
        WHEN count(o.id) = 0
        THEN 'Новий клієнт'
        ELSE 'Клієнт'
    END
)
FROM users AS u
LEFT JOIN orders AS o
ON u.id = o.customer_id
GROUP BY u.id, u.first_name, u.last_name, u.email
ORDER BY count(o.id);



INSERT INTO users (
    first_name,
    last_name,
    email,
    gender,
    is_subscribe,
    birthday
  )
VALUES (
    'Iron',
    'Man',
    'dakdha@gmail.com',
    'male',
    true,
    '2004-08-09'
  );