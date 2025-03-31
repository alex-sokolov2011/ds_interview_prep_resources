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

Отличный и важный вопрос. Вот честный, взвешенный ответ — с учётом баланса между удобством и best practices.

---

## 📦 Размер окружения: 248 MB / 14k файлов — нормально ли это?

🔸 **Для GitHub — это многовато.**  
- GitHub не любит, когда пушат большие или бинарные папки (`env/`, `venv/`, `.ipynb_checkpoints/`).
- Это не нарушает правила, но замедляет клоны, делает репу «тяжёлой», не диффится и может вызвать проблемы при pull/merge.

---

## 🔒 Риск: может ли там быть что-то чувствительное?

**Да, потенциально.** В папке окружения (`pgsql_exercises_env/`) могут быть:

- `.bash_history`, если кто-то случайно добавил её
- `.python_history`
- `pip.conf` или другие user-level конфиги
- или даже кеши с токенами (маловероятно, но возможно)

---

## ✅ Принятая практика

### 🚫 Не коммитить окружение целиком

🧶 **Так не делают, даже если очень хочется "чтобы всё работало сразу".**  
Вместо этого — публикуют **одну из трёх альтернатив**:

---

## ✅ Три хороших варианта (с преимуществами и недостатками)

### 1. `requirements.txt` или `environment.yml` (стандарт)

**Как делать:**

```bash
pip freeze > requirements.txt
```
или если conda:
```bash
conda env export > environment.yml
```

**Плюсы:**
- Работает у всех
- Хранится в Git как текст
- Устанавливается одной командой

**Минусы:**
- Установка ≠ 100% идентичность (зависимости могут подтянуться другие)

---

### 2. [Pipenv](https://pipenv.pypa.io/en/latest/) или [Poetry](https://python-poetry.org/)

Это менеджеры, которые позволяют фиксировать окружение через `Pipfile.lock` или `poetry.lock`.  
Более надёжно, чем `requirements.txt`.

---

### 3. **Оставить окружение в `.zip` и добавить ссылку на него**

Если ты всё-таки хочешь раздавать всё готовое, можешь:

- создать `.zip` или `.tar.gz` с окружением
- выложить это в GitHub Releases
- в `README.md` добавить ссылку: "Скачать готовое окружение → распаковать → запускать"

**Так делают многие в образовательных курсах.**

---

## 💡 Что предлагаю тебе

**Оптимальный путь для тебя прямо сейчас:**

1. **Удалить `pgsql_exercises_env/` из коммита и добавить в `.gitignore`:**

```bash
echo "sql/pgsql_exercises_env/" >> .gitignore
git rm -r --cached sql/pgsql_exercises_env/
git commit -m "Удалено локальное окружение из Git и добавлено в .gitignore"
git push origin develop
```

2. **Сделать `requirements.txt` с freeze:**

```bash
source sql/pgsql_exercises_env/bin/activate
pip freeze > sql/requirements.txt
```

3. **(Опционально)** Добавить инструкцию в `README.md`:

> 💡 Если хотите создать такое же окружение:
> ```
> python3 -m venv pgsql_exercises_env  
> source pgsql_exercises_env/bin/activate  
> pip install -r sql/requirements.txt
> ```

---

Если хочешь, я могу помочь:
- прочитать содержимое `requirements.txt`
- проверить его на "лишние" библиотеки
- или собрать `environment.yml` для conda

Хочешь так сделать?
