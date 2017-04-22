#!/usr/bin/env bash

source ../elk.sh

# All docker compose actions
function docker {
    docker-compose -f ../docker-elk/docker-compose.yml -f docker-compose.override.yml $*;
}

main $*;