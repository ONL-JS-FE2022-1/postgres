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