#!/usr/bin/env bash

source ../elk.sh

# All docker compose actions
function docker_compose {
    docker-compose -f ../docker-elk/docker-compose.yml -f docker-compose.override.yml $*;
}

function demo1 {
    docker network ls | grep dockerelk_dockerelk_elk > /dev/null;
    if [ "$?" != 0 ]; then
        docker network create dockerelk_docker_elk;
    fi
    docker_compose up -d
    sleep 1
    docker_compose logs -f
}

main $*;