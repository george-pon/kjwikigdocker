# kjwikigdocker
A docker image for kjwikig , wiki system written by JSP/Servlet (Tomcat8).

Wiki data are saved as text files, into volume path /var/lib/kjwikigdocker/.

Note: When you upload xxx.jpg file which size 10 MB, kjwikig uses /tmp, 
and require Java heap memory 600MB+.

### tags

* build339 , latest : tag support. tag search support. when write tag:keyword,keyword2 in wiki text, create tag search link.
* build338 : big fix. write check: support unicode surrogate pair
* build337 : nearname, recent plugin supports wiki name prefix
* build335 : volume path modified : /var/lib/kjwikigdocker
* build332 : new file.encoding is set to UTF-8. volume path : /var/kjwikigdocker
* build331 : display charset=UTF-8.

