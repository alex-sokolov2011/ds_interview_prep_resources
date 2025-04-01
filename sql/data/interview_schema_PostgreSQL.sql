-- Удаляем таблицы, если они существуют, чтобы избежать конфликтов
DROP TABLE IF EXISTS user_statistics CASCADE;
DROP TABLE IF EXISTS answer CASCADE;
DROP TABLE IF EXISTS question CASCADE;
DROP TABLE IF EXISTS topic CASCADE;

-- Таблица тем вопросов
CREATE TABLE topic (
    topic_id SERIAL PRIMARY KEY,    -- Уникальный идентификатор темы
    name TEXT NOT NULL UNIQUE,      -- Название темы, например "Индексы и оптимизация"
    description TEXT                -- Описание темы (необязательно)
);

-- Таблица вопросов
CREATE TABLE question (
    question_id SERIAL PRIMARY KEY,     -- Уникальный идентификатор вопроса
    topic_id INT NOT NULL REFERENCES topic(topic_id) ON DELETE CASCADE,
    question_text TEXT NOT NULL UNIQUE, -- Текст вопроса
    difficulty_level INT CHECK (difficulty_level BETWEEN 1 AND 5) NOT NULL, -- Сложность вопроса (1-легкий, 5-очень сложный)
    link TEXT,                          -- Ссылка на официальную документацию
    created_at TIMESTAMP DEFAULT NOW()  -- Дата добавления вопроса

);

-- Таблица вариантов ответов
CREATE TABLE answer (
    answer_id SERIAL PRIMARY KEY,        -- Уникальный идентификатор ответа
    question_id INT NOT NULL REFERENCES question(question_id) ON DELETE CASCADE,
    answer_text TEXT NOT NULL,           -- Текст варианта ответа
    is_correct BOOLEAN NOT NULL DEFAULT FALSE -- Флаг правильного ответа
);

-- Таблица статистики ответов пользователей
CREATE TABLE user_statistics (
    user_id TEXT NOT NULL,               -- ID пользователя (может быть IP, session_id и т.п.)
    question_id INT NOT NULL REFERENCES question(question_id) ON DELETE CASCADE,
    attempts INT DEFAULT 0,              -- Количество попыток
    correct_attempts INT DEFAULT 0,      -- Количество правильных ответов
    incorrect_attempts INTEGER DEFAULT 0, -- Количество неправильных ответов
    last_attempt TIMESTAMP DEFAULT NOW(), -- Дата последней попытки
    PRIMARY KEY (user_id, question_id)   -- Уникальный ключ по пользователю и вопросу
);
