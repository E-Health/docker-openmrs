#!/bin/bash -eux

# docker 1.12 and healthcheck might help here
echo "Going to sleep and hopefully get a database"
sleep 15

#echo "Starting import of demo data. "
#mysql --user=${DB_USERNAME} --password=${DB_PASSWORD} --host=${DB_HOST} ${DB_DATABASE} < /tmp/demo-*.sql
#echo "Done... "

#echo "Writing configuration file:"
#cat > /usr/local/tomcat/openmrs-runtime.properties << EOF
# Created from Docker setup script
#encryption.vector=OUbY/9CYYmUWwuC5m8ze6Q\=\=
#encryption.key=NfHYNWEqiNpxRWceT/mCMA\=\=
#module.allow_web_admin=true
#connection.url=jdbc\:mysql\://${DB_HOST}\:3306/${DB_DATABASE}?autoReconnect\=true
#connection.username=${DB_USERNAME}
#auto_update_database=true
#connection.password=${DB_PASSWORD}
#EOF
#cat /usr/local/tomcat/openmrs-runtime.properties

ls -lR /root/.OpenMRS/


echo "Running tomcat"
catalina.sh "run"
