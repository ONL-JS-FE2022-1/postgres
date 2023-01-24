CREATE TABLE contents(
    id serial PRIMARY KEY,
    name varchar(256) NOT NULL,
    description text,
    author_id int REFERENCES users(id),
    created_at timestamp DEFAULT current_timestamp
);

CREATE TABLE reactions (
    content_id int REFERENCES contents(id) ON DELETE CASCADE,
    user_id int REFERENCES users(id),
    is_liked boolean
);

INSERT INTO contents (name, author_id) VALUES
('funny dogs', 2);

INSERT INTO contents (name, author_id) VALUES
('1984', 1)
RETURNING id;

UPDATE contents SET name = 'funny cats' WHERE id = 2;
UPDATE contents SET author_id = 4 WHERE id = 2;

INSERT INTO reactions VALUES(
    1, 1, false
);

DROP TABLE reactions;

DELETE FROM contents WHERE id = 1;



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