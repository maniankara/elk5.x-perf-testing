#!/usr/bin/env bash

source ../elk.sh;

function docker_compose {
    docker-compose -f ../docker-elk/docker-compose.yml -f ../docker-compose.override.yml $*;
}

function demo0 {
    docker_compose up -d
    sleep 1
    docker_compose logs -f
}

main $*;