#!/usr/bin/env bash

source ../elk.sh

function demo4 {
    shift;
    curl -X POST $host:9200/pollution/_search?pretty -d@aggs.json

}

function main {
    init
    if [ $1 = "demo4" -o $1 = "load" ]; then
        $1 $*;
    elif [ $1 = "-h" -o $1 = "--help" ]; then
        usage;
    else
        docker_compose $*;
    fi
}

export HOST=ec2-34-252-237-136.eu-west-1.compute.amazonaws.com
main $*;