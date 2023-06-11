echo Step 1/4: extracting public download link...

curl https://cloud-api.yandex.net/v1/disk/public/resources/download\?public_key\=https://yadi.sk/d/ARJShvDUgazjMQ >> download_link.json
download_link="$(cat download_link.json | grep -o 'http[s]*:[^"]*')"

echo \\n
echo Step 2/4: start downloading data.json ...
curl -L $download_link > ./clickhouse_data/user_files/data.json

echo \\n
echo Step 3/4: creatig database "test_uchi_ru" ...
echo "CREATE DATABASE if not exists test_uchi_ru" | curl -H 'X-ClickHouse-User: ${CLICKHOUSE_USER}' -H 'X-ClickHouse-Key: ${CLICKHOUSE_PASSWORD}' 'http://localhost:8123/' -d @-

echo \\n
echo Step 4/4: create table "users" and inserting data from json...
echo "CREATE TABLE test_uchi_ru.users ENGINE=File(JSONEachRow, 'data.json')" | curl -H 'X-ClickHouse-User: ${CLICKHOUSE_USER}' -H 'X-ClickHouse-Key: ${CLICKHOUSE_PASSWORD}' 'http://localhost:8123/' -d @-

rm ./clickhouse_data/user_files/data.json
rm data.json