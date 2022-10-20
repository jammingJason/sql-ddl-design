-- from the terminal run:
-- psql < music.sql

DROP DATABASE IF EXISTS music;
CREATE DATABASE music;
\c music

CREATE TABLE artists(
  id SERIAL PRIMARY Key,
  name TEXT NOT NULL
);

INSERT INTO artists
(name)
VALUES
('Hanson'),
('Queen'),
('Mariah Cary'),
('Boyz II Men'),
('Lady Gaga'),
('Bradley Cooper'),
('Nickelback'),
('Jay Z'),
('Alicia Keys'),
('Katy Perry'),
('Juicy J'),
('Maroon 5'),
('Avril Lavigne'),
('Destiny''s Child'),
('Christina Aguilera');

CREATE TABLE producers(
  id SERIAL PRIMARY Key,
  name TEXT NOT NULL
);

INSERT INTO producers
(name)
VALUES
('Dust Brothers'),
('Stephen Lironi'),
('Roy Thomas Baker'),
('Walter Afanasieff'),
('Benjamin Rice'),
('Rick Parashar'),
('Al Shux'),
('Max Martin'),
('Cirkut'),
('Shellback'),
('Benny Blanco'),
('The Matrix'),
('Darkchild');

CREATE TABLE albums(
  id SERIAL PRIMARY Key,
  title TEXT NOT NULL
);

INSERT INTO albums
(title)
VALUES
('Middle of Nowhere'),
('A Night at the Opera'),
('Daydream'),
('A Star Is Born'),
('Silver Side Up'),
('The Blueprint 3'),
('Prism'),
('Hands All Over'),
('Let Go'),
('The Writing''s on the Wall');

CREATE TABLE albums_artists(
  albums_id INTEGER REFERENCES albums,
  artists_id INTEGER REFERENCES artists
);
INSERT INTO albums_artists
(albums_id, artists_id)
VALUES
(1,1),
(2,2),
(3,3),
(3,4),
(4,5),
(4,6),
(5,7),
(6,8),
(6,9),
(7,10),
(7,11),
(8,12),
(8,15),
(9,13),
(10,14);

CREATE TABLE albums_producers(
  albums_id INTEGER REFERENCES albums,
  producers_id INTEGER REFERENCES producers
);

INSERT INTO albums_producers
(albums_id, producers_id)
VALUES
(1,1),
(1,2),
(2,3),
(3,4),
(4,5),
(5,6),
(6,7),
(7,8),
(7,9),
(8,10),
(8,11),
(9,12),
(10,13);

CREATE TABLE songs
(
  id SERIAL PRIMARY KEY,
  title TEXT NOT NULL,
  duration_in_seconds INTEGER NOT NULL,
  release_date DATE NOT NULL
);

INSERT INTO songs
  (title, duration_in_seconds, release_date)
VALUES
  ('MMMBop', 238, '04-15-1997'),
  ('Bohemian Rhapsody', 355, '10-31-1975'),
  ('One Sweet Day', 282, '11-14-1995'),
  ('Shallow', 216, '09-27-2018'),
  ('How You Remind Me', 223, '08-21-2001'),
  ('New York State of Mind', 276, '10-20-2009'),
  ('Dark Horse', 215, '12-17-2013'),
  ('Moves Like Jagger', 201, '06-21-2011'),
  ('Complicated', 244, '05-14-2002'),
  ('Say My Name', 240, '11-07-1999');

CREATE TABLE songs_albums(
  songs_id INTEGER REFERENCES songs,
  albums_id INTEGER REFERENCES albums
);

INSERT INTO songs_albums
(songs_id, albums_id)
VALUES
(1,1),
(2,2),
(3,3),
(4,4),
(5,5),
(6,6),
(7,7),
(8,8),
(9,9),
(10,10);

