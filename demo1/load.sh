#!/usr/bin/env bash

URL="curl localhost:8080";
ERR_URL="curl localhost:8080/err";

function main {
    echo "Begin loading";
    while true; do
        $URL &>/dev/null;
        sleep 1;
        $ERR_URL &>/dev/null;
        sleep 1;
    done
}

main $*;