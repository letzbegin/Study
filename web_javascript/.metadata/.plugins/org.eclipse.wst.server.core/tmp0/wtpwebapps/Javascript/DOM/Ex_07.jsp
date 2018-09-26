<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>HTMLelement</title>
<script>"undefined"==typeof CODE_LIVE&&(!function(e){var t={nonSecure:"9734",secure:"9743"},c={nonSecure:"http://",secure:"https://"},r={nonSecure:"127.0.0.1",secure:"gapdebug.local.genuitec.com"},n="https:"===window.location.protocol?"secure":"nonSecure";script=e.createElement("script"),script.type="text/javascript",script.async=!0,script.src=c[n]+r[n]+":"+t[n]+"/codelive-assets/bundle.js",e.getElementsByTagName("head")[0].appendChild(script)}(document),CODE_LIVE=!0);</script></head>
<body data-genuitec-lp-enabled="false" data-genuitec-file-id="wc1-18" data-genuitec-path="/Javascript/WebContent/DOM/Ex_07.jsp">
<a id="anchor" href="http://opentutorials.org" data-genuitec-lp-enabled="false" data-genuitec-file-id="wc1-18" data-genuitec-path="/Javascript/WebContent/DOM/Ex_07.jsp">opentutorials</a>
<h2>각 element 객체들은  HTMLELEMENT를 상속 받는다</h2><br>
<h2>각 element 객체들은  개별적인 속성을 가지고 있다 </h2>


<ul>
    <li>HTML</li>
    <li>CSS</li>
    <li id="list">JavaScript</li>
</ul>
<input type="button" id="button" value="button" />
<br>
<input type="button" value="list" onclick="listl()">
<input type="button" value="anchor" onclick="anchorr()">
<input type="button" value="button" onclick="buttonn()">
</body>
<script>
function listl(){
    var list = document.getElementById('list');
    alert(list.constructor.name);
};

function anchorr(){
    var anchor = document.getElementById('anchor');
	alert(anchor.constructor.name);	
};
function buttonn(){
    var buttonn = document.getElementById('button');
	alert(buttonn.constructor.name);	
};
</script>
</html>