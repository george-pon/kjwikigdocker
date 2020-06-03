<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page pageEncoding="UTF-8" %>
<%@ page session="true" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.Enumeration" %>
<%@ page import="java.util.Enumeration" %>
<%@ page import="java.util.logging.Logger" %>

<%

// ログ出力
Logger log = Logger.getLogger("index-jsp");

// 途中脱出用のwhile。
while (true) {

   // リダイレクト先
   String location = "/kjwikigdocker/";

   // pathがabsoluteならそのまま返す
   if (location.indexOf("://") > 0) {
       response.sendRedirect(location);
       break;
   }

   // スキーム://host:port部分を生成
   StringBuffer sb = request.getRequestURL();
   String url = sb.toString();
   String uri = request.getRequestURI();
   int idx = url.lastIndexOf(uri);
   String hostport = "";
   log.info("url : " + url);
   log.info("uri : " + uri);
   if (idx > 0) {
       hostport = url.substring(0, idx);
   }
   log.info("hostport : " + hostport);

   // HTTPヘッダ解析

   // tomcatが解析した値を取得
   String scheme = request.getScheme();
   String host = request.getRemoteHost();
   List<String> forwarded_for = new ArrayList<String>();

   // HTTPヘッダに指定があれば上書き
   for (Enumeration<String> e = request.getHeaderNames(); e.hasMoreElements();) {
       String name = e.nextElement();
       if (name.equalsIgnoreCase("X-FORWARDED-PROTO")) {
           String value = request.getHeader(name);
           if (value != null && value.length() > 0) {
               scheme = value.toLowerCase().strip();
           }
       }
       if (name.equalsIgnoreCase("X-FORWARDED-HOST")) {
           // 本当のアクセス先のホスト。
           String value = request.getHeader(name);
           if (value != null && value.length() > 0) {
               host = value.toLowerCase().strip();
           }
       }
       if (name.equalsIgnoreCase("X-FORWARDED-FOR")) {
           // カンマ区切りで沢山入る
           String value = request.getHeader(name);
           if (value != null && value.length() > 0) {
               String array[] = value.split(",", 68);
               // そこそこの長さ以下なら認める
               if (array != null && array.length <= 64) {
                   for (String s : array) {
                       forwarded_for.add(s.toLowerCase().strip());
                   }
               }
           }
       }
   }

   // スキーム部分が違うなら置き換える
   String prefix = scheme + "://";
   if (!hostport.startsWith(prefix)) {
       int idx2 = hostport.indexOf("://");
       if (idx2 > 0) {
           hostport = scheme + hostport.substring(idx2);
       }
   }

   if (location.startsWith("/")) {
       // locationが / からはじまる場合
       String u = hostport + location;
       log.info("hostport : "+ hostport);
       log.info("redirect to : "+ u);
       response.sendRedirect(u);
       break;
   }

   // locationの開始が / ではない場合は相対パス
   String v = request.getRequestURI();
   if (!v.endsWith("/")) {
       int idx3 = v.lastIndexOf('/');
       if (idx3 > 0) {
           v = v.substring(0, idx3 + 1);
       }
   }
   String u = hostport + v + location;
   response.sendRedirect(u);
   break;
}

    // response.sendRedirect("/kjwikigdocker/");
%>

<html>
    <head>
        <title>It works!</title>
    </head>
    <body>
        <h1>It works!</h1>
    </body>
</html>
