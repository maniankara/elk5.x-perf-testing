#!/usr/bin/env bash

source ../elk.sh

# Delete an elasticsearch index
function delete {
    shift;
    curl -X DELETE $host:9200/pollution?pretty ;
}

function new {
    shift;
    curl -X PUT $host:9200/pollution?pretty -d@../indices/pollution.json

}

function load {
    shift;
    ./import_to_es.rb ../testdata/pollution.json $host:9200/pollution
}

# Show an elasticsearch index
function show {
    shift;
    curl -X GET $host:9200/pollution?pretty;
}

function main {
    init
    if [ $1 = "new" -o $1 = "delete" -o $1 = "list" -o $1 = "show" -o $1 = "demo3" -o $1 = "load" ]; then
        $1 $*;
    elif [ $1 = "-h" -o $1 = "--help" ]; then
        usage;
    else
        docker $*;
    fi
}

main $*;