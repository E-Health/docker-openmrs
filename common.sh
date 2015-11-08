#!/bin/bash

cleanup() {
  echo "Cleaning up running docker containers"
  DB_DOCKERS=$(docker ps -f "name=${DB_DOCKER_IMAGE}-" -q | xargs)
  if [ -n "$DB_DOCKERS" ]; then
    echo "Killing running docker containers: ${DB_DOCKERS}"
    docker kill $DB_DOCKERS
  fi

  OPENMRS_DOCKERS=$(docker ps -f "name=${OPENMRS_DOCKER_IMAGE}-" -q  | xargs)
  if [ -n "$OPENMRS_DOCKERS" ]; then
    echo "Killing running docker containers: ${OPENMRS_DOCKERS}"
    docker kill $OPENMRS_DOCKERS
  fi

  echo "Removing stopped containers"
  EXITED_CONTAINERS=$(docker ps -a --filter status=exit -q | xargs)
  if [ -n "$EXITED_CONTAINERS" ]; then
    docker rm $EXITED_CONTAINERS
  fi
  echo "Cleanup finished"
}
