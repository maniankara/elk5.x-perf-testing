#!/usr/bin/env bash

function usage() {
    echo "Handy script for docker-compose and elasticsearch index manipulations"
    echo "Usage: ";
    echo "      ./$(basename $0) <-h|new|delete|list|show|insert|help>";

}

function init {
    if [ -z $HOST ]; then
        host="localhost";
    else
        host=$HOST;
    fi
}

function docker_compose {
    docker-compose -f docker-elk/docker-compose.yml -f docker-compose.override.yml $*;
}

# Create an elasticsearch index
function new {
    shift;
    curl -X PUT $host:9200/elk-demo$1?pretty -d@$2;
}

# List an elasticsearch indices
function list {
    shift;
    curl -X GET $host:9200/_cat/indices?v;
}

# Show an elasticsearch index
function show {
    shift;
    curl -X GET $host:9200/elk-demo$1?pretty;
}

# Delete an elasticsearch index
function delete {
    shift;
    curl -X DELETE $host:9200/elk-demo$1?pretty ;
}

function main {
    init
    if [ "$1" = "new" -o "$1" = "delete" -o "$1" = "list" -o "$1" = "show" -o "$1" = "demo0" ]; then
        $1 $*;
    elif [ "$1" = "-h" -o "$1" = "--help" ]; then
        usage;
    else
        docker_compose $*;
    fi
}
