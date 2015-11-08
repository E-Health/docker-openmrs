FROM maven:3.2-jdk-8

COPY settings.xml /root/.m2/
COPY run-openmrs-sdk.sh /bin/

EXPOSE 8080

CMD /bin/run-openmrs-sdk.sh
