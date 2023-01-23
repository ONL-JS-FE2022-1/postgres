/*

Реалізуйте чат між юзерами.
В кожного чату є певний власник (owner).
В кожного юзера може бути багато чатів. В одному чаті - багато юзерів.
В кожному чаті - багато повідомлень. Одне повідомлення - в одному чаті.

*/

DROP TABLE chats;
DROP TABLE chats_to_users;

CREATE TABLE chats(
    id serial PRIMARY KEY,
    name varchar(256) NOT NULL,
    owner_id int REFERENCES users(id),
    created_at timestamp DEFAULT current_timestamp
);

INSERT INTO chats(name, owner_id) VALUES
('superchat', 1);

CREATE TABLE chats_to_users(
    chat_id int REFERENCES chats(id),
    user_id int REFERENCES users(id),
    join_at timestamp DEFAULT current_timestamp,
    PRIMARY KEY(chat_id, user_id)
);

INSERT INTO chats_to_users (chat_id, user_id) VALUES
(1, 1),
(1, 3);

INSERT INTO chats_to_users (chat_id, user_id) VALUES
(1, 2);


CREATE TABLE messages(
    id serial PRIMARY KEY,
    body text NOT NULL CHECK(body != ''),
    created_at timestamp DEFAULT current_timestamp,
    is_read boolean NOT NULL,
    author_id int,
    chat_id int,
    FOREIGN KEY (chat_id, author_id) REFERENCES chats_to_users(chat_id, user_id)
);

INSERT INTO messages(body, is_read, chat_id, author_id) VALUES
('go for coffee?', false, 1, 3),
('go', false, 1, 1),
('i`m working', false, 1, 2);

INSERT INTO messages(body, is_read, chat_id, author_id) VALUES
('ok', true, 1, 3);