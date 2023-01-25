SELECT id, first_name FROM users;

SELECT first_name, last_name, gender FROM users WHERE gender = 'male';

/*
Зробіть запит, щоб отримати всіх користувачів, які підписані на наші новини.
*/

SELECT * FROM users WHERE is_subscribe;

SELECT * FROM users WHERE height IS NOT NULL;

/*
1. Вибрати всіх юзерів, в кого парний id

2. Вибрати всіх юзерів, в кого зріст більше 1.5

3. Вибрати всіх юзерів чоловічої статі, які підписані на наші новини

*/

--1

SELECT * FROM users WHERE id % 2 = 0;

--2

SELECT * FROM users WHERE height >= 1.5;

--3

SELECT * FROM users WHERE gender = 'male' AND is_subscribe;