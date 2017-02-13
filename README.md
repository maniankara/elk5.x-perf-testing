# Analysing performance test results with ELK5.x stack
## Introduction
This uses [deviantony/docker-elk](https://github.com/deviantony/docker-elk) repository as submodule and overrides some logstash configs.

## How to run
To start, run the `docker-compose` with compose file 
under _docker-elk/_ and also from the root directory
```
docker-compose -f docker-elk/docker-compose.yml -f docker-compose.override.yml
```