SELECT * FROM users
WHERE first_name = 'Anton';

------

SELECT * FROM users
WHERE first_name IN ('William', 'Anton', 'John');

------

-- Знайти всх юзерів, у яких id між 460 і 500

SELECT * FROM users
WHERE id >= 460 AND id <= 500; --v1

SELECT * FROM users
WHERE id BETWEEN 460 AND 500; --v2

/*
Знайдіть всіх юзерів, id яких знаходиться в діапазоні від 50 до 100
*/

SELECT * FROM users
WHERE id >= 50 AND id <= 100; -- V1

SELECT * FROM users
WHERE id BETWEEN 50 AND 100; --V2

------

SELECT * FROM users
WHERE first_name LIKE 'K%';

SELECT * FROM users
WHERE first_name LIKE '_____';

SELECT * FROM users
WHERE first_name LIKE 'A__';

/*

    %  - будь-яка кількість будь-яких символів
    
    _  - 1 будь-який символ


*/

--Знайдіть всіх юзерів, у яких ім'я закінчуєть на букву "а".

SELECT * FROM users
WHERE first_name LIKE '%a';

------
ALTER TABLE users
ADD COLUMN weight int CHECK (weight != 0 AND weight > 0);

------
UPDATE users
SET weight = 56
WHERE id = 53;

SELECT * FROM users
WHERE gender = 'female';

------
/*
Є таблиця співробітників (employees)


В кожного співробітника є стовпець salary (з/п), work_hours (кількість відпрацьованих годин за місяць)


Всім співробітникам, які відпрацювали більше 150 годин, збільшити з/п на 20%
*/

CREATE TABLE employees(
    id serial PRIMARY KEY,
    name varchar(256) NOT NULL CHECK (name != ''),
    salary int NOT NULL CHECK (salary > 0),
    work_hours int NOT NULL CHECK (salary >= 0)
);

INSERT INTO employees (name, salary, work_hours) VALUES
('Ivanov', 300, 100),
('Petrov', 500, 80),
('Sidorov', 700, 230);

UPDATE employees
SET salary = salary * 1.2
WHERE work_hours > 150;

DROP TABLE employees;

------

INSERT INTO users
(first_name, last_name, email, gender, birthday, is_subscribe) VALUES
('Usertest', 'Test', 'test@mail.com', 'male', '2003-09-12', false) RETURNING id;

DELETE FROM users
WHERE id = 502
RETURNING *;

UPDATE users
SET weight = 56
WHERE id = 502
RETURNING *;


SELECT * FROM users
WHERE id = 502;