-----1NF
CREATE TABLE employees(
    id serial PRIMARY KEY,
    name varchar(200),
    department varchar(300),
    position varchar(300),
    car_aviability boolean
);

INSERT INTO employees (
    name,
    position,
    car_aviability
) VALUES
('John', 'HR', false),
('Jane', 'Sales', false),
('Jake', 'Full stack JS developer', false),
('Andrew', 'Top managment driver', true);

----2NF
CREATE TABLE positions (
    name varchar(300) PRIMARY KEY,
    department varchar(300),
    car_aviability boolean
);

INSERT INTO positions (name, car_aviability)
VALUES ('HR', false), ('Sales', false), ('Top managment driver', true);

DROP TABLE employees;

CREATE TABLE employees(
    id serial PRIMARY KEY,
    name varchar(200),
    position varchar(300) REFERENCES positions(name)
);

INSERT INTO employees (name, position) VALUES 
('John', 'HR'), ('Jane', 'Sales'), ('Andrew', 'Top managment driver');

SELECT * FROM employees
JOIN positions ON employees.position = positions.name;

INSERT INTO employees (name, position) VALUES 
('Oleg', 'Assistant'); -- BAD INSERT



-----3NF

DROP TABLE employees;
DROP TABLE positions;

CREATE TABLE employees(
    id serial PRIMARY KEY,
    name varchar(200),
    department varchar(300),
    department_phone varchar(15)
);

ALTER TABLE employees
DROP COLUMN department_phone;

ALTER TABLE employees
ADD FOREIGN KEY (department) REFERENCES departments(name);

INSERT INTO employees (name, department, department_phone) VALUES
('John Doe', 'HR', '24-12-16'),
('Jane Doe', 'Sales', '23-23-23'),
('Carl Moe', 'Clojure Developer', '20-19-21');

CREATE TABLE departments (
    name varchar(200) PRIMARY KEY,
    phone_number varchar(15)
);

INSERT INTO departments VALUES
('HR', '24-12-16'),
('Sales', '23-23-23'),
('Clojure Developer', '20-19-21');


-------BCNF

CREATE TABLE students(
    id serial PRIMARY KEY,
    name varchar(30)
);

CREATE TABLE teachers(
    id serial PRIMARY KEY,
    name varchar(30),
    subject varchar(300) REFERENCES subjects(name) -------<------
);

CREATE TABLE students_to_teachers (
    teacher_id int REFERENCES teachers(id),
    student_id int REFERENCES students(id),
    PRIMARY KEY (teacher_id, student_id)
);

INSERT INTO students_to_teachers VALUES
(1, 1, 'biology'),
(1, 2, 'biology'),
(2, 1, 'math'),
(2, 2, 'physics'); ------- problem!

CREATE TABLE subjects(
    name varchar(300) PRIMARY KEY
);

INSERT INTO students_to_teachers VALUES
(1, 1),
(1, 2),
(2, 1),
(2, 2);

----4NF

CREATE TABLE restaurants(
    id serial PRIMARY KEY
);

CREATE TABLE delivery_services(
    id serial PRIMARY KEY
);

CREATE TABLE restaurant_to_deliveries(
    restaurant_id int REFERENCES restaurants(id),
    delivery_id int REFERENCES delivery_services(id),
    PRIMARY KEY(restaurant_id, delivery_id)
);

INSERT INTO restaurants_to_deliveries VALUES
(1, 1, 'hawaii'),
(1, 1, '4chese'),
(1, 2, 'carbonara'),
(1, 3, 'pepperoni');

CREATE TABLE pizzas(
    name varchar(200) PRIMARY KEY
);

CREATE TABLE pizzas_to_restaurants(
    pizza_type varchar(200) REFERENCES pizzas(name),
    restaurant_id int REFERENCES restaurants(id),
    PRIMARY KEY (pizza_type, restaurant_id)
);