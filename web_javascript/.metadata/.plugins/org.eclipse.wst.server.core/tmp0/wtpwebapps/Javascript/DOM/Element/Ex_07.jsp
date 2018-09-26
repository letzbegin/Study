<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>jQuery</title>
<script>"undefined"==typeof CODE_LIVE&&(!function(e){var t={nonSecure:"9734",secure:"9743"},c={nonSecure:"http://",secure:"https://"},r={nonSecure:"127.0.0.1",secure:"gapdebug.local.genuitec.com"},n="https:"===window.location.protocol?"secure":"nonSecure";script=e.createElement("script"),script.type="text/javascript",script.async=!0,script.src=c[n]+r[n]+":"+t[n]+"/codelive-assets/bundle.js",e.getElementsByTagName("head")[0].appendChild(script)}(document),CODE_LIVE=!0);</script></head>
<body data-genuitec-lp-enabled="false" data-genuitec-file-id="wc1-27" data-genuitec-path="/Javascript/WebContent/DOM/Element/Ex_07.jsp">
<a id="target" href="http://opentutorials.org" data-genuitec-lp-enabled="false" data-genuitec-file-id="wc1-27" data-genuitec-path="/Javascript/WebContent/DOM/Element/Ex_07.jsp">opentutorials</a>

<input type="button" value="check href" onclick="check1()">
<input type="button" value="set title" onclick="check2()">
<input type="button" value="remove title" onclick="check3()">
</body>
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<script>
var t = $('#target');

function check1(){
alert(t.attr('href')); //http://opentutorials.org
}


function check2(){
alert("title 을 opentutorials.org 로 변경합니다 ")	
t.attr('title', 'opentutorials.org'); // title 속성의 값을 설정한다.
alert(t.attr('title'));	
}

function check3(){
	alert("title 속성을 제거합니다")
t.removeAttr('title'); // title 속성을 제거한다.
	
}
</script>
</html>