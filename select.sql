/*


Створити таблицю workers:
- id
- name
- salary,
- birthday

1. Додайте робітника з ім'ям Олег, з/п 300
2. Додайте робітницю Ярославу, з/п 350
3. Додайте двох нових працівників одним запитом - 
    Сашу, з/п 1000
    Машу, з/п 200
4. Встановити Олегу з/п 500
5. Всім, у кого з/п більше 500, врізати з/п до 400
6. Вибрати всіх робітників, чия з/п більше 400
7. Вибрати робітника з id = 4
8. Дізнатися з/п та вік Жені
9. Знайти робітника з ім'ям "Petya"
10. Вибрати робітників у віці 27 років або з з/п > 800
11. Вибрати всіх робітників у віці від 25 до 28 років
12. Вибрати всіх співробітників, що народились у вересні
13. Видалити робітника з id = 4
14. Видалити Олега
15. Видалити всіх робітників старших за 30 років
*/


UPDATE users
SET weight = 42
WHERE id = 8;


SELECT gender, avg(weight) FROM users
GROUP BY gender;


------- Середня вага юзерів, що народилися після 1960 року

SELECT avg(weight)
FROM users
WHERE extract('years' from birthday) > 1960;


--- середня вага чоловіків, яким 27 років
SELECT avg(weight)
FROM users
WHERE extract('years' from age(birthday)) = 27 AND gender = 'male';

---- середній вік всіх користувачів
SELECT avg(extract('years' from age(birthday)))
FROM users;


----- мінімальний та максимальний вік користувачів
SELECT min(extract('years' from age(birthday))), max(extract('years' from age(birthday)))
FROM users;

SELECT gender, min(extract('years' from age(birthday))), max(extract('years' from age(birthday)))
FROM users
GROUP BY gender;


-- кількість користувачів жіночої статі
SELECT count(id)
FROM users
WHERE gender = 'male';

SELECT gender, count(id)
FROM users
GROUP BY gender;