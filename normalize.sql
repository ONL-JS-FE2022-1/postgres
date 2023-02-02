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