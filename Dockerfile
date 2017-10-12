FROM tomcat:8.0.47-jre8

ENV KJWIKIDOCKER_VERSION build322
ENV KJWIKIDOCKER_VERSION latest
ENV KJWIKIDOCKER_IMAGE kjwikidocker

COPY ./kjwikigdocker.war /usr/local/tomcat/webapps/kjwikigdocker.war

RUN /bin/mkdir -p /var/kjwiki

# set default locale to ja_JP.UTF-8
ENV LANG ja_JP.UTF-8
ENV LANGUAGE ja_JP:ja
ENV LC_ALL ja_JP.UTF-8

EXPOSE 8080
CMD ["catalina.sh", "run"]
