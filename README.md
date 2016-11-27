## Description
Run openmrs and mysql as disposable docker containers.

## Requirements
  - Docker engine
  - Docker compose
  - Docker tools (if running on windows or mac)

## Running it

To build docker images:
```
$ docker-compose build
```

To start all containers:
```
$ docker-compose up
```

Application will be accessible on http://localhost:8080/openmrs.
If you are running docker tools, change _localhost_ by the output of `docker-machine ip`.


Use _CTRL + C_ to stop it all containers. But make sure to destroy containers to delete any
left overs volumes and data when doing changes to the docker configuration and images:
```
$ docker-compose down
```

## Demo data
If you change _IMPORT_DB_DUMP_ in `docker-compose.yml` to false, database will remain empty,
and wizard will show up.
The current dump was take with `mysqldump` after running the wizard manually.


## Other similar docker images and relevant links
- <https://wiki.openmrs.org/display/RES/Demo+Data>
- <https://wiki.openmrs.org/display/docs/Installing+OpenMRS+on+Docker>
- <https://github.com/tusharsoni/OpenMRS-Docker/blob/master/Dockerfile>
- <https://github.com/chaityabshah/openmrs-core-docker/blob/master/Dockerfile>
- <https://github.com/bmamlin/openmrs-core-docker/blob/master/Dockerfile>
