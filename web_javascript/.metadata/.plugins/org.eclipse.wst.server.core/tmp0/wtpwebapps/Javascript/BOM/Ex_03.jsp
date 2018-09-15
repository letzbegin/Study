<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script>"undefined"==typeof CODE_LIVE&&(!function(e){var t={nonSecure:"9734",secure:"9743"},c={nonSecure:"http://",secure:"https://"},r={nonSecure:"127.0.0.1",secure:"gapdebug.local.genuitec.com"},n="https:"===window.location.protocol?"secure":"nonSecure";script=e.createElement("script"),script.type="text/javascript",script.async=!0,script.src=c[n]+r[n]+":"+t[n]+"/codelive-assets/bundle.js",e.getElementsByTagName("head")[0].appendChild(script)}(document),CODE_LIVE=!0);</script></head>
<body data-genuitec-lp-enabled="false" data-genuitec-file-id="wc1-2" data-genuitec-path="/Javascript/WebContent/BOM/Ex_03.jsp">
<input type="button" id="appname" value="appname" data-genuitec-lp-enabled="false" data-genuitec-file-id="wc1-2" data-genuitec-path="/Javascript/WebContent/BOM/Ex_03.jsp">
<input type="button" id="appVersion" value="appVersion">
<input type="button" id="userAgent" value="userAgent">
</body>
</html>

<script type="text/javascript">
<!--

//-->
var appname = document.getElementById('appname');
appname.addEventListener('click',function(){
	alert(navigator.appName);
});
var appVersion = document.getElementById('appVersion');
appVersion.addEventListener('click',function(){
	alert(navigator.appVersion);
});

var userAgent = document.getElementById('userAgent');
userAgent.addEventListener('click',function(){
	alert(navigator.userAgent);
});
</script>

