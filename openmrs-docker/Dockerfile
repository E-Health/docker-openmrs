FROM tomcat:7-jre8

MAINTAINER cintia@openmrs.org

ENV VERSION_PLATFORM 2.0.1
ENV PLATFORM_URL http://sourceforge.net/projects/openmrs/files/releases/OpenMRS_Platform_${VERSION_PLATFORM}/openmrs.war/download

EXPOSE 8080

RUN apt-get update && apt-get install -y mysql-client

RUN rm -rf /usr/local/tomcat/webapps/*

# Download platform
RUN curl -L ${PLATFORM_URL} -o /usr/local/tomcat/webapps/openmrs.war

COPY demo-${VERSION_PLATFORM}.sql.zip /root
RUN cd /root && unzip demo-${VERSION_PLATFORM}.sql.zip && rm demo-${VERSION_PLATFORM}.sql.zip
COPY setup-openmrs.sh /root
RUN chmod a+x /root/setup-openmrs.sh

CMD ["/root/setup-openmrs.sh"]
