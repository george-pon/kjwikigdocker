# kjwikigdocker

A docker image for kjwikig , which is wiki system written by plain JSP/Servlet (Tomcat8).

Wiki data are saved as-is text files, into volume path /var/lib/kjwikigdocker/.

This docker image run as USER uid:998, gid:998.


### how to run

* docker run and visit http://localhost:8080/kjwikigdocker/
```
docker run -d -p 8080:8080 georgesan/kjwikigdocker:stable
```

* KJWikiG's wiki data stored in volume, so if you want to save wiki data, run below
* before docker run, you must set volume owner to uid:998 ( chown -R 998:998 /var/lib/kjwikigdocker )
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

* build605, stable, latest
    * fix: when post from pictbbs, automatic update to webchat message, correct condition whether self message or not.
    * add: when post or upload, automatic set user name from session data.
* build603
    * modify: css: modify h1-h6 css color, etc.
* build602
    * modify: css: modify h1-h6 css color, etc.
* build601
    * modify: css: modify h1-h6 css color, etc.
* build600
    * add: markdown, usemodwiki, hiki: {{upload}} plugin: when input h1-h6 marker into the fist line of textarea, suppress automatic insertion of h4 title marker.
* build599
    * modify: web chat: remove h1 title
* build598
    * update: jsoup 1.13.1
* build596
    * fix: search , latest: fix html tag close, open.
* build595
    * fix: word.jsp: add div close tag.
* build594
    * fix: plugin: remove encode searchlink, digestlink when static mode
* build593
    * fix: recent_tag: skip urlencode for static html mode.
* build592
    * fix: digestlink: urlencode without /
* build591
    * add: webchat: add sticky top view flag.
* build590
    * fix: todolist: form id modified.
* build589
    * fix: webchat: tuning parameter.
* build588
    * add: webchat: automatic remove message with scroll adjust.
* build587
    * prepair: webchat: automatic remove message.
* build586
    * remove: webchat: automatic remove message is disabled.
* build585
    * fix: display http header Reserved Word ( for Debug ) , hide session id.
* build584
    * fix: redirect hostport calculate
* build582
    * update: add display http header
* build581
    * update: webchat: use window.scrollBy(x,y) when delete message.
* build580
    * update: prepair for building on Docker image
    * update: webchat: add check dummy session ID from websocket message.
* build579
    * update: webchat: use dummy session id.
    * update: webchat and pictbbs: new pictbbs post sends to same webchat board , too.
* build578
    * update: build.gradle: copy css files into resources/css
    * update: generate html mode: copy css files into html folder. ( but can not see it. for test only. )
    * fix: text convert: defaultTextWidth is now -1 ( no auto wrap )
    * update: button css has round radix and padding 50px.
* build577
    * update: textarea row size set to 4 or 16.
* build576
    * update: textarea row size set to 4 or 12.
* build575
    * update: tag update date is get from update date comment in wiki block.
    * update: digest search sort order by update date.
* build574
    * add: editsub: add duplicate edit link.
* build573
    * fix: markdown format: todolist: crashes when include number list without checkbox.
* build570
    * modify: lastupdatelink plugin: modify message.
    * modify: latestlink plugin: sort key is changed to creation date string in title.
* build567
    * add: lastupdatelink plugin. read last update time from h1-h6 entry comment , and sort newer last updated entry.
* build565
    * update: insert update column when editsub.
* build564
    * update: add update column into upload form.
    * update: modify update column when editsub.
* build563
    * update: webchat shows short roud message.
    * fix: cookie tokenid has httpOnly
* build562
    * modify: web chat message format is changed to JSON.
* build561
    * prepair: web chat JSON type
    * compile for tomcat 9 , servlet-api 4.0
* build558
    * modify: use webpack output.js
* build557
    * prepair: typescript and webpack.
    * prepair: functionize createPage.js
* build556
    * fix: webchat: separate message send by channel name.
* build555
    * add access log to filter.
* build554
    * add: nichan, pictbbs, webchat formatter: add '(' and ')' to URL link string pattern.
* build553
    * improve: webchat: insert message only when top element is insight
* build552
    * update: vue.js 2.6.11
* build551
    * improve: access log checks X-FORWARDED-HOST IP address.
* build550
    * improve: webchat: when websocket is closed, get message via HTTP POST API. part 2.
* build549
    * modify: webchat: when websocket is closed, get message via HTTP POST API.
* build548
    * fix: url pattern includes '(' and ')'
    * modify: use ConcurrentHashMap insted of Collections.synchronizedMap
    * testing: webchat: when websocket is closed, get message via HTTP POST API.
* build547
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

