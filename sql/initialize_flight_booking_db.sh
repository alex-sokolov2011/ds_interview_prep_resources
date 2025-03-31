#!/bin/bash

echo "- Начало инициализации базы данных flight_booking"

echo "-- Шаг 1: Загрузка схемы базы данных (режим уведомлений только об ошибках)..."
# Загрузка схемы базы данных
PGPASSWORD=admin psql -U admin -d flight_booking -h localhost -f ./data/flight_booking_schema_PostgreSQL.sql 2>/dev/null

echo "-- Шаг 2: Импорт данных в таблицы из файлов CSV..."
# Импорт данных в таблицы из файлов CSV
PGPASSWORD=admin psql -U admin -d flight_booking -h localhost -c "\copy Company FROM './data/company_table.csv' DELIMITER ',' CSV HEADER;"
PGPASSWORD=admin psql -U admin -d flight_booking -h localhost -c "\copy Trip FROM './data/trip_table.csv' DELIMITER ',' CSV HEADER;"
PGPASSWORD=admin psql -U admin -d flight_booking -h localhost -c "\copy Passenger FROM './data/passengers_table.csv' DELIMITER ',' CSV HEADER;"
PGPASSWORD=admin psql -U admin -d flight_booking -h localhost -c "\copy Pass_in_trip FROM './data/pass_in_trip_table.csv' DELIMITER ',' CSV HEADER;"

# Загрузка пустой строки в таблицу pass_in_trip
PGPASSWORD=admin psql -U admin -d flight_booking -h localhost -c "INSERT INTO pass_in_trip (id, trip, passenger, place) VALUES (36, 7772, 31, '');"

echo "-- Шаг 3: Проверка правильности создания базы данных..."
# Проверка правильности создания базы данных
PGPASSWORD=admin psql -U admin -d flight_booking -h localhost -c "\dt+"

# Сообщение об успешной инициализации базы данных
echo "- База данных успешно инициализирована и готова к использованию в ноутбуке."

