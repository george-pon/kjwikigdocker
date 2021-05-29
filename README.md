# kjwikigdocker

A docker image for kjwikig , which is wiki system written by plain JSP/Servlet (Tomcat8).

Wiki data are saved as-is text files, into volume path /var/lib/kjwikigdocker/.

File Cache Data saved as Java Serialized Object into /var/lib/kjwikigdocker/fcd/.

Tag Cache Data saved as Java Serialized Object into /var/lib/kjwikigdocker/wcd/.

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
helm repo update

# helm install for kjwikigdocker
helm install kjwikigdocker kjwikigdockerrepo/kjwikigdocker --set ingress.hosts="{kjwikigdocker.default.svc.k8s.local}"

# wait until deploy complete
kubectl rollout status deploy/kjwikigdocker
```


### tags


* build668, monthly202105, stable, latest
    * for tomcat10
    * use jakarta.servlet.http.* for Servlet API 5.0
    * use jakarta.servlet.http.Part for multipart/form-data
* build664
    * add: webchat: image size calculate 55% size from cookie image_size when post.
    * for tomcat 9 final version
* build663, monthly202104
    * add: settings: add radio button of image pixel size 240.
    * add: webchat: image size calculate 55% size from cookie image_size.
* build662
    * add: 2ch bbs: tag search cache.
* build661
    * add: webchat: display System Time Broadcast in fixed position, not in chat.
* build660, monthly202103
    * add: wiki, bbs, pictbbs, webchat: display login user name.
* build659, monthly202102
    * mod: webchat: use lodash.debounce for smart phone browser scroll.
* build658
    * mod: webchat: adjust infinite scroll start position.
* build657
    * fix: webchat: adjust scroll heigth and scroll top.
* build656
    * mod: webchat: modify comment.
* build655
    * fix: webchat: large image is shown in modal-dialog. fix image url.
* build654
    * fix: webchat: large image is shown in modal-dialog. set image size by vw and vh.
* build652
    * fix: webchat: large image is shown in modal-dialog. set image size.
* build651
    * try: webchat: humm? conflict between edit button and image button. -> ok.
* build650
    * modify: webchat: system message number is set 'sys' + number.
    * add: webchat: large image is shown in modal-dialog.
    * add: webchat: other site link is shown in _blank target.
* build649, monthly202101
    * add: template: add next month.
* build648
    * Fix: webchat: set v-for v-bind:key
    * Modify: webchat: display 50 message max.
* build647
    * Add: pictbbs tag cache to file. directory /var/lib/kjwikigdocker/wcd/
* build646
    * workaroud: because old format attribute file (xxx.atr) can not read, default delete key is set.
* build645
    * Modify: userAdd: when user add , user name conflict check with ignoreCaseEqual. (because in Windows File System, File name distinguished by ignoreCase.)
    * Modify: property isAllowAutomaticSignUp set by SetAllowAutomaticSignUp / SetDenyAutomaticSignUp / true / false.
    * Add: wiki tag cache to file. directory /var/lib/kjwikigdocker/wcd/
    * imcopatible change: attribute file of attached file (xxx.atr) is changed. old version format can not read. 
    * Fix: when normal digest search ( it means not tag digest search ) , do not save tag cache data.
* build642, monthly202012
    * update npm environment at 2020/12/31.
* build641, monthly202012, stable, latest
    * fix recent_pictbbs plugin: WebChat -> Web Chat to avoid Wiki Name Link.
* build640
    * hiki/usemodwiki/markdown: add recent_pictbbs plugin: add /l5 to pictbbs link 
* build639
    * pictbbs, upload plugin : DELKEY input form: add autocomplete=off
    * hiki/usemodwiki/markdown: add recent_pictbbs plugin
* build637
    * webchat: chat edit button is now set in global to avoid close edit dialog when message array is changed.
* build636
    * usemodwiki, markdown: todolist: allow to edit without check OL/UL item.
* build635, monthly202011
    * usemodwiki, markdown: todolist: add checked1d mode. display to do list item done today.
* build634
    * webchat, pictbbs: add {{gpslink(@123,456,17z)}} plugin
* build633
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
* KJWikiG_isAllowAutomaticSignUp : set SetAllowAutomaticSignUp to allow new user sign up. default value is SetDenyAutomaticSignUp.

### parameter override order

The parameters are read from below order.
1. read from resource bundle 'kjwikig' in war file.  ( ex key:dataStorePath )
2. override when there is environment variable. ( ex key:KJWikiG_dataStorePath )
3. override when there is Java System Properties. ( ex key:KJWikiG_dataStorePath )

