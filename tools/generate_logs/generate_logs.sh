#!/usr/bin/env bash

function main {
    echo "Generating logs every 2 seconds";
    docker run -d --name apache_server -p 8080:80 httpd:2.4
    while true; do sleep 2; curl locahost:8080; done
}

main $*;
