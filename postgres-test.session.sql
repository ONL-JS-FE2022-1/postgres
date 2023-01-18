DROP TABLE users;

CREATE TABLE users(
    first_name varchar(64) NOT NULL,
    last_name varchar(64) NOT NULL,
    email text NOT NULL,
    gender varchar(30),
    is_subscribe boolean NOT NULL,
    birthday date,
    foot_size smallint,
    height numeric(3, 2)
);


INSERT INTO users VALUES
(NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);

INSERT INTO users VALUES
('Petr','Petrov','mail','male',true,'1970-09-15',NULL,2.10),
('Sidr','Sidorov','mail','male',true,'1971-09-15',44,1.92),
('Ivanov','','mail','male',true,'1970-09-15',NULL,2.10);
