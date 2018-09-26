<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Attribute</title>
<script>"undefined"==typeof CODE_LIVE&&(!function(e){var t={nonSecure:"9734",secure:"9743"},c={nonSecure:"http://",secure:"https://"},r={nonSecure:"127.0.0.1",secure:"gapdebug.local.genuitec.com"},n="https:"===window.location.protocol?"secure":"nonSecure";script=e.createElement("script"),script.type="text/javascript",script.async=!0,script.src=c[n]+r[n]+":"+t[n]+"/codelive-assets/bundle.js",e.getElementsByTagName("head")[0].appendChild(script)}(document),CODE_LIVE=!0);</script></head>
<body data-genuitec-lp-enabled="false" data-genuitec-file-id="wc1-25" data-genuitec-path="/Javascript/WebContent/DOM/Element/Ex_05.jsp">
<a id="target" href="http://opentutorials.org" data-genuitec-lp-enabled="false" data-genuitec-file-id="wc1-25" data-genuitec-path="/Javascript/WebContent/DOM/Element/Ex_05.jsp">opentutorials</a>
<input type="button" value="attribute getUrl" onclick="geturll()">
<input type="button" value="attribute check" onclick="check()">
<input type="button" value="attribute change" onclick="change()">
<input type="button" value="attribute remove" onclick="remove()">
</body>
<script type="text/javascript">
var t = document.getElementById("target");
function geturll(){
	alert(t.getAttribute("href"));
}
function check(){
	alert(t.hasAttribute("href"));
}
function change(){
	t.setAttribute("href", "http://www.naver.com");
	alert("네이버로 변경됩니다");
	t.textContent="naver";
	
}
function remove(){
	alert("속성을 삭제합니다");
	t.remove("href");
}
</script>
</html>