FROM maven:3.2-jdk-6

ADD settings.xml /root/.m2/

EXPOSE 8080

CMD mvn org.openmrs.maven.plugins:openmrs-sdk-maven-plugin:2.0:setup \
-B -e \
-DserverId=${BAMBOO_BUILDNUMBER} \
-Dversion=2.3 \
-DdbDriver=mysql \
-DdbUri=jdbc:mysql://${DATABASE_URL}/openmrs-${BAMBOO_BUILDNUMBER} \
-DdbUser=test \
-DdbPassword=test \
&& \
mvn \
org.openmrs.maven.plugins:openmrs-sdk-maven-plugin:2.0:run \
-B -e \
-DserverId=${BAMBOO_BUILDNUMBER}
