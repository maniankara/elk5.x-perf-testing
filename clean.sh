#!/usr/bin/env bash

function main {
    docker rm -f $(docker ps -a -q) ;
    docker rmi -f $(docker images -a -q) ;
}

main $*;