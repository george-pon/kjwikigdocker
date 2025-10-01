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
* for debian:11 before docker run, you must set volume owner to uid:998 ( chown -R 998:998 /var/lib/kjwikigdocker )
* for debian:12 before docker run, you must set volume owner to uid:995 ( chown -R 995:995 /var/lib/kjwikigdocker )
```
docker run -d -p 8080:8080 -v /var/lib/kjwikigdocker:/var/lib/kjwikigdocker georgesan/kjwikigdocker:stable
```

#### run kjwikigdocker via helm chart

```
# helm repo add for kjwikigdocker
helm repo add kjwikigdockerrepo  https://raw.githubusercontent.com/george-pon/kjwikigdocker/master/helm-chart/charts

# update repo
helm repo update

# helm install for kjwikigdocker (default: ingress path prefix /kjwikigdocker base)
helm install kjwikigdocker kjwikigdockerrepo/kjwikigdocker

# helm install for kjwikigdocker (ingress Host name base)
helm install kjwikigdocker kjwikigdockerrepo/kjwikigdocker --set ingress.hosts="{kjwikigdocker.default.svc.k8s.local}"

# wait until deploy complete
kubectl rollout status deploy/kjwikigdocker
```


### tags

* build973, monthly202510, stable, latest
    - fix: auto markdown formater detect at file ext has .md
    - mod: pomodoro timer plugin : comment string uses start time
* build972, monthly202509, stable, latest
    - mod: use ImageReader to get image size.
* build971, monthly202509, stable, latest
    - add: add template snipet pomodoro_timer(after,number)
    - mod: change sound pomodoro_timer
* build970, monthly202508, stable, latest
    - fix: pictbbs / webchatbbs: delete attached file force.
* build969, monthly202508, stable, latest
    - fix: postformat: not to convert new_wiki_page plugin in pre.
* build968, monthly202508, stable, latest
    - mod: markdown / usemodwiki: modify normal template page.
    - mod: new_wiki_page plugin button: use html form submit.
    - add: rename wiki word.
* build966, monthly202508, stable, latest
    - add: new_wiki_page plugin
* build965, monthly202508, stable, latest
    - update: vue3.js 3.5.19
* build964, monthly202508, stable, latest
    - mod: todolist: rename memo button. new wiki name do not contain to do list message string.
* build963, monthly202508, stable, latest
    - add: add raw html cache to latest/lastupdate/digest plugin.
* build962, monthly202508, stable, latest
    - add: add todo button at wiki edit partial edit.
* build961, monthly202507, stable, latest
    - add: upload form snipet / page edit snipet / sub page edit snipet.
    - fix: usemodwiki: todolist: ol pattern time regex.
* build960, monthly202507, stable, latest
    - add: upload form snipet.
    - add: create page direct jump to target page.
* build958, monthly202507, stable, latest
    - add: upload plugin option newpage. write to new wiki page.
    - add: to do list plugin : add new page button.
    - fix: correct link in subdirectory reserved word (AllPages, RecentPages, RecentAccessPages).
* build957, monthly202507, stable, latest
    * add: property isCheckSecondSessionID.
* build956, monthly202506, stable, latest
    * add: upload plugin: add pomodoro timer button.
* build955, monthly202505, stable, latest
    * fix: webchat: displaying first element condition.
* build954, monthly202505, stable, latest
    * mod: bbs: remove table from form.
* build953, monthly202505, stable, latest
    * fix: print css , side css : fix mojibake.
    * mod: upload / post / comment plugin : remove table from form.
    * fix: post plugin: remove needless p and /p tag.
* build952, monthly202505, stable, latest
    * add: webchat, webchat2, pictbbs, bbs: remember request URI when not login.
* build951, monthly202505, stable, latest
    * add: markdown: strike through mark ~~ .
* build950, monthly202505, stable, latest
    * add: download thumbnail servlet : get image size from file attribute.
* build949, monthly202504, stable, latest
    * mod: download servlet : cache thumbnail image data 3 minutes. little modify.
* build948, monthly202504, stable, latest
    * mod: download servlet : cache thumbnail image data 3 minutes. gabage collection called in interval timer thread.
* build947, monthly202504, stable, latest
    * add: pomodoro timer: reset button: restore timer value at reset at once.
* build946, monthly202504, stable, latest
    * fix: calendar: substitute holiday calculation.
* build945, monthly202504, stable, latest
    * mod: download servlet : cache thumbnail image data 3 minutes. gabage collection when read and write.
* build944, monthly202504, stable, latest
    * add: download servlet : cache thumbnail image data 3 minutes.
* build942, monthly202504, stable, latest
    * add: pomodoro timer button to web chat.
* build937, monthly202504, stable, latest
    * mod: use openjdk24
* build937, monthly202503, stable, latest
    * fix: todolist(recent2w) is now available.
    * add: add display option to todolist_calendar plugin like todolist_calendar(2w).
* build935, monthly202503, stable, latest
    * mod: modify top page.
* build934, monthly202503, stable, latest
    * add: webchat: add random bottom disp mode.
* build933, monthly202503, stable, latest
    * fix: webchat2: remove ConcurrentModificationException.
    * add: webchat: add axios post error system message.
* build932, monthly202503, stable, latest
    * add: add autostart option to pomodoro_timer plugin.
* build931, monthly202502, stable, latest
    * mod: web chat bbs: random mode: in top view, random post started.
* build930, monthly202502, stable, latest
    * mod: web chat bbs: change fetch message count from 3 to 1 when message write part 2.
* build929, monthly202502, stable, latest
    * fix: recent access file : null pointer exception
* build928, monthly202502, stable, latest
    * mod: web chat bbs: change fetch message count from 3 to 1 when message write.
* build927, monthly202502, stable, latest
    * mod: recent access file write debounced.
* build926, monthly202501, stable, latest
    * mod: pomodoro timer: start stop button is continuas.
* build925, monthly202501, stable, latest
    * fix: editfile: set second session id value.
* build924, monthly202501, stable, latest
    * add: web chat random display mode : displays a random message per 3 seconds.
* build923, monthly202501, stable, latest
    * fix: to do list: yotei string output when date is set only.
* build922, monthly202501, stable, latest
    * add: holiday mark (H) is add to todolist_calendar.
* build921, monthly202501, stable, latest
    * add: pomodoro_timer plugin parameter blank add which mean do not write wiki.
* build920, monthly202501, stable, latest
    * add: add to wiki a line comment (pomodoro_timer plugin result string).
* build919, monthly202501, stable, latest
    * fix: pomodoro timer sound flag.
* build917, monthly202501, stable, latest
    * add: pomodoro_timer plugin to display simple timer vue3 app.
* build916, monthly202501, stable, latest
    * add: add default sub directory name to search.jsp and digest.jsp.
* build915, monthly202501, stable, latest
    * mod: .jsp and .html format by eclipse.
* build914, monthly202501, stable, latest
    * fix: jsp property access close tag.
* build913, monthly202412, stable, latest
    * fix: do not check second session ID when digest search link.
    * fix: do not check second session ID when search link.
* build911, monthly202412, stable, latest
    * fix: when web chat message edit, attached image file is not displaied.
* build910, monthly202412, stable, latest
    * add: add second session ID (generated at login) to form and check it form action season 3.
* build909, monthly202412, stable, latest
    * add: add second session ID (generated at login) to form and check it form action season 2.
* build907, monthly202412, stable, latest
    * mod: modify to do list calendar plugin.
* build906, monthly202412, stable, latest
    * add: add to do list calendar plugin.
* build905, monthly202412, stable, latest
    * mod: calendar: set color today.
* build904, monthly202412, stable, latest
    * add: tag cache add for raw html file.
* build902, monthly202411, stable, latest
    * mod: stop cache file read when initialize. read directory directly.
* build900, monthly202411, stable, latest
    * mod: update Vue 3.5.13
* build899, monthly202410, stable, latest
    * mod: webchat2: modify viewport for android web browser.
* build898, monthly202410, stable, latest
    * mod: webchat2: modify css for android web browser.
* build897, monthly202409, stable, latest
    * mod: update axos, vue.
* build896, monthly202409, stable, latest
    * add: usemodwiki / markdown : pre calendar : add Japanese holiday calc.
* build895, monthly202409, stable, latest
    * mod: webchat: image size is set 228px when no session info.
* build893, monthly202409, stable, latest
    * rev: web.xml: session config: remove cookie secure in session config.
* build892, monthly202408, stable, latest
    * mod: web.xml: session config: add cookie secure into session config.
* build891, monthly202408, stable, latest
    * mod: template: modify wiki template page.
* build890, monthly202408, stable, latest
    * add: template: add simple markdown wiki page template.
* build889, monthly202407, stable, latest
    * mod: pictbbs: uploadfileref img src class is set to autoimagesize.
* build888, monthly202407, stable, latest
    * add: randomlink(wiki-name-prefix,15) plugin. generates random link to wiki topic.
* build887, monthly202407, stable, latest
    * add: web chat bbs / web chat 2 bbs: add random display mode. URL is WebChatBbs/L20.
* build886, monthly202407, stable, latest
    * add: pict bbs: add random display mode. URL is PictBbs/L20.
* build885, monthly202407, stable, latest
    * fix: todo list: when edit to do list , without check mark in line, null pointer exception.
* build884, monthly202407, stable, latest
    * fix: todo list: <todolist(before|after)> : when before/after is not set, default is before.
* build883, monthly202407, stable, latest
    * add: todo list: <todolist(before|after)> is implemented.
* build882, monthly202407, stable, latest
    * fix: formatter: null pointer exception in todolist.
* build881, monthly202406, stable, latest
    * mod: webchat2: modify css.
* build880, monthly202406, stable, latest
    * mod: webchat2: modify css.
* build879, monthly202406, stable, latest
    * mod: webchat2: modify css.
* build878, monthly202406, stable, latest
    * mod: webchat2: modify css.
* build877, monthly202406, stable, latest
    * mod: webchat2: modify css.
* build876, monthly202406, stable, latest
    * mod: webchat2: modify css.
* build875, monthly202406, stable, latest
    * mod: webchat2: header area z-index: 0.
* build874, monthly202406, stable, latest
    * mod: webchat2: web chat 2 width is set to 360px.
* build873, monthly202406, stable, latest
    * fix: webchat2: fix tag search link.
* build872, monthly202406, stable, latest
    * add: webchat2link plugin: enables displaying multiple webchat bbs in one page , like tweetdeck.
* build871, monthly202406, stable, latest
    * mod: webchat, webchat2: convert to Vue 3 composition API.
* build870, monthly202405, stable, latest
    * webchat2: prepair for multi scroll area like tweet deck. width is 320px.
* build869, monthly202405, stable, latest
    * upload plugin rewrite by Vue 3 composition API
* build868, monthly202405, stable, latest
    * mod: Vue 3.4.26
* build867, monthly202404, stable, latest
    * fix: cache file list entry name is checked strictly match in dataStorePath.
* build860, monthly202404, stable, latest
    * mod: monthly_calendar plugin. add before day and after day.
* build859, monthly202404, stable, latest
    * add: monthly_calendar plugin.
* build857, monthly202403, stable, latest
    * add: todolist: add pomodoro attribute.
    * mod: todolist: duplicate / edit lines is normalized.
* build856, monthly202403, stable, latest
    * add: webchat: webchat2link plugin.
* build855, monthly202403, stable, latest
    * try: webchat: set interval timer to call first api fetch messages.
* build854, monthly202403, stable, latest
    * fix: webchat: remove no javascript alternative area because a few image files downloaded before javascript file.
* build853, monthly202403, stable, latest
    * fix: css: add webchat top button color css.
* build852
    * add: webchat2: prepair for tweet deck type inner scroll area.
* build851
    * fix: css: add sticky top button color css.
* build850
    * mod: webchat: send system message interval change from 5 to 10 seconds.
    * add: webchat: add sticky top button.
* build849
    * mod: webchat: modify scroll get next condition.
* build848
    * mod: ts: update vue 3.4.21
* build847
    * mod: ts: remove import window from main.ts
* build846, monthly202401
    * del: jsp: remove process time display for web cache.
* build845, monthly202312
    * fix: webchat: set alternative display area to display none in script type text/javascript area.
* build844
    * mod: webchat: set alternative display area to display none in script type text/javascript area.
* build843
    * fix: webchat: javascript function call in ES6 module.
* build842
    * mod: change javascript build system from webpack to vite.
* build838
    * fix: webchat: add title string into message area to display title string when not blank string.
* build837
    * mod: webchat: add title string into message area to display title string.
* build836
    * mod: webchat.jsp: add altanative html when vue.js is not work.
* build835, monthly202311
    * mod: add autocomplete attribute to login form / pincode form.
* build834
    * mod: add placeholder to form pincode field.
* build833, monthly202310
    * mod: update json.org library
* build832
    * mod: webchat: modify scroll control. check scroll when debounce call.
* build831
    * mod: webchat: modify scroll control.
* build830
    * mod: webchat: modify scroll control.
* build829
    * mod: webchat: modify scroll control.
* build828
    * mod: webchat: modify scroll control.
* build827
    * add: to do list: when check off , date is set from due_date.
* build826
    * add: to do list: add created_date , due_date, state field for record.
* build825
    * mod: webchat: GPS button: modify 3rd param.
    * mod: use Temurin OpenJDK 21
* build824, monthly202309
    * add: to do list: sub edit: set formatter kind.
    * fix: pre are edit works.
* build823
    * add: usemodwiki / markdown: to do list: add up / down button.
* build822, monthly202308
    * mod: markdown: todolist: when add message and edit check mark , add space to 4 indents
* build821
    * fix: webchat: when GPS button error, insert error message into text area.
* build820
    * mod: markdown format: allow multiple white space between number list period and check box bracket.
* build819
    * mod: webchat: short message length is set to 560 chars(half width), 140 chars(full width).
* build818
    * nop: monthly release.
* build817, monthly202307
    * mod: webchat: add uploadable file type video/mp4.
    * mod: video tag: add autoplay muted attribute.
* build816
    * mod: encode space to %20 when fetch article
* build815
    * build for JDK-17 (changed from JDK-11)
* build814, monthly202306
    * add: all HTML convert: copy wiki config file into html output folder.
* build813
    * update: vue 3.3.4
* build812, monthly202305
    * mod: webchat: when create/edit/delete post web socket update uses async method.
    * mod: webchat/pictbbs: gpslink plugin allows minus z axis.
* build811, monthly202304
    * add: webchat: add delete button.
* build810, monthly202304, stable, latest
    * mod: add a.button.active css.
* build809
    * mod: add button.active css.
* build808
    * fix: upload servlet: stop re-encoding iso8859 to utf8.
* build807
    * fix: plugin filesizesort: fix error when no attr file delete.
* build806
    * add: plugin filesizesort: add file delete checkbox and file delete function.
* build805
    * fix: markdown / usemodwiki: todolist level mode: after edit , jump to parent item.
* build804, monthly202303
    * fix: webchat: gps button is now available.
* build803
    * add: markdown wiki file (.md) is now available. automatically add @wikiformatter=markdown at first line.
* build802
    * add: markdown wiki file (.md) is now readable and writable.
* build801
    * add: editsub snipet markdown table.
* build800
    * mod: plugin recent, recent_wiki_access, recent_wiki_update, nearname, recent_pictbbs, filesizesort: prefix is relative name
* build799
    * add: hiki: recent_wiki_update, recent_wiki_access plugin: add 2nd arg prefix of wiki word.
* build798
    * fix: update tag cache file.
* build796
    * add: template: abstract section.
    * webui-run.ps1 script for git clone and run.
* build795, monthly202302
    * update: vue 3.2.47
* build794
    * modify: webchat: use vue component at textarea.
* build793
    * add: webchat: add new message button.
* build792, monthly202301, stable, latest
    * add: webchat: copy window_image_size session info when api recieve.
* build791
    * add: cookie: add pixel size 480.
    * fix: webchat: copy window_image_size session info to correct image size in webchat.
* build790
    * fix: webchat: ignore data.messages is null
* build789
    * add: markdown: support header pattern # 1. title , then title with auto generated chapter number.
* build788, monthly202212
    * add: editsub: add template select form.
* build787
    * add: recent_wiki_update plugin.
* build784
    * mod: edit new wiki page: add template select form.
    * add: to register template for edit new wiki page, create wiki page named "TemplateWikiPagexxx"
    * add: to register snipet for upload form, create wiki page named "TemplateSnipetxxxx"
* build783
    * add: upload plugin: add template select form.
* build781
    * add: recent_wiki_access plugin.
* build780
    * add: webchat: automatic image size change from window size.
* build779
    * add: cookie: add pixel size 720, 1920.
* build778
    * add: webhcat: jump to message.
* build777, monthly202211
    * mod: webchat: first view message count is set to 28.
* build776
    * fix: correct inFirstView flag.
    * mod: webchat: use throttle when onScroll.
    * fix: correct lastCmd flag.
* build774
    * mod: for Tomcat 10.1 Servlet API 6.0 WebSocket API 2.1 Java 11 later.
* build773
    * add: webchat: show image post error message.
    * info: tomcat 10.0 Java 8 final version
* build772, monthly202210
    * fix: change wiki key serialized code.
* build771
    * fix: update javafetch.jar library
* build770, monthly202210
    * fix: try to unregister executor at WebListener.
* build767, monthly202209
    * add: markdown: in paragraph , To create a line break (<br>), end a line with two or more spaces.
* build766, monthly202208
    * add: webhcat, pictbbs: render [[url describe]] mark up.
* build764
    * add: webchat: add beep play button.
    * fix: wiki display: get username from session info.
* build761
    * try: Login: clear session info when login part 2.
* build760
    * try: Login: clear session info when login.
* build759
    * try: pictbbs: remove image size auto fit.
* build758
    * try: webchat: remove image size auto.
* build757
    * try: webchat: add top and bottom fixed message.
    * fix: webchat: correct infinite scroll API requesting flag Enter/Leave.
* build756, monthly202207
    * add: webchat: add modal component for image. when click padding area, close modal window.
* build755
    * fix: redirect: fix when extract web app in ROOT
* build754
    * try: webchat: catch runtime exception while interval broadcast.
* build753
    * update: libraries
* build751
    * update: vue3.2.37
* build750, monthly202206
    * fix: webchat: image width and height is set.
* build749, monthly202206
    * fix: when 2nd login authentication , username and delkey is null.
* build747
    * add: 2nd login authentication when .login file has pincode column.
    * add: .login format : username password delkey pincode or username:value password:value delkey:value pincode:value
    * add: when 2nd login authentication failure 6 times , user login check is always fail. (failure count is reset when tomcat reboot)
* build746
    * fix: bbs, pictbbs, webchatbbs: wiki name match make more strictly.
* build743
    * add: when access to wiki page , required allow_valid_user and not login , redirect to login page.
* build740, monthly202205
    * mod: .login file: add 3rd column default delkey: format is now username password delkey.
* build739
    * mod: webchat: skip null line in shot format.
    * mod: upload plugin: add placefolder to subtitle.
* build738
    * add: pictbbslink , webchatlink plugin: check bbs file exists.
    * fix: recent_pictbbs plugin: displays pictbbs and webchatbbs file .
* build736
    * add: ignore .git directory inside wiki data directory.
* build735, monthly202204
    * modify: css: img css height auto.
* build734
    * modify: webchat: css: ul offset is set to 0.
    * modify: webchat: img: image size is set to auto.
* build732
    * modify: add nearname and recent plugin to wiki template data.
    * modify: webchat: css: message content box css changed to max-width 90%, width auto.
    * modify: webchat: display image size set by user cookie setting.
* build730
    * update: Vue 3.2.31
* build729, monthly202203
    * add: webchat: modal edit: paste image / drag & drop file support.
* build728
    * add: digest search: search from webchat bbs.
* build727, monthly202203
    * add: search from webchat bbs file, too.
* build726, monthly202202, stable, latest
    * fix: convert HTML: decode getURL() result string.
* build725
    * mod: css: set fornt-size 1rem to button class.
* build724
    * mod: download servlet: enable raw file download
* build723
    * mod: from webchat, editfile returns to webchat.
* build722, monthly202201
    * mod: add url character *
* build720
    * fix: webchatbbs: fix to delete work.
    * add: default sample top page template: add latestlink and lastupdatelink sample.
* build718
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

