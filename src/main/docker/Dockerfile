FROM registry.access.redhat.com/jboss-webserver-3/webserver31-tomcat8-openshift

USER root


RUN rm -Rf /opt/webserver/webapps/*; \
    rm -f /opt/webserver/lib/mongo.jar /opt/webserver/lib/mysql-connector-java.jar; \
    rm -Rf /opt/rh/rh-maven* /opt/rh/rh-mongodb*; \
    mkdir -p /opt/webserver/conf/Catalina/localhost; \
    chmod 770 /opt/webserver/conf/Catalina/localhost; \
    mkdir /artifact; \
    curl --fail -L -o /opt/webserver/lib/postgresql-jdbc.jar http://central.maven.org/maven2/org/postgresql/postgresql/42.1.4/postgresql-42.1.4.jar

COPY setenv.sh /opt/webserver/bin/
COPY ROOT.xml /usr/local/src/ROOT.xml
COPY maven/ROOT.war /artifact/ROOT.war

RUN chmod 770 /opt/webserver/bin/setenv.sh; \
    chmod -R 770 /artifact; \
    chmod -R 770 /opt/webserver/conf/Catalina/localhost

USER jboss
CMD /opt/webserver/bin/launch.sh

