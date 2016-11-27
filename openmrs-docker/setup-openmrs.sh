#!/bin/bash -eux

# docker 1.12 and healthcheck might help here
echo "Going to sleep. Hopefully we'll get a running database when waking up. "
sleep 15

if [ "${IMPORT_DB_DUMP}" == "true" ]; then
  echo "Starting import of demo data. "
  mysql --user=${DB_USERNAME} --password=${DB_PASSWORD} --host=${DB_HOST} ${DB_DATABASE} < /root/demo-refapp*.sql
  echo "Done... "

  echo "Writing configuration file:"

  cat > /root/.OpenMRS/openmrs-runtime.properties << EOF
# Created from Docker setup script
#encryption.vector=X87Os8fUcYjR4jlQK09MXQ\=\=
#encryption.key=oTNOfU2FLvN/7+7OjSggEg\=\=
connection.url=jdbc\:mysql\://${DB_HOST}\:3306/${DB_DATABASE}?autoReconnect\=true&sessionVariables\=default_storage_engine\=InnoDB&useUnicode\=true&characterEncoding\=UTF-8
module.allow_web_admin=true
connection.username=${DB_USERNAME}
auto_update_database=true
connection.password=${DB_PASSWORD}
EOF

  cat /root/.OpenMRS/openmrs-runtime.properties

fi

echo "Running tomcat"
catalina.sh "run"
