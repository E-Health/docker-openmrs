#!/bin/bash -e

set -x

if [ -z "$DB_VARIABLE_PREFIX" ]; then
  >&2 echo "DB_VARIABLE_PREFIX cannot be empty."
  exit 1
fi

if [ -z "$BUILDNUMBER" ]; then
  >&2 echo "BUILDNUMBER cannot be empty."
  exit 1
fi


DATABASE_HOST=$(eval "echo \$${DB_VARIABLE_PREFIX}_PORT" | sed "s|tcp://||")

echo "DATABASE_HOST=$DATABASE_HOST"

mvn org.openmrs.maven.plugins:openmrs-sdk-maven-plugin:2.0.3:setup \
-B -e \
-DserverId=${BUILDNUMBER} \
-Dversion=2.3 \
-DdbDriver=mysql \
-DdbUri=jdbc:mysql://${DATABASE_HOST}/openmrs-${BUILDNUMBER} \
-DdbUser=root \
-DdbPassword=openmrs


sleep 50000

mvn \
org.openmrs.maven.plugins:openmrs-sdk-maven-plugin:2.0.3:run \
-B -e \
-DserverId=${BUILDNUMBER}
