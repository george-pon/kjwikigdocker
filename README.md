# kjwikigdocker
A docker image for kjwikig , wiki system written by JSP/Servlet (Tomcat8).

Wiki data are saved as text files, into volume path /var/kjwikigdocker/.

Note: When you upload xxx.jpg file which size 10 MB, kjwikig uses /tmp, 
and require Java heap memory 600MB+.

### tags

* build332 , latest : new file.encoding is set to UTF-8.
* build331 : display charset=UTF-8.

