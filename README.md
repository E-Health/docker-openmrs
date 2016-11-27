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


Use _CTRL + C_ to stop it all containers.


## Other similar docker images and relevant links
- <https://wiki.openmrs.org/display/RES/Demo+Data>
- <https://wiki.openmrs.org/display/docs/Installing+OpenMRS+on+Docker>
- <https://github.com/tusharsoni/OpenMRS-Docker/blob/master/Dockerfile>
- <https://github.com/chaityabshah/openmrs-core-docker/blob/master/Dockerfile>
- <https://github.com/bmamlin/openmrs-core-docker/blob/master/Dockerfile>
