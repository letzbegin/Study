<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>jQuery Object</title>
<style type="text/css">
li{
text-decoration: 
}

</style>
<script>"undefined"==typeof CODE_LIVE&&(!function(e){var t={nonSecure:"9734",secure:"9743"},c={nonSecure:"http://",secure:"https://"},r={nonSecure:"127.0.0.1",secure:"gapdebug.local.genuitec.com"},n="https:"===window.location.protocol?"secure":"nonSecure";script=e.createElement("script"),script.type="text/javascript",script.async=!0,script.src=c[n]+r[n]+":"+t[n]+"/codelive-assets/bundle.js",e.getElementsByTagName("head")[0].appendChild(script)}(document),CODE_LIVE=!0);</script></head>
<body data-genuitec-lp-enabled="false" data-genuitec-file-id="wc1-20" data-genuitec-path="/Javascript/WebContent/DOM/Ex_09.jsp">
<ul data-genuitec-lp-enabled="false" data-genuitec-file-id="wc1-20" data-genuitec-path="/Javascript/WebContent/DOM/Ex_09.jsp">
	<li>HTML</li>
	<li>CSS</li>
	<li>JavaScript</li>
</ul>
<input type="button" value="Jquery underline" onclick="underline()">
<input type="button" value="Jquery underline check" onclick="undercheck()">
</body>
<script type="text/javascript">
function underline(){
// 	$('li').css('속성','속성값');
	$('li').css('text-decoration','underline'); 
}
function undercheck(){
// 만약 속성 값을 주지 않는다면 해당 객체의 속성을 리턴해 준다
	alert($('li').css('text-decoration'));
}

</script>
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
</html>