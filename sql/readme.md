# Задания по SQL для подготовки к интервью (PostgreSQL)

Добро пожаловать! Если вы готовитесь к техническому собеседованию на позицию Data Scientist или аналитика данных — этот раздел поможет вам быстро освежить SQL и попрактиковаться на реальных задачах.

Здесь собраны интерактивные ноутбуки, с которыми удобно работать локально: без лишнего софта, всё прямо в Jupyter.

---

## 🔍 Что входит в раздел `sql/`

### 📘 [PostgreSQL_Exercises.ipynb](https://nbviewer.org/github/alex-sokolov2011/ds_interview_prep_resources/blob/main/sql/PostgreSQL_Exercises.ipynb)  
SQL-упражнения по мотивам реальных интервью: от простых `SELECT` до оконных функций и оптимизации.  
Каждая задача снабжена решением, пояснениями и ссылками на документацию PostgreSQL.  
Запускается в Jupyter — не нужен pgAdmin или DBeaver.

### 🎯 [PostgreSQL_Interview_Trainer.ipynb](https://nbviewer.org/github/alex-sokolov2011/ds_interview_prep_resources/blob/main/sql/PostgreSQL_Interview_Trainer.ipynb)  
Интерактивный тренажёр с вопросами в формате multiple choice.  
Выбираете тему — отвечаете — получаете фидбек и статистику.  
Вот как это работает:

![Тренажёр в действии](./images/screen.gif)

### ⚙️ [Setup_postgresql_ubuntu.ipynb](https://nbviewer.org/github/alex-sokolov2011/ds_interview_prep_resources/blob/main/sql/Setup_postgresql_ubuntu.ipynb)  
Пошаговый гайд по установке PostgreSQL и настройке окружения для обоих ноутбуков.  
Подходит для Ubuntu и других Debian-based систем.  
В конце — автоматические скрипты для быстрой инициализации БД.

---

## 📌 Важно знать

- Все ноутбуки используют **PostgreSQL** — синтаксис может отличаться от MySQL.
- Для запуска ничего не нужно кроме Python, Jupyter и готового окружения из папки `pgsql_exercises_env` (по запросу).  

💡 Если хотите создать такое же окружение:
> ```
> python3 -m venv pgsql_exercises_env  
> source pgsql_exercises_env/bin/activate  
> pip install -r sql/requirements.txt
> ```

---

## 🛠 Установка PostgreSQL и инициализация баз данных

Перед началом работы обязательно пройдите [Setup_postgresql_ubuntu.ipynb](https://nbviewer.org/github/alex-sokolov2011/ds_interview_prep_resources/blob/main/sql/Setup_postgresql_ubuntu.ipynb).  
Там вы создадите нужные базы (`flight_booking`, `interview_sql_postgres`) и развернёте всё, что нужно для работы с задачами и тренажёром.

---

## 💬 Обратная связь

Если нашли ошибку или хотите предложить идею — welcome в Issues или Pull Requests 🙂

---

**Удачи в подготовке! Пусть PostgreSQL работает на вас 💪**


