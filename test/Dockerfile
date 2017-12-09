FROM tomcat:8.0-jre8

ENV KJWIKIGDOCKER_VERSION test-build-target
ENV KJWIKIGDOCKER_VERSION test-build339
ENV KJWIKIGDOCKER_IMAGE kjwikigdocker

COPY ./kjwikigdocker.war /usr/local/tomcat/webapps/kjwikigdocker.war

RUN apt-get update
RUN apt-get -y upgrade

RUN apt-get install -y locales
RUN locale-gen ja_JP.UTF-8
RUN localedef -f UTF-8 -i ja_JP ja_JP

ENV LANG ja_JP.UTF-8
ENV LANGUAGE ja_JP:jp
ENV LC_ALL ja_JP.UTF-8

RUN mkdir -p /var/lib/kjwikigdocker

# top, ps
# RUN apt-get install -y procps

# remove tomcat default contents
RUN rm -rf /usr/local/tomcat/webapps/docs /usr/local/tomcat/webapps/examples /usr/local/tomcat/webapps/host-manager /usr/local/tomcat/webapps/manager
RUN rm -rf  /usr/local/tomcat/webapps/ROOT/*
COPY index.jsp /usr/local/tomcat/webapps/ROOT/

# for OpenShift. uid is random.
RUN chmod -R 0777 /var/ilb/kjwikigdocker /usr/local/tomcat 

EXPOSE 8080

VOLUME /var/lib/kjwikigdocker

CMD ["catalina.sh", "run"]
