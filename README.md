# kjwikigdocker

A docker image for kjwikig , wiki system written by JSP/Servlet (Tomcat8).

Wiki data are saved as-is text files, into volume path /var/lib/kjwikigdocker/.

Note: When you upload xxx.jpg file which size 10 MB, kjwikig uses /tmp,
and require Java heap memory 600MB+.


### how to run

* docker run and visit http://localhost:8080/kjwikigdocker/
```
docker run -d -p 8080:8080 georgesan/kjwikigdocker:stable
```

* KJWikiG's wiki data stored in volume, so if you want to save wiki data, run below
```
docker run -d -p 8080:8080 -v /var/lib/kjwikigdocker:/var/lib/kjwikigdocker georgesan/kjwikigdocker:stable
```

#### run kjwikigdocker via helm chart

```
# helm repo add for kjwikigdocker
helm repo add kjwikigdockerrepo  https://raw.githubusercontent.com/george-pon/kjwikigdocker/master/helm-chart/charts

# helm install for kjwikigdocker
helm install kjwikigdockerrepo/kjwikigdocker --name kjwikigdocker --set ingress.hosts="{kjwikigdocker.default.svc.k8s.local}"

# wait until deploy complete
kubectl rollout status deploy/kjwikigdocker
```


### tags

* build547, stable, latest
    * fix: webchat: set username when post via API.
* build546
    * modify: blog mode title includes hh:mm:ss. wiki mode uploadform writes information(random-id, date-time) to html comment.
* build545
    * add: log initial file loader time and file count.
* build543
    * fix: sendRedirectWrapper support X-FORWARDED-PROTO HTTP or HTTPS
    * change: container run with uid:998, gid:998. (debian tomcat:tomcat)
    * change: base image from debian:buster. (debian10, openjdk11, tomcat9)
    * change: platform linux/x86_64, linux/arm/v7 (raspberrypi4)
* build542
    * fix: wiki / pictbbs image upload.
* build541
    * fix: X-Forwarded-xxxx HTTP Header value to lower case.
* build540
    * fix: Bbs, PictBbs: see X-Forwarded-Proto HTTP Header for bookmarklet link protocol scheme.
* build539
    * fix: WebChat: when WebSocket is failed, messages get via axios API post. add username same to self check.
* build538
    * add: WebChat: when WebSocket is failed, messages get via axios API post.
* build537
    * fix: WebChat: image drug and drop upload is now available. broken in build353.
* build535 broken
    * add: WebChat: when closed WebSocket , post message via axios POST.
* build531
    * fix: pictbbs drug & drop file edit link is now available.

### enviroment variables

* KJWikiG_WarFileName : wiki war file name. default value is kjwikigdocker
* KJWikiG_dataStorePath : wiki data saved into. default value is /var/lib/kjwikigdocker
* KJWikiG_defaultWord : default wiki page name. default value is WelcomeVisitors
* KJWikiG_maxFileUploadSize : max file upload size in bytes. default value is 768000000
* KJWikiG_uploadFileTemporaryPath : temporary file path to recieve large upload file. default value is /tmp
* KJWikiG_authenticationMode : set AuthenticationModeMust or AuthenticationModeMay.  default value is AuthenticationModeMay (guest user can see wiki)
* KJWikiG_uploadEnableURLOfOtherSite : set uploadEnableURLOfOtherSite or uploadDisableURLOfOtherSite. default value is uploadDisableURLOfOtherSite
* KJWikiG_defaultImagePixel : set image size. default value is 960. for smart phone , set to 320 pixel.
* KJWikiG_defaultTextWidth : set text wrap width. when set -1, no wrap.

### parameter override order

The parameters are read from below order.
1. read from resource bundle 'kjwikig' in war file.  ( ex key:dataStorePath )
2. override when there is environment variable. ( ex key:KJWikiG_dataStorePath )
3. override when there is Java System Properties. ( ex key:KJWikiG_dataStorePath )

