DROP TABLE users;

CREATE TABLE users(
    first_name varchar(64),
    last_name varchar(64),
    email text,
    gender varchar(30),
    is_subscribe boolean,
    birthday date,
    foot_size smallint
    height numeric(3, 2)
);

/*

1.75

numeric(точность, масштаб)
точность - 3
масштаб - 2

*/
