# test_uchiru

## Задание 1 - `solutions/task1.ipynb`

## Задание 2

1. Запуск clickhouse через docker-compose
 ```bash
 docker compose up
 ```

2. Запуск скрипт для обновления данных в clickhouse 
 ```bash
 sh solutions/task2.sh
 ```

### Комментарий к условию: удаление скаченного файла:
*Файл data.json локально (в среде запуска `task2.sh`) не дублируется, а находится в volume для персистентного хранения данных clickhouse, поэтому удалять локально нечего.*
