#!/bin/bash
#
# docker entrypoint
#

set -ex

# modify war file name
if [ -n "$KJWikiG_WarFileName" ]; then
    ls -laF $CATALINA_BASE/webapps/
    if [ x"kjwikigdocker.war"x = x"$KJWikiG_WarFileName.war"x ]; then
        echo "KJWikiG_WarFileName value is default value.  skip rename."
    elif [ -f $CATALINA_BASE/webapps/$KJWikiG_WarFileName.war ]; then
    	echo "$KJWikiG_WarFileName.war found.  skip rename."
    else
        /bin/mv $CATALINA_BASE/webapps/kjwikigdocker.war  $CATALINA_BASE/webapps/$KJWikiG_WarFileName.war
        /bin/sed -i -e 's%String location = "/kjwikigdocker/";%String location = "/'"${KJWikiG_WarFileName}"'/";%g' $CATALINA_BASE/webapps/ROOT/index.jsp
    fi
fi

# exec /usr/libexec/tomcat9/tomcat-start.sh

exec $CATALINA_BASE/bin/catalina.sh run

#
# end of file
#
