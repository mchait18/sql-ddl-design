-- from the terminal run:
-- psql < air_traffic.sql

DROP DATABASE IF EXISTS air_traffic;

CREATE DATABASE air_traffic;

\c air_traffic


CREATE TABLE passengers (
    id SERIAL PRIMARY KEY,
    first_name TEXT   NOT NULL,
    last_name TEXT   NOT NULL
);

CREATE TABLE cities (
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL  
);

CREATE TABLE countries (
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL  
);

CREATE TABLE airlines (
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL  
);

CREATE TABLE tickets (
    id SERIAL PRIMARY KEY,
    passenger_id INTEGER REFERENCES passengers ON DELETE CASCADE,
    seat TEXT NOT NULL,
    departure TIMESTAMP   NOT NULL,
    arrival TIMESTAMP   NOT NULL,
    from_country_id INTEGER REFERENCES countries ON DELETE CASCADE,
    to_country_id INTEGER REFERENCES countries ON DELETE CASCADE,
    from_city_id INTEGER REFERENCES cities ON DELETE CASCADE,
    to_city_id INTEGER REFERENCES cities ON DELETE CASCADE,
    airline_id INTEGER REFERENCES airlines ON DELETE CASCADE
);

INSERT INTO passengers
  (first_name, last_name)
VALUES
  ('Jennifer', 'Finch'),
  ('Thadeus', 'Gathercoal'),
  ('Sonja', 'Pauley'),
  ('Waneta', 'Skeleton'),
  ('Berkie', 'Wycliff'),
  ('Alvin', 'Leathes'),
  ('Cory', 'Squibbes');

INSERT INTO airlines 
  (name)
VALUES
  ('United'),
  ('British Airways'),
  ('Delta'),
  ('TUI Fly Belgium'),
  ('Air China'),
  ('American Airlines'),
  ('Avianca Brasil');


  INSERT INTO cities
  (name)
  VALUES
    ('Beijing'),
    ('Casablanca'),
    ('Cedar Rapids'), 
    ('Charlotte'), 
    ('Chicago'),
    ('Dubai'),
    ('Las Vegas'),
    ('London'),
    ('Los Angeles'), 
    ('Mexico City'),
    ('New Orleans'),
    ('New York'),
    ('Paris'),
    ('Santiago'),
    ('Sao Paolo'),
    ('Seattle'),
    ('Tokyo'), 
    ('Washington DC');

    INSERT INTO countries
      (name)
    VALUES
      ('United States'),
      ('United Kingdom'),
      ('Japan'), 
      ('France'),
      ('UAE'),
      ('Brazil'),
      ('Mexico'),
      ('Morocco'),
      ('China'),
      ('Chile');

INSERT INTO tickets
  (passenger_id, seat, departure, arrival, airline_id, from_city_id, from_country_id, to_city_id, to_country_id)
VALUES
  (1, '33B', '2018-04-08 09:00:00', '2018-04-08 12:00:00', 1, 18, 1, 16, 1),
  (2, '8A', '2018-12-19 12:45:00', '2018-12-19 16:15:00', 2, 17, 3, 8, 2),
  (3, '12F', '2018-01-02 07:00:00', '2018-01-02 08:03:00', 3, 9, 1, 7, 1),
  (1, '20A', '2018-04-15 16:50:00', '2018-04-15 21:00:00', 3, 16, 1, 10, 7),
  (4, '23D', '2018-08-01 18:30:00', '2018-08-01 21:50:00', 4, 13, 4, 2, 8),
  (2, '18C', '2018-10-31 01:15:00', '2018-10-31 12:55:00', 5, 6, 5, 1, 9),
  (5, '9E', '2019-02-06 06:00:00', '2019-02-06 07:47:00', 1, 12, 1, 4, 1),
  (6, '1A', '2018-12-22 14:42:00', '2018-12-22 15:56:00', 6, 3, 1, 5, 1),
  (5, '32B', '2019-02-06 16:28:00', '2019-02-06 19:18:00', 6, 4, 1, 11, 1),
  (7, '10D', '2019-01-20 19:30:00', '2019-01-20 22:45:00', 7, 15, 6, 14, 10);