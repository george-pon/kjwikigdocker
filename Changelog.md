# Change Log

### history of tag

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
