/*

Створіть дві ніяк не пов'язані між собою таблиці:

users: login, email, password
employees: salary, department, position, hire_date, name

 */

 CREATE TABLE newtask.users(
    login varchar(200) NOT NULL CHECK (login != ''),
    email varchar(300) NOT NULL CHECK (email != ''),
    password varchar(200) NOT NULL CHECK (password != '')
 );

 CREATE TABLE newtask.employees(
    name varchar(200) NOT NULL CHECK(name != ''),
    salary int NOT NULL CHECK (salary >= 0),
    department varchar(200) NOT NULL CHECK(department != ''),
    position varchar(200) NOT NULL CHECK(position != ''),
    hire_date date DEFAULT current_date
 );



/*

Проблеми:
1. Відсутність ключа у юзерів. Ключем можете зробити імейл
2. Надлишкові дані про співробітників, потребують нормалізації - декомпозиції таблиці на дві:
співробітники та відділи
3. Зберігання паролю в сирому вигляді. Паролі мають зберігатись у захешованому вигляді
(drop password + create password_hash )

*/

----Всі зміни в таблицях проводити виключно ALTER'ом



ALTER TABLE newtask.users
ADD PRIMARY KEY(email);

ALTER TABLE newtask.employees
ADD COLUMN id serial PRIMARY KEY;

CREATE TABLE newtask.positions(
   id serial PRIMARY KEY,
   department varchar(200) NOT NULL CHECK(department != ''),
   position varchar(200) NOT NULL CHECK(position != '')
);


ALTER TABLE newtask.employees
DROP COLUMN department;

ALTER TABLE newtask.employees
DROP COLUMN position;

ALTER TABLE newtask.employees
ADD COLUMN position_id int REFERENCES newtask.positions(id);


-----



/*

1. Зв'язати таблиці юзерів та співробітників за принципом:
Юзер може бути співробітником, а може не бути ним.
Співробітник має бути юзером.

2. Створіть view, яке містить інформацію про юзерів, їхні дані співробітника: 
департамент та позицію, де вони працюють і скільки вони заробляють.
При цьому, якщо в колонці з зарплатнею буде 0, має вивестись "Практикант".


*/