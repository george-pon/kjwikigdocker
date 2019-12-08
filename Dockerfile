FROM georgesan/debiantomcat:debian10-openjdk11-tomcat9

ENV KJWIKIGDOCKER_VERSION build-target
ENV KJWIKIGDOCKER_VERSION latest
ENV KJWIKIGDOCKER_VERSION stable
ENV KJWIKIGDOCKER_VERSION build542
ENV KJWIKIGDOCKER_IMAGE kjwikigdocker

# install war file
COPY ./kjwikigdocker.war $CATALINA_BASE/webapps/kjwikigdocker.war

USER root

# for volume mount
RUN mkdir -p /var/lib/kjwikigdocker && chown -R tomcat:tomcat /var/lib/kjwikigdocker

# copy env file
COPY setenv.sh $CATALINA_HOME/bin/
RUN chmod +x $CATALINA_HOME/bin/setenv.sh

# remove tomcat default contents
RUN rm -rf $CATALINA_BASE/webapps/docs $CATALINA_BASE/webapps/examples $CATALINA_BASE/webapps/host-manager $CATALINA_BASE/webapps/manager
RUN rm -rf  $CATALINA_BASE/webapps/ROOT/*

USER tomcat

# install default index page
COPY index.jsp $CATALINA_BASE/webapps/ROOT/

EXPOSE 8080

VOLUME /var/lib/kjwikigdocker

