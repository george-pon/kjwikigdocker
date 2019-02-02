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

* build471, stable, latest
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
