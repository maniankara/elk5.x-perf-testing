#!/usr/bin/env bash

function main {
    docker-compose -f docker-elk/docker-compose.yml -f docker-compose.override.yml $*;
}

main $*;