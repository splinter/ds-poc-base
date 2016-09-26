#!/bin/bash

HEADER_CONTENT_TYPE="Content-Type: application/json"
HEADER_ACCEPT="Accept: application/json"
GRAFANA_USER=${GRAFANA_USER:-admin}
GRAFANA_PASSWD=${GRAFANA_PASSWD:-admin}
GRAFANA_PORT=${GRAFANA_PORT:-3000}
GF_SERVER_PROTOCOL=${GF_SERVER_PROTOCOL:-http}
local_ip=localhost
#$(ip route get 1 | awk '{print $NF;exit}')

mkdir /data
mkdir /data/plugins

echo "Downloading and installing custom panel"
wget https://github.com/splinter/grafana-mypanel/archive/master.zip
unzip master.zip
mv grafana-mypanel-master grafana-mypanel
cp grafana-mypanel /data/plugins -r
rm master.zip
echo "Finished installing custom panel"

echo "Downloading and installing custom app"
wget https://github.com/splinter/grafana-myapp/archive/master.zip
unzip master.zip
mv grafana-myapp-master grafana-myapp
cp grafana-myapp  /data/plugins -r
rm master.zip
echo "Finished installing custom app"

# Script adapted from https://github.com/kubernetes/heapster/blob/master/grafana/run.sh
set -m
echo "Starting the Garfana Server "
#exec /usr/sbin/grafana-server start & 
exec /usr/sbin/grafana-server --homepath=/usr/share/grafana --config=/etc/grafana/grafana.ini cfg:default.paths.data=/var/lib/grafana cfg:default.paths.logs=/var/log/grafana &
#service grafana-server start

echo "Waiting for Grafana to come up..."
until $(curl -k --fail --output /dev/null --silent ${GF_SERVER_PROTOCOL}://${GRAFANA_USER}:${GRAFANA_PASSWD}@localhost:${GRAFANA_PORT}/api/org); do
  printf "."
  sleep 2
done
echo "Grafana is up and running."


echo "Importing default dashboards"
for filename in /dashboards/*.json; do
  echo "Importing ${filename} ..."
  curl -k -i -XPOST --data "@${filename}" -H "${HEADER_ACCEPT}" -H "${HEADER_CONTENT_TYPE}" "${GF_SERVER_PROTOCOL}://${GRAFANA_USER}:${GRAFANA_PASSWD}@${local_ip}:${GRAFANA_PORT}/api/dashboards/db"
  echo ""
  echo "Done importing ${filename}"
done 

fg

