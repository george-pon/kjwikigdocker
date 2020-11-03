# Change Log

### history of tag

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
* build529
    * fix: zip file drag and drop upload
* build528
    * fix: markdown and hiki formatter: correct nested ul/ol html tag.
* build527
    * fix: web chat: on web socket open, not to request last 25 to optimize.
* build524
    * add: date and time string to web chat error message.
* build520
    * for Kubernetes v1.16 : kind: Deployment , apiVersion apps/v1 .
    * add: webchat page unit is now set to 25.
* build519
    * add: add plugin webchatlink(wikiname) , pictbbslink(wikiname) to display webchat / pictbbs selective.
* build518
    * add: pictbbs and webchat: add header link, to show pictbbs view / webchat view.
* build517
    * imporve: web chat: display image now 200px.
* build516
    * imporve: web chat: display old history log (infinite scroll).
* build514
    * improve: add web chat write number.
    * imporve: web chat: display old history log.
* build512
    * modify: javafetch.jar library update.
* build511
    * modify: javafetch.jar library update.
* build510
    * add: webchat image size set to 240 px
* build509
    * add: add pan-kuzu link ( topic path link ) to pictbbs, 2chbbs.
    * add: add createpage link to 2chbbs.
* build508
    * add: HttpServletRequestDummy for command line convert markdown to html.
* build507
    * build by openjdk 12
* build506
    * fix: 2ch dat , pictbbs , webchat format. fix 2ch res link regex.
* build505
    * add: rendering HTML in WebChat is now Java Servlet.
* build504
    * fix: fix: Range Header 0- . set range ends filesize - 1.
* build502
    * fix: tag cache updates when wiki updated.
* build501
    * update: tag cache updates when wiki updated.
* build499
    * fix: topic path link search.
* build498
    * add: add topic path link to word.jsp
    * modify: from tomcat:9-jdk11
* build497
    * modify: edit log output.
* build492
    * fix: ping servlet: always log warning.
* build491
    * fix: url generator for image ctrl-v and file drug and drop upload. part2.
* build490, stable, latest
    * fix: url generator for image ctrl-v and file drug and drop upload.
* build489, stable, latest
    * add file upload by drug and drop to pictbbs
* build487
    * add file upload by drug and drop to wiki, webchat
* build486
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
* build442
    * fix tag cache for bbs, pictbbs.
* build441
    * fix file cache null check.
* build437
    * tag list is now cached on memory.
* build436
    * war file is now build by gradle 4.10.2.
    * directory cache file (.fcd) is now created in fcd directory.
* build428
    * fix library ant task javac option. now use release="8"
* build427
    * fix filesizesort plugin. file data which has same name is now also updated.
    * use openjdk-10 compiler, but target = "1.8"
* build423
    * fix table for markdown formatter
* build422
    * fix tag list encount number
* build419
    * fix image thumb nail proc
    * fix Range header proc. when invalid Range header is requested, just ignore it. ( not return error )
* build418
    * pre partial edit link is now shown upside and right edge of pre format area ( usemodwiki / markdown )
    * set Content-Length header on download servlet
    * support Range header on download servlet
* build415
    * bug fix pre partial edit link ( usemodwiki / markdown )
* build413
    * support pre partial edit link ( usemodwiki / markdown )
* build412
    * support ul check format ( usemodwiki / markdown )
* build411
    * add taglistlink plugin.
* build410
    * add taglist servlet
    * correct relative link address of digest output ( i.e. archive mode page )
* build407
    * add searchlink plug in
    * rename digest plug in to digestlink
    * rename latest plug in to latestlink
* build401
    * fix digest servlet. call search word.
* build400
    * fix tag search result. when tag search , output is digest mode.
    * edit link of digest search result is corrected.
* build398
    * latest output servlet supported.
    * blog post template added.
* build384
    * wiki name link of the Reserved Words are normal link ( not edit link ).
    * digest search allows normal word search and tag search.
* build381
    * add self link to h1 - h6 headding line.
* build378
    * add digest search. search result page is rendered HTML format by original wiki format.
* build376
    * update template page. add markdown template text.
    * .login file support. To use authentication, write "username-sample password-sample" line into .login file.
* build367 : fetch text word wrap width is now 65536x2.
* build366 : filesizesort plugin outputs html table format.
    * helm-chart ingress sample. add annotation nginx.ingress.kubernetes.io/proxy-body-size: 1560m 
* build364 : add filesizesort plugin to wikiformatter usemodwiki.
    it displays image files in directory order by file size desc.
* build352 : fix iCab Mobile bookmarklet link.
* build351 : fix encoding when new file create.
* build350 : add bookmarklet link to PictBBS and BBS.
* build349 : add url input to PictBBS form.
* build346 : correct file charset auto detect routine.
* build343 : enable partial pre division edit link in markdown format.
* build342 : add ! mark to URL pattern.
* build340 : fix search result line. hiki formatter: in block quote, do not replace string modifier(italic, bold, strike)
* build339 : tag support. tag search support. when write tag:keyword,keyword2 in wiki text, create tag search link.
* build338 : big fix. write check: support unicode surrogate pair
* build337 : nearname, recent plugin supports wiki name prefix
* build335 : volume path changed to /var/lib/kjwikigdocker
* build332 : new file.encoding is set to UTF-8. volume path : /var/kjwikigdocker

