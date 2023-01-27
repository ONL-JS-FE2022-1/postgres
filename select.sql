SELECT id, concat(first_name, ' ', last_name) AS "full name" FROM users;

/*

Знайдіть всіх користувачів, повне ім'я (ім'я + прізвище) яких > 5 символів

*/

--v1
SELECT id, concat(first_name, ' ', last_name) AS "full name"
FROM users
WHERE char_length(concat(first_name, ' ', last_name)) > 15;

--v2
SELECT *
FROM (
    SELECT id, concat(first_name, ' ', last_name) AS "full name"
    FROM users
) AS "FN"
WHERE char_length("FN"."full name") > 15;