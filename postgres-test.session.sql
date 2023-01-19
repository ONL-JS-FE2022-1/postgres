DROP TABLE users;

CREATE TABLE users(
    first_name varchar(64) NOT NULL CHECK(first_name != ''),
    last_name varchar(64) NOT NULL CONSTRAINT last_name_not_empty CHECK(last_name != ''),
    email text NOT NULL CHECK(email != '') UNIQUE,
    gender varchar(30),
    is_subscribe boolean NOT NULL,
    birthday date CHECK(birthday < current_date),
    foot_size smallint,
    height numeric(3, 2) CONSTRAINT too_high_user CHECK(height < 3.0)
);


INSERT INTO users VALUES
(NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);

INSERT INTO users VALUES
('Petr','Petrov','mail122','male',true,'1970-09-15',NULL,2.10),
('Sidr','Sidorov','mail2312','male',true,'1971-09-15',44,1.92),
('Ivanov','sfsfsdfsf','mail3','male2132132',true,'1970-09-15',NULL,2.10);


INSERT INTO users VALUES
('John','Doe','johndoe@gmail.com','male',false,'2023-01-21',48,1.85);


// CONSTRAINT