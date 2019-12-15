#!/bin/bash
#
# docker entrypoint
#

set -e

if [ -n "$KJWikiG_WarFileName" ]; then
    if [ x"kjwikigdocker.war"x = x"$KJWikiG_WarFileName.war"x ]; then
        echo "KJWikiG_WarFileName value is default value.  skip rename."
    else
        /bin/mv $CATALINA_BASE/webapps/kjwikigdocker.war  $CATALINA_BASE/webapps/$KJWikiG_WarFileName.war
        /bin/sed -i -e '%response.sendRedirect("/kjwikigdocker/");%response.sendRedirect("/'$KJWikiG_WarFileName'/");%' $CATALINA_BASE/webapps/ROOT/index.jsp
    fi
fi

exec /usr/libexec/tomcat9/tomcat-start.sh

#
# end of file
#
