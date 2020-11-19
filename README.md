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


* build633, monthly202011, stable, latest
    * webchat: add GPS button option setting.
* build632
    * signup: add validation check include space character.
    * webchat: add GPS button. insert GPS location into TEXTAREA when https.
* build631
    * add sign up page (/signup) , add isAllowAutomaticSignUp flag.
* build630
    * from image: georgesan/debiantomcat:debian10-adoptopenjdk15-tomcat9
* build629
    * webchat: image link set to target _blank.
* build628
    * persister: at startup, read file list exclude .atr file.
* build627, monthly202010
    * persister: at startup, read file list at once for spped up.
    * webchat: remove duplicate title line.
    * webchat: stop interval executor when shutdown.
* build616
    * webchat: unescape when edit. lt, gt, amp, quot
* build615
    * webchat: remove edit button when not self message
* build614
    * webchat: keep show-more-less button status
* build613, monthly202009
    * markdown: image link ![describe](uri) supported.
* build612
    * webchat: remove delkey input from edit-modal-dialog
* build609
    * webchat: add edit button.
* build607
    * webchat: prepair for edit.
* build606
    * webchat.ts : add type definition to display model messages array
    * webpack.config.js : add single file component (.vue) loader , add css loader
    * update: vue 2.6.12
* build605
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
* KJWikiG_isAllowAutomaticSignUp : set true to allow new user sign up. default value is false.

### parameter override order

The parameters are read from below order.
1. read from resource bundle 'kjwikig' in war file.  ( ex key:dataStorePath )
2. override when there is environment variable. ( ex key:KJWikiG_dataStorePath )
3. override when there is Java System Properties. ( ex key:KJWikiG_dataStorePath )

