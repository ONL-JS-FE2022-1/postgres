DROP TABLE users;

CREATE TABLE users(
    first_name varchar(64),
    last_name varchar(64),
    email text,
    gender varchar(30),
    is_subscribe boolean,
    birthday date,
    foot_size smallint,
    height numeric(3, 2)
);


INSERT INTO users VALUES
('Petr','Petrov','mail','male',true,'1970-09-15',49,2.10),
('Sidr','Sidorov','mail','male',true,'1971-09-15',44,1.92),
('','','mail','male',true,'1970-09-15',49,2.10);
