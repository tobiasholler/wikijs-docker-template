#!/bin/bash

randpw(){ < /dev/urandom tr -dc _A-Z-a-z-0-9 | head -c${1:-32};echo;}

read -p "Container Name: " containername
password=$(randpw)

sed -i "s/__CONTAINER__/${containername}/g" docker-compose.yml
sed -i "s/__DB_PASSWORD_REPLACE_ME__/${password}/g" docker-compose.yml

rm setup.sh
rm README.md
rm -rf .git

echo "Created"