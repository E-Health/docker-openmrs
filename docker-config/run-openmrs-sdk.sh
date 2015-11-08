#!/bin/bash -e

set -x

if [ -z "$DB_VARIABLE_PREFIX" ]; then
  >&2 echo "DB_VARIABLE_PREFIX cannot be empty."
  exit 1
fi

DATABASE_HOST=$(eval "echo \$${DB_VARIABLE_PREFIX}_PORT" | sed "s|tcp://||")

echo "DATABASE_URL=$DATABASE_URL"

mvn org.openmrs.maven.plugins:openmrs-sdk-maven-plugin:2.0:setup \
-B -e \
-DserverId=${BAMBOO_BUILDNUMBER} \
-Dversion=2.3 \
-DdbDriver=mysql \
-DdbUri=jdbc:mysql://${DATABASE_HOST}/openmrs-${BAMBOO_BUILDNUMBER} \
-DdbUser=test \
-DdbPassword=test


mvn \
org.openmrs.maven.plugins:openmrs-sdk-maven-plugin:2.0:run \
-B -e \
-DserverId=${BAMBOO_BUILDNUMBER}
