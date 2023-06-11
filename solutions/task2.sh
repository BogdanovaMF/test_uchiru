curl https://cloud-api.yandex.net/v1/disk/public/resources/download\?public_key\=https://yadi.sk/d/ARJShvDUgazjMQ >> download_link.json

VAR="$(cat download_link.json | grep -o 'http[s]*:[^"]*')"

curl -L "$VAR" >> file.json