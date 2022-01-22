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

# helm install for kjwikigdocker (default: ingress path prefix /kjwikigdocker base)
helm install kjwikigdocker kjwikigdockerrepo/kjwikigdocker --set ingress.hosts="{kjwikigdocker.default.svc.k8s.local}"

# helm install for kjwikigdocker (ingress Host name base)
helm install kjwikigdocker kjwikigdockerrepo/kjwikigdocker --set ingress.hosts="{kjwikigdocker.default.svc.k8s.local}"

# wait until deploy complete
kubectl rollout status deploy/kjwikigdocker
```


### tags

* build718, monthly202201, stable, latest
    * add: redirect: consider X-FORWARDED-PORT
* build717
    * fix: redirect: consider X-FORWARDED-SCHEME, X-FORWARDED-HOST
* build716
    * fix: webchat: write and display first time, generate short message version after rendering HTML.
* build715
    * mod: plugin latestlink, lastupdatelink: argument here is set, displays current directory wiki page.
    * mod: css: modify css for todo-list edit/duplicate/child-toggle-display button.
* build714
    * mod: webchat: twitter like 140 letters short message generator changed. linefeed up to 4. HTML tag does not count.
    * mod: plugin latestlink, lastupdatelink: argument / is set, displays here.
* build713
    * update: javafetch library compile version is set to --release 8 (JDK 1.8)
    * mod: mod: modify button css.
    * add: usemodwiki/markdown: todo list mode: add level mode. toggle level 2 item display.
* build711
    * add: add toggle child button to markdown/usemodwiki todo-list mode.
* build708
    * add: add data file type Web Chat Bbs (*.wbb)
    * mod: create page: change default category name to MemoDir. change directory order. category nmae first. user name second.
* build702
    * mod: metrics: add prefix kjwikig_ to metrics key name for prometheus.
    * mod: Java Compile version is set to --release 8 (JDK 1.8)
    * update: Vue.js 3.2.26
* build701
    * add: add metrics for prometheus, path: /kjwikigdocker/metrics
* build700, monthly202112
    * mod: image draw: remove synchronized mark from generate thumbnail image method. it needs more memory.
* build699
    * mod: webchat: when display message number between 1 and 7 , set message number to 7 because enabel to infinite scroll. (work around)
* build698
    * add: Default Word ( Top Page ) file is absent, generate it when first access.
* build696
    * fix: webchat: fix scroll offset modify when send chat message.
* build693
    * add: helm chart: add metadata.labels values.yaml for istio labeling. add note.txt.
    * add: webchat: change trigger display next message in infinite scroll.
    * fix: webchat: fix logging unused variable.
    * mod: webchat: display messege number jump link and directory link at same line.
* build690
    * add: webchat: messege number jump link.
* build689, monthly202111
    * add: .kjwiki and wiki attribute line: add keyword allow_user_, deny_user_, allow_valid_user for access control.
    * change: .account file is now incompatible because SerialVersionUID is removed. Login again from a link in error page.
* build688
    * add: webchat: display connecting user name list.
    * update: AdoptiumOpenJDK 17.0.1
    * update: Debian 11
* build687, monthly202110
    * update: vue 3.2.20
    * update: for node.js v17 OpenSSL3 , add NODE_OPTIONS=--openssl-legacy-provider to build script.
* build686, monthly202109
    * mod: change base image to docker.io/georgesan/debiantomcat:debian10-adoptiumopenjdk17-tomcat10
    * add: webchat: add hyper link to message number.
* build685
    * add: webchat: jump to message number. link is >>nnn .
* build684
    * modify: web.xml DTD declare servlet 5.0
* build683, monthly202108
    * remove: webchat: remove onOpen/onClose broad cast message.
* build682
    * fix: webchat/pictbbs: update webchat message when post/edit from pictbbs.
* build681
    * add: webchat: scan chat message in view or not in view. when insert a message at above of viewing message, adjust scroll offset.
* build679, monthly202107
    * fix: webchat: add nbsp between number, date time and user-name .
    * fix: webchat: change timimg removal system message.
* build678
    * update: Vue 3.1.5
* build674
    * add: webchat: add input type=file element.
    * Vue 2.6 Final Version
* build672, monthly202106
    * webchat: fix null pointer exception when null delkey
    * Vue 2.6.14
* build671, monthly202106, stalbe, latest
    * webchat: fetch URL data when input just URL string.
* build668, monthly202105
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

