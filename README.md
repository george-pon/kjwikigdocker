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

* build486, stable, latest
    * improve: web chat displays date, time, name
* build485
    * fix: tag: digest search link in sub directory.
    * fix: catch image loader runtime exception.
* build483
    * modify: css: change background-color of table tr even/odd line.
* build481
    * modify: tag: links to digest tag search
* build480
    * modify: tag: links to digest search
* build479
    * improve: add recent_tag plugin sample to template page.
* build478
    * improve: add full display link to history page.
    * improve: add create page link to pictbbs page.
* build476
    * fix: remove jquery-3.3.1.js
    * fix: compile error in webchat
* build475
    * improve: create page , assist category input.
    * improve: hiki formatter allows ul/ol level to 12.
    * improve: hiki formatter supports recent_tag plugin.
    * improve: digest search get update date from wiki title (h1-h6) YYYY/MM/DD string pattern.
* build474
    * improve: create page usees vue.js, assist input
* build473
    * improve: tag in 2chbbs has now lastUpdate
    * fix: tag lastUpdate in pictbbs in cache
* build472
    * improve: /webchat allows multi line text. ctrl + enter is submit.
    * improve: /webchat allows image ctrl + v paste.
    * improve: pictbbs and webchat displays number link.
* build471
    * fix: zero data pictbbs creation and display in webchat.
    * improve: ACL check log
* build470
    * fix css
* build469
    * fix web socket url via SSL/TLS terminated reverse proxy.
* build462
    * add webchat servlet (Experimental) ( use Web Socket )
* build457
    * fix all wiki files into HTML convert mode.
* build456
    * add desc|url link check to hiki formatter.
* build455
    * {{recent_tag(tag,10)}} plugin add. It displays tag name link updated recent.
* build453
    * add sub-title of wiki (h1-h6) to result list of digest search.
* build452
    * when Ctrl-V image paste, auto uploaded image file prefixed base wiki name
* build451
    * Vue.js 2.5.21
* build450
    * Vue.js debug display enabled.
* build449
    * add Vue.js + axios
    * when edit whole wiki page or edit sub wiki page or upload plugin, supports automatic image upload from clipboard by press Ctrl-V in textarea.
* build448
    * when login failed, sleep 3 seconds.
* build447
    * markdown format. emphasis _emphasis_ is now need to white space left and right.
* build445
    * build by openjdk 11 with --release 8 option
    * kjwikigdocker/ping servlet is now available.  It returns HTTP Status 200 : "OK"  or HTTP Status 503 : Temporarily Unavailable.
* build444
    * filesizesort plugin improovement. offset link add.
    * jpg/png image size is now cached into atr file.
    * parameter is read from Java System Property. see environment variables.

### enviroment variables

* KJWikiG_dataStorePath : wiki data saved into. default value is /var/lib/kjwikigdocker
* KJWikiG_defaultWord : default wiki page name. default value is WelcomeVisitors
* KJWikiG_maxFileUploadSize : max file upload size in bytes. default value is 768000000
* KJWikiG_uploadFileTemporaryPath : temporary file path to recieve large upload file. default value is /tmp

### parameter override order

The parameters are read from below order.
1. read from resource bundle 'kjwikig' in war file.  ( ex key:dataStorePath )
2. override when there is environment variable. ( ex key:KJWikiG_dataStorePath )
3. override when there is Java System Properties. ( ex key:KJWikiG_dataStorePath )
