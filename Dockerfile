FROM maven:3.2-jdk-6

ADD settings.xml /root/.m2/

CMD mvn org.openmrs.maven.plugins:openmrs-sdk-maven-plugin:2.0:setup \
-B -e \
-DserverId=${bamboo.buildNumber} \
-Dversion=2.3 \
-DdbDriver=mysql \
-DdbUri=jdbc:mysql://\${MARIADB_PORT_3306_TCP_ADDR}:3307/openmrs-${bamboo.buildNumber} \
-DdbUser=test \
-DdbPassword=test \
&& \
mvn \
org.openmrs.maven.plugins:openmrs-sdk-maven-plugin:2.0:run \
-B -e \
-DserverId=${bamboo.buildNumber}
