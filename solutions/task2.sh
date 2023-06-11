echo “extracting public download link”
curl https://cloud-api.yandex.net/v1/disk/public/resources/download\?public_key\=https://yadi.sk/d/ARJShvDUgazjMQ >> download_link.json
URL="$(cat download_link.json | grep -o 'http[s]*:[^"]*')"

echo “start downloading data.json”
curl -L -o "$URL" data.json

echo "deleting json file with public link"
rm download_link.json

echo "create table and insert data into table"
echo '{"foo":"bar"}'  | clickhouse-client --query="CREATE TABLE users ENGINE=File(JSONEachRow, 'file.json')"