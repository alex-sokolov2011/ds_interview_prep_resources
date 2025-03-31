#!/bin/bash

echo "- Начало инициализации базы данных interview_sql_postgres"

echo "-- Шаг 1: Загрузка схемы базы данных..."
PGPASSWORD=admin psql -U admin -d interview_sql_postgres -h localhost -f ./data/interview_schema_PostgreSQL.sql 2>/dev/null

echo "-- Шаг 2: Импорт данных в таблицы из файлов CSV..."
PGPASSWORD=admin psql -U admin -d interview_sql_postgres -h localhost -c "\copy topic FROM './data/topics.csv' DELIMITER ',' CSV HEADER;"
PGPASSWORD=admin psql -U admin -d interview_sql_postgres -h localhost -c "\copy question(topic_id, question_text, difficulty_level, link, created_at) FROM './data/questions.csv' DELIMITER ',' CSV HEADER;"
PGPASSWORD=admin psql -U admin -d interview_sql_postgres -h localhost -c "\copy answer(question_id, answer_text, is_correct) FROM './data/answers.csv' DELIMITER ',' CSV HEADER;"

echo "-- Шаг 3: Проверка правильности создания базы данных..."
PGPASSWORD=admin psql -U admin -d interview_sql_postgres -h localhost -c "\dt+"

echo "- База данных успешно инициализирована и готова к использованию в Jupyter Notebook."

echo "- Для подключения используйте:"
echo " %load_ext sql"
echo " %sql postgresql://admin:admin@localhost/interview_sql_postgres"