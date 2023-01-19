DROP TABLE messages;

CREATE TABLE messages(
    id serial PRIMARY KEY,
    body text NOT NULL CHECK (body != ''),
    author varchar(256) NOT NULL CHECK (author != ''),
    created_at timestamp DEFAULT current_timestamp,
    is_read boolean DEFAULT false
);

INSERT INTO messages VALUES (
    'Hello world',
    'Me'
);

INSERT INTO messages (author, body) VALUES 
('Me', 'Hello again'),
('Me', 'And again'),
('Me', 'And again');

INSERT INTO messages VALUES (
    2, 'Text', 'Author'
);




CREATE TABLE example(
    x int,
    y int,
    PRIMARY KEY(x, y)
);


INSERT INTO example VALUES
(1,1),
(1,2),
(1,3),
(2,2),
(2,3);

INSERT INTO example VALUES
(1,2);