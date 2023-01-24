
/*

Створити нову базу даних: "university".
Перемкнутись на базу даних, створити нове підключення (і у VSCode, і у DBeaver)

Визначити таблиці:

1. Студенти
- id
- ім'я
- прізвище
- назва групи

2. Групи
- id
- посилання на факультет

3. Факультет
- id
- назва факультету

4. Дисципліна
- id
- назва
- викладач

Студенти здають екзамени з дисципліни

5. Екзамен - зв'язок між студентом і дисципліною
- студент
- дисципліна
- оцінка студента за екзамен


*/

CREATE TABLE departments(
    id serial PRIMARY KEY,
    name varchar(256) NOT NULL CHECK (name != '')
);

CREATE TABLE groups (
    id serial PRIMARY KEY,
    department_id int REFERENCES departments(id)
);

CREATE TABLE students (
    id serial PRIMARY KEY,
    first_name varchar(256) NOT NULL CHECK (first_name != ''),
    last_name varchar(256) NOT NULL CHECK (last_name != ''),
    group_id int REFERENCES groups(id),
    entry date NOT NULL DEFAULT current_date
);

ALTER TABLE students
ADD COLUMN entry date NOT NULL DEFAULT current_date;

CREATE TABLE subjects(
    id serial PRIMARY KEY,
    name varchar(256) NOT NULL CHECK (name != ''),
    teacher varchar(256) NOT NULL CHECK (teacher != '')
);

DROP TABLE exams;
CREATE TABLE exams(
    student_id int REFERENCES students(id),
    subject_id int REFERENCES subjects(id),
    grade int,
    is_passed boolean GENERATED ALWAYS AS (grade >= 64) STORED
);

INSERT INTO departments (name) VALUES
('KNT'),
('FREKS'),
('FIOT'),
('EF'),
('Griffindor');

INSERT INTO groups (department_id) VALUES
(1), (2), (2), (5), (5);

INSERT INTO students (first_name, last_name, group_id) VALUES
('Harry', 'Potter', 4),
('Ron', 'Weasley', 4),
('Draco', 'Malfoy', 1),
('Dobby', 'Elf', 2);

INSERT INTO subjects(name, teacher) VALUES
('flying', 'Md. Truck'),
('potions', 'Severus Snape'),
('math', 'Kluchnick');

INSERT INTO exams(student_id, subject_id, grade) VALUES
(1, 1, 90),
(2, 1, 50),
(3, 3, 20),
(4, 3, 100); 