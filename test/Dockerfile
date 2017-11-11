FROM tomcat:8.0-jre8

ENV KJWIKIGDOCKER_VERSION testbuild327
ENV KJWIKIGDOCKER_VERSION testbuild327
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

RUN mkdir -p /var/kjwikigdocker

# for OpenShift not to run root.
RUN useradd tomcat8
RUN chown -R tomcat8 /var/kjwikigdocker /usr/local/tomcat
USER tomcat8

EXPOSE 8080

VOLUME /var/kjwikigdocker

CMD ["sh", "-c", "tail -f /dev/null"]

