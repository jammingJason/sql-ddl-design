
DROP DATABASE IF EXISTS medical_center;
CREATE DATABASE medical_center;
\c medical_center

CREATE TABLE doctors(
    id SERIAL PRIMARY KEY,
    first_name TEXT NOT NULL,
    last_name TEXT NOT NULL
);
INSERT INTO doctors 
(first_name, last_name)
VALUES
('John', 'Smith'),
('Sally', 'Johnson'),
('Fred', 'Crews');

CREATE TABLE patients(
    id SERIAL PRIMARY KEY,
    first_name TEXT NOT NULL,
    last_name TEXT NOT NULL,
    phone TEXT,
    email TEXT
);
INSERT INTO patients
(first_name, last_name)
VALUES
('Tim', 'Crawford'),
('Sandy', 'Smith'),
('Marg', 'Turner'),
('Tua', 'Dongala');

CREATE TABLE diseases(
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    description TEXT
);
INSERT INTO diseases
(name, description)
VALUES
('Cold', 'Common cold'),
('Influenza', 'The flu'),
('Covid', 'Covid-19');

CREATE TABLE charts(
    patients_id INTEGER REFERENCES patients,
    doctors_id INTEGER REFERENCES doctors,
    diseases_id INTEGER REFERENCES diseases
);
INSERT INTO charts
(patients_id, doctors_id, diseases_id)
VALUES
(1,2,3),
(1,2,1),
(2,1,1),
(2,1,3),
(2,3,2),
(3,3,3),
(3,2,1);


DROP DATABASE IF EXISTS craigslist;
CREATE DATABASE craigslist;
\c craigslist

CREATE TABLE regions(
    id SERIAL PRIMARY KEY,
    city TEXT NOT NULL,
    state VARCHAR(2)
);

INSERT INTO regions
(city, state)
VALUES
('San Fransisco', 'CA'),
('Atlanta', 'GA'),
('New York', 'NY'),
('Chicago', 'IL');

CREATE TABLE users(
    id SERIAL PRIMARY KEY,
    user_name TEXT NOT NULL UNIQUE,
    first_name TEXT,
    last_name TEXT,
    password TEXT NOT NULL
);

INSERT INTO users
(user_name, first_name, last_name, password)
VALUES
('chickens', 'Bill', 'Simons', 'aoafisj'),
('zebra322', 'John', 'Smith', 'aksjdf9weww'),
('kitten9530', 'Sandy', 'Homer', 'oewiu39');


CREATE TABLE categories(
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL UNIQUE,
    description TEXT
);

INSERT INTO categories
(name, description)
VALUES
('Birds', 'Birds of North America'),
('Kittens', 'Baby cats'),
('Chickens', 'Delicious');

CREATE TABLE posts(
    id SERIAL PRIMARY KEY,
    users_id INTEGER REFERENCES users,
    regions_id INTEGER REFERENCES regions,
    name TEXT NOT NULL,
    post TEXT NOT NULL,
    location TEXT
);

INSERT INTO posts
(users_id, regions_id, name, post)
VALUES
(1,1,'Chickens are great', 'Chickens are great to eat.'),
(2,2,'Kittens are great', 'Kittens are great to pet.'),
(2,2,'Kittens', 'Look at these adorable kitten pix.'),
(3,3,'Birds are great', 'Birds can fly.');

CREATE TABLE posts_categories(
    categories_id INTEGER REFERENCES categories,
    posts_id INTEGER REFERENCES posts
);

INSERT INTO posts_categories
(posts_id, categories_id)
VALUES
(1,3),
(2,2),
(3,2),
(4,1);


DROP DATABASE IF EXISTS soccer_league;
CREATE DATABASE soccer_league;
\c soccer_league

CREATE TABLE teams(
    id SERIAL PRIMARY KEY,
    team_name TEXT NOT NULL UNIQUE,
    city TEXT NOT NULL,
    country TEXT NOT NULL
);

INSERT INTO teams
(team_name, city, country)
VALUES
('Paris Saint-Germain F.C.', 'Paris', 'France'),
('Crystal Palace F.C.', 'London', 'England'),
('New York City FC', 'New York', 'USA');

CREATE TABLE referees(
    id SERIAL PRIMARY KEY,
    first_name TEXT NOT NULL,
    last_name TEXT NOT NULL
);

INSERT INTO referees
(first_name, last_name)
VALUES
('Sam', 'Smith'),
('Bill', 'Withers'),
('Stevie', 'Wonder'),
('Paul', 'Lennon');

CREATE TABLE matches(
    id SERIAL PRIMARY KEY,
    home_team_id INTEGER REFERENCES teams,
    away_team_id INTEGER REFERENCES teams,
    ref_id INTEGER REFERENCES referees,
    winner_id INTEGER REFERENCES teams,
    match_date DATE NOT NULL
);


INSERT INTO matches
(home_team_id, away_team_id, ref_id, winner_id, match_date)
VALUES
(1,2,1,2,'01-01-2022'),
(2,3,3,3, '01-06-2022'),
(3,1,4,1, '01-12-2022');

CREATE TABLE players(
    id SERIAL PRIMARY KEY,
    teams_id INTEGER REFERENCES teams,
    first_name TEXT NOT NULL,
    last_name TEXT NOT NULL,
    age INTEGER,
    nickname TEXT
);

INSERT INTO players
(teams_id, first_name, last_name, age, nickname)
VALUES
(1,'Samuel', 'Kosniac', 21, 'Gofer'),
(2, 'Jack', 'Warner', 25, 'JW'),
(3, 'Bill', 'Smith', 23, 'Meter'),
(1, 'Jimque', 'Polesky', 22, 'Poland'),
(2, 'Grady', 'Dickson', 28, 'Pole Sitter'),
(3, 'Jeff', 'Rice', 24, 'Ricer');

CREATE TABLE goals(
    id SERIAL PRIMARY KEY,
    match_id INTEGER REFERENCES matches,
    player_id INTEGER REFERENCES players,
    game_time TIME NOT NULL
);

INSERT INTO goals
(match_id, player_id, game_time)
VALUES
(1,1, '00:03:24'),
(1,2,'00:14:33'),
(2,3, '00:20:12');

SELECT * FROM goals;