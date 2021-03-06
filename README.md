# Analysing performance test results with ELK5.x stack
## Introduction
This uses [deviantony/docker-elk](https://github.com/deviantony/docker-elk) 
repository as submodule and overrides some configs.
Choose a or b

### Prerequisite
Due to [this](https://www.elastic.co/guide/en/elasticsearch/reference/current/docker.html#docker-cli-run-prod-mode), 
we need to set the `vm_max_map_count` 
kernel setting needs to be set to at least 262144 
```
sudo sysctl -w vm.max_map_count=262144;
```

## A. Quick start for novices
``` 
./elk.sh up -d
```

## B. Know what you are doing

#### 1. Start elk stack 
To start elk stack, run the `docker-compose` with compose file 
under _docker-elk/_ and also from the root directory. 
```
docker-compose -f docker-elk/docker-compose.yml -f docker-compose.override.yml up -d
```

#### 2. Create elk-demo index in elasticsearch
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

#### 3. Now insert test values into elasticsearch 
```
curl -X POST localhost:9200/elk-demo/person -d@testdata/person1.json
curl -X POST localhost:9200/elk-demo/person -d@testdata/person2.json
```

#### 4. Configure index in kibana
 Open Kibana from your browser at 
 [http://localhost:5601/](http://localhost:5601/)
 
 **One time configuration**: In the _index name or pattern_ field, 
 provide `elk-demo` and press _create_. 
 Now choose the _Discover_ tab in the left top corner to see your events 
 
 ## C. Debugging
 
 #### Help
```./elk.sh -h``` - Help for this script

```./elk.sh help``` - docker-compose help

 
 #### Docker compose commands
```./elk.sh up -d``` - Create and start containers

```./elk.sh exec <service name> bash``` - Connect to bash shell into container

```./elk.sh ps``` - List container statuses

```./elk.sh down``` - Stop and remove containers
 

#### Elasticsearch index commands
```./elk.sh new 1 person.json``` - Create a new elastic search index _elk-demo1_ from file _person.json_

```./elk.sh ls``` - List all elasticsearch indices

```./elk.sh show 1``` - Show an elasticsearch index elk-demo1

```./elk.sh delete 1``` - Delete an elasticsearch index elk-demo1

#### Tools


 