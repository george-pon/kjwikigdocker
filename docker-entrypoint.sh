#!/bin/bash
#
# docker entrypoint
#

set -ex

if [ -n "$KJWikiG_WarFileName" ]; then
    if [ x"kjwikigdocker.war"x = x"$KJWikiG_WarFileName.war"x ]; then
        echo "KJWikiG_WarFileName value is default value.  skip rename."
    else
        ls -laF $CATALINA_BASE/webapps/
        /bin/mv $CATALINA_BASE/webapps/kjwikigdocker.war  $CATALINA_BASE/webapps/$KJWikiG_WarFileName.war
        /bin/sed -i -e 's%response.sendRedirect("/kjwikigdocker/");%response.sendRedirect("/'$KJWikiG_WarFileName'/");%g' $CATALINA_BASE/webapps/ROOT/index.jsp
    fi
fi

exec /usr/libexec/tomcat9/tomcat-start.sh

#
# end of file
#
