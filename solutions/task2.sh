echo Step 1/4: extracting public download link...

curl https://cloud-api.yandex.net/v1/disk/public/resources/download\?public_key\=https://yadi.sk/d/ARJShvDUgazjMQ >> download_link.json
DOWNLOAD_LINK="$(cat download_link.json | grep -o 'http[s]*:[^"]*')"



echo \\n
echo Step 2/4: start downloading data.json ...
curl -L $DOWNLOAD_LINK > ./clickhouse_data/user_files/data.json


HEADER_USER="X-ClickHouse-User: default"
HEADER_PASS="X-ClickHouse-Key: 12345"

echo \\n
echo Step 3/4: creatig database "test_uchi_ru" ...
cat ./solutions/create_db.sql | curl -H "$HEADER_USER" -H "$HEADER_PASS" "http://localhost:8123/" -d @-

echo \\n
echo Step 4/4: create table "users" and inserting data from json...
cat ./solutions/create_and_update_table.sql | curl -H "$HEADER_USER" -H "$HEADER_PASS" "http://localhost:8123/" -d @-

rm ./clickhouse_data/user_files/data.json
rm download_link.json