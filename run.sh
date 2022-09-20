#!/bin/bash
gitupdate='git pull'
$gitupdate
composerupdate='composer update'
$composerupdate





APP_USERNAME=${1}
PMA_PORT=${2}
APP_PORT=${3}
rm -rf docker-compose.yml
cat docker-compose.sample | sed -e 's/${APP_USERNAME}/'${APP_USERNAME}'/' | sed -e 's/${HOST_PORT}/'${APP_PORT}'/' | sed -e 's/${PMA_PORT}/'${PMA_PORT}'/' >> docker-compose.yml
create_network="docker network create network_"$APP_USERNAME
echo $create_network
$create_network
run="docker-compose up -d --build"
echo $run
$run


