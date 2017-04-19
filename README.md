# Analysing performance test results with ELK5.x stack
## Introduction
This uses [deviantony/docker-elk](https://github.com/deviantony/docker-elk) repository as submodule and overrides some logstash configs.

## 1. Start elk stack 
To start elk stack, run the `docker-compose` with compose file 
under _docker-elk/_ and also from the root directory. 
Due to [this](https://www.elastic.co/guide/en/elasticsearch/reference/current/docker.html#docker-cli-run-prod-mode), 
we need to set the `vm_max_map_count` 
kernel setting needs to be set to at least 262144 
```
sudo sysctl -w vm.max_map_count=262144;

docker-compose -f docker-elk/docker-compose.yml -f docker-compose.override.yml up -d
```

## 2. Create elk-demo index in elasticsearch
There should be an index to capture your data
```
curl -X PUT localhost:9200/elk-demo -d@person_index.json
```
Optional: To check if the index was created, query the index 
```
curl -X GET localhost:9200/elk-demo?pretty
```
Optional: To list all indices in elasticsearch
```
curl -X GET localhost:9200/_cat/indices?v
```

## 3. Now insert test values into elasticsearch 
```
curl -X POST localhost:9200/elk-demo/person -d@testdata/person1.json
curl -X POST localhost:9200/elk-demo/person -d@testdata/person2.json

```

## 4. Configure index in kibana
 Open Kibana from your browser at 
 [http://localhost:5601/](http://localhost:5601/)
 
 One time configuration: In the _index name or pattern_ field, 
 provide `elk-demo` and press _create_. 
 Now choose the _Discover_ tab in the left top corner to see your events 
 