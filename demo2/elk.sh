#!/usr/bin/env bash

source ../elk.sh

# All docker compose actions
function docker {
    docker-compose -f ../docker-elk/docker-compose.yml -f ../demo1/docker-compose.override.yml $*;
}

function demo2 {
    # create a new index
    ./elk.sh new 2;
    # pump lots of data
    #

}
function main {
    if [ $1 = "new" -o $1 = "delete" -o $1 = "list" -o $1 = "show" -o $1 = "demo2" ]; then
        $1 $*;
    elif [ $1 = "-h" -o $1 = "--help" ]; then
        usage;
    else
        docker $*;
    fi
}

main $*;