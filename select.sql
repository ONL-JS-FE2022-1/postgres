SELECT id, first_name, last_name, birthday, extract("years" from age(birthday)) FROM users
WHERE id = 5;

SELECT id, first_name, last_name, birthday, make_interval(19, 8) FROM users
WHERE id = 5;