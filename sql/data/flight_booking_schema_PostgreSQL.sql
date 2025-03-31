-- Удаляем таблицы, если они существуют, чтобы избежать конфликтов
DROP TABLE IF EXISTS passenger_backup;
DROP VIEW IF EXISTS cumulative_flight_time;
DROP TABLE IF EXISTS pass_in_trip;
DROP TABLE IF EXISTS trip;
DROP TABLE IF EXISTS passenger;
DROP TABLE IF EXISTS company;

-- Создаем таблицу company
CREATE TABLE company (
    id   INT PRIMARY KEY,
    name VARCHAR(255) NOT NULL
);

-- Создаем таблицу trip
CREATE TABLE trip (
    id        INT PRIMARY KEY,
    company   INT NOT NULL REFERENCES company(id),
    plane     VARCHAR(255) NOT NULL,
    town_from VARCHAR(255) NOT NULL,
    town_to   VARCHAR(255) NOT NULL,
    time_out  TIMESTAMP WITH TIME ZONE,
    time_in   TIMESTAMP WITH TIME ZONE
);

-- Создаем таблицу passenger
CREATE TABLE passenger (
    id   INT PRIMARY KEY,
    name VARCHAR(255) NOT NULL
);

-- Создаем таблицу pass_in_trip
CREATE TABLE pass_in_trip (
    id        INT PRIMARY KEY,
    trip      INT REFERENCES trip(id),
    passenger INT NOT NULL REFERENCES passenger(id),
    place     VARCHAR(255)
);
