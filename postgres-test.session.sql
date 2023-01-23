CREATE TABLE coaches(
    id serial PRIMARY KEY,
    name varchar(256) NOT NULL
);

CREATE TABLE teams(
    id serial PRIMARY KEY,
    name varchar(256),
    coach_id int REFERENCES coaches(id)
);

ALTER TABLE coaches
ADD COLUMN team_id int REFERENCES teams(id);