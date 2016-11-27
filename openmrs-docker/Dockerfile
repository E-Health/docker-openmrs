FROM tomcat:7-jre8

MAINTAINER cintia@openmrs.org

ENV VERSION_PLATFORM 2.0.1
ENV PLATFORM_URL http://sourceforge.net/projects/openmrs/files/releases/OpenMRS_Platform_${VERSION_PLATFORM}/openmrs.war/download

ENV VERSION_REFAPP 2.5
ENV REFAPP_URL https://sourceforge.net/projects/openmrs/files/releases/OpenMRS_${VERSION_REFAPP}/openmrs-${VERSION_REFAPP}-modules.zip/download
#ENV REFAPP_URL https://sourceforge.net/projects/openmrs/files/releases/OpenMRS_${VERSION_REFAPP}/openmrs-standalone-${VERSION_REFAPP}.zip/download

ENV DEMO_URL https://wiki.openmrs.org/download/attachments/5047323/demo-${VERSION_PLATFORM}.sql.zip?api=v2



EXPOSE 8080

RUN apt-get update && apt-get install -y mysql-client

# Download platform
RUN curl -L ${PLATFORM_URL} -o /usr/local/tomcat/webapps/openmrs.war

# Download modules
RUN mkdir -p /root/.OpenMRS/modules && \
    curl -L ${REFAPP_URL} -o /tmp/openmrs-refapp-modules.zip && \
    cd /tmp && unzip openmrs-refapp-modules.zip && \
    mv *.omod /root/.OpenMRS/modules/

    #mv owa-1.6.3.omod webservices.rest-2.16.omod fhir-1.6.omod /root/.OpenMRS/modules/

# Download demo data
RUN curl -L ${DEMO_URL} -o /tmp/demo.zip && \
    cd /tmp && unzip demo.zip

COPY setup-openmrs.sh /root
RUN chmod a+x /root/setup-openmrs.sh

CMD ["/root/setup-openmrs.sh"]
