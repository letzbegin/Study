<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="icon" type="image/x-icon" href="img/hanul.ico">
<style type="text/css">
#error {
	width: 600px;	margin: 0 auto;
	position: absolute;
	left: 50%;	top: 50%;
	transform: translate(-50%, -50%);
}
</style>
<script>"undefined"==typeof CODE_LIVE&&(!function(e){var t={nonSecure:"57820",secure:"57825"},c={nonSecure:"http://",secure:"https://"},r={nonSecure:"127.0.0.1",secure:"gapdebug.local.genuitec.com"},n="https:"===window.location.protocol?"secure":"nonSecure";script=e.createElement("script"),script.type="text/javascript",script.async=!0,script.src=c[n]+r[n]+":"+t[n]+"/codelive-assets/bundle.js",e.getElementsByTagName("head")[0].appendChild(script)}(document),CODE_LIVE=!0);</script></head>
<body data-genuitec-lp-enabled="false" data-genuitec-file-id="wc2-24" data-genuitec-path="/iot1/src/main/webapp/WEB-INF/views/tiles/error.jsp">
<div id="error" data-genuitec-lp-enabled="false" data-genuitec-file-id="wc2-24" data-genuitec-path="/iot1/src/main/webapp/WEB-INF/views/tiles/error.jsp">
	<div><a onclick="location='index'"><img src="img/hanul.logo.png"/></a>
	</div><hr>
	<div>
		<tiles:insertAttribute name="main"/>
	</div>
</div>
</body>
</html>