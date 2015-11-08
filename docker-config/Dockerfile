FROM maven:3.2-jdk-6

COPY settings.xml /root/.m2/
COPY run-openmrs-sdk.sh .

EXPOSE 8080

CMD ./run-openmrs-sdk.sh
