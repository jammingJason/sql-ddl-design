-- from the terminal run:
-- psql < air_traffic.sql

DROP DATABASE IF EXISTS air_traffic;

CREATE DATABASE air_traffic;

\c air_traffic

CREATE TABLE countries(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL
);

INSERT INTO countries
(name)
VALUES
('United States'),
('United Kingdom'),
('Mexico'),
('Morocco'),
('China'),
('Japan'),
('France'),
('UAE'),
('Brazil'),
('Chile');


CREATE TABLE cities(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL,
  country_id INTEGER REFERENCES countries
);

INSERT INTO cities
(name, country_id)
VALUES
('Washington DC', 1),
('Seattle', 1),
('Los Angeles', 1),
('Las Vegas', 1),
('Charlotte', 1),
('New Orleans', 1),
('Cedar Rapids', 1),
('Chicago', 1),
('Tokyo', 6),
('London', 2),
('Mexico City', 3),
('Paris', 7),
('Casablanca', 4),
('Dubai', 8),
('Beijing', 5),
('Sao Paolo', 9),
('Santiago', 10),
('New York', 1);

CREATE TABLE airlines(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL,
  main_city_hub_id INTEGER REFERENCES cities
);

INSERT INTO airlines
(name, main_city_hub_id)
VALUES
('United', 1),
('British Airways', 9),
('Delta', 3),
('TUI Fly Belgium', 12),
('Air China', 14),
('American Airlines', 7),
('Avianca Brasil', 16);

CREATE TABLE tickets
(
  id SERIAL PRIMARY KEY,
  first_name TEXT NOT NULL,
  last_name TEXT NOT NULL,
  seat TEXT NOT NULL,
  departure TIMESTAMP NOT NULL,
  arrival TIMESTAMP NOT NULL,
  airline_id INTEGER REFERENCES airlines,
  from_city_id INTEGER REFERENCES cities,
  to_city_id INTEGER REFERENCES cities
);

INSERT INTO tickets
  (first_name, last_name, seat, departure, arrival, airline_id, from_city_id, to_city_id)
VALUES
  ('Jennifer', 'Finch', '33B', '2018-04-08 09:00:00', '2018-04-08 12:00:00', 1, 1, 2),
  ('Thadeus', 'Gathercoal', '8A', '2018-12-19 12:45:00', '2018-12-19 16:15:00', 2, 9, 10),
  ('Sonja', 'Pauley', '12F', '2018-01-02 07:00:00', '2018-01-02 08:03:00', 3, 3, 4),
  ('Jennifer', 'Finch', '20A', '2018-04-15 16:50:00', '2018-04-15 21:00:00', 3, 2, 11),
  ('Waneta', 'Skeleton', '23D', '2018-08-01 18:30:00', '2018-08-01 21:50:00', 4, 12,13),
  ('Thadeus', 'Gathercoal', '18C', '2018-10-31 01:15:00', '2018-10-31 12:55:00', 5, 14, 15),
  ('Berkie', 'Wycliff', '9E', '2019-02-06 06:00:00', '2019-02-06 07:47:00', 1, 18, 5),
  ('Alvin', 'Leathes', '1A', '2018-12-22 14:42:00', '2018-12-22 15:56:00', 6, 7, 8),
  ('Berkie', 'Wycliff', '32B', '2019-02-06 16:28:00', '2019-02-06 19:18:00', 6, 5, 6),
  ('Cory', 'Squibbes', '10D', '2019-01-20 19:30:00', '2019-01-20 22:45:00', 7, 16, 17);