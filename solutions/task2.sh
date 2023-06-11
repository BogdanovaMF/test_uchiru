echo Step 1/3: extracting public download link...

curl https://cloud-api.yandex.net/v1/disk/public/resources/download\?public_key\=https://yadi.sk/d/ARJShvDUgazjMQ >> download_link.json
download_link="$(cat download_link.json | grep -o 'http[s]*:[^"]*')"

echo \\n
echo Step 2/3: start downloading data.json ...
curl -L $download_link > ./clickhouse_data/user_files/data.json


# echo \nStep 3/3: create table and insert data into table ...
# clickhouse-client --query="CREATE TABLE users ENGINE=File(JSONEachRow, 'data.json')"
 
# echo "CREATE DATABASE test_uchi_ru" | curl -H 'X-ClickHouse-User: default' -H 'X-ClickHouse-Key: 12345' 'http://localhost:8123/' -d @-
# echo "CREATE TABLE test_uchi_ru.users ENGINE=File(JSONEachRow, '/opt/data.json')" | curl -H 'X-ClickHouse-User: default' -H 'X-ClickHouse-Key: 12345' 'http://localhost:8123/' -d @-

# rm download_link.json






# CREATE TABLES users as SELECT * FROM file('./clickhouse-data/data.jsonl')