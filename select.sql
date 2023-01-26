
/*

1. Отримати всіх повнолітніх користувачів чоловічої статі.

2. Отримати всіх користувачів-жінок, ім'я яких починається на "А".

3. Отримати всіх користувачів, вік яких від 20 до 40 років.

4. Отримати всіх користувачів, які народились у вересні.

5. Всім користувачам, які народились 1 листопада, змінити підписку на true.

6. Видалити всіх користувачів, які старші за 65 років.

7. Всім користувачам чоловічого роду віком 40 до 50 років встановити вагу = 80.

*/

--1

SELECT first_name, last_name, gender, birthday, extract('years' from age(birthday)) FROM users
WHERE gender = 'male' AND extract('years' from age(birthday)) >= 18;


--2
SELECT * FROM users
WHERE gender = 'female' AND first_name LIKE 'A%';

--3
SELECT first_name, last_name, birthday, extract('years' from age(birthday)) FROM users
WHERE extract('years' from age(birthday)) BETWEEN 20 AND 40;

--4
SELECT * FROM users
WHERE extract('month' from birthday) = 9;

--5
UPDATE users
SET is_subscribe = true
WHERE extract('month' from birthday) = 11 AND extract('day' from birthday) = 1;

SELECT * FROM users
WHERE extract('month' from birthday) = 11 AND extract('day' from birthday) = 1;

--6
DELETE FROM users
WHERE extract('years' from age(birthday)) > 65;

SELECT first_name, last_name, gender, birthday, extract('years' from age(birthday)) FROM users
WHERE extract('years' from age(birthday)) > 65;

--7
UPDATE users
SET weight = 80
WHERE gender = 'male' AND extract('years' from age(birthday)) BETWEEN 40 AND 50;

SELECT first_name, gender, birthday, extract('years' from age(birthday)) FROM users
WHERE gender = 'male' AND extract('years' from age(birthday)) BETWEEN 40 AND 50;