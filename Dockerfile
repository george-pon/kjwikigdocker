FROM georgesan/debiantomcat:debian10-openjdk11-tomcat9

ENV KJWIKIGDOCKER_VERSION build-target
ENV KJWIKIGDOCKER_VERSION latest
ENV KJWIKIGDOCKER_VERSION stable
ENV KJWIKIGDOCKER_VERSION build551
ENV KJWIKIGDOCKER_IMAGE georgesan/kjwikigdocker

USER root

# copy env file
COPY setenv.sh $CATALINA_HOME/bin/
RUN chmod +x $CATALINA_HOME/bin/setenv.sh

# copy entry shell
COPY docker-entrypoint.sh /usr/local/bin/docker-entrypoint.sh
RUN chmod +x /usr/local/bin/docker-entrypoint.sh

# remove tomcat default contents
RUN rm -rf $CATALINA_BASE/webapps/docs $CATALINA_BASE/webapps/examples $CATALINA_BASE/webapps/host-manager $CATALINA_BASE/webapps/manager $CATALINA_BASE/webapps/ROOT/*

# for volume mount point
RUN mkdir -p /var/lib/kjwikigdocker && chown -R tomcat:tomcat /var/lib/kjwikigdocker

# install war file
COPY ./kjwikigdocker.war $CATALINA_BASE/webapps/kjwikigdocker.war

# install default index page
COPY index.jsp $CATALINA_BASE/webapps/ROOT/

# change owner
RUN chown -R tomcat:tomcat $CATALINA_BASE/webapps

USER tomcat

EXPOSE 8080

VOLUME /var/lib/kjwikigdocker

# CMD ["/usr/libexec/tomcat9/tomcat-start.sh"]

CMD ["/usr/local/bin/docker-entrypoint.sh"]

