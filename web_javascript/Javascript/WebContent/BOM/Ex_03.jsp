<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<input type="button" id="appname" value="appname">
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
