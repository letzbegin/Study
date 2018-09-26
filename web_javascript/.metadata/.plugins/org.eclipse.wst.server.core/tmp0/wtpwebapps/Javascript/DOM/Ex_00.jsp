<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script>"undefined"==typeof CODE_LIVE&&(!function(e){var t={nonSecure:"9734",secure:"9743"},c={nonSecure:"http://",secure:"https://"},r={nonSecure:"127.0.0.1",secure:"gapdebug.local.genuitec.com"},n="https:"===window.location.protocol?"secure":"nonSecure";script=e.createElement("script"),script.type="text/javascript",script.async=!0,script.src=c[n]+r[n]+":"+t[n]+"/codelive-assets/bundle.js",e.getElementsByTagName("head")[0].appendChild(script)}(document),CODE_LIVE=!0);</script></head>
<body data-genuitec-lp-enabled="false" data-genuitec-file-id="wc1-11" data-genuitec-path="/Javascript/WebContent/DOM/Ex_00.jsp">
<ul data-genuitec-lp-enabled="false" data-genuitec-file-id="wc1-11" data-genuitec-path="/Javascript/WebContent/DOM/Ex_00.jsp">
	<li>HTML</li>
	<li>CSS</li>
	<li>JavaScript</li>
</ul>

<ol>
	<li>HTML</li>
	<li>CSS</li>
	<li>JavaScript</li>
</ol>
<input type="button" value="change li" id="chgli">
<input type="button" value="change ul li" id="chgulli">
</body>
</html>
<script type="text/javascript">
<!--

-->
var chgli = document.getElementById('chgli');
chgli.addEventListener('click', function(){
	//태그의 이름으로 객체(배열)를 찾아서 lis 에 할당 한다
	var lis =document.getElementsByTagName("li");
	//for으로 각 객체(배열)에 속성을 부여한다
	for(var i = 0 ; lis.length ; i++){
		lis[i].style.color='red';
	}
});

// ul 안에 있는 li 만 한정하고 싶은 경우

var chgulli = document.getElementById('chgulli');
chgulli.addEventListener('click', function(){
		//ul 객체(배열)을 먼저 찾은 후
	var ul =document.getElementsByTagName("ul")[0];
		//li 객체(배열)을 찾은 후
	var lis =ul.getElementsByTagName("li");
	//for으로 각 객체(배열)에 속성을 부여한다
	for(var i = 0 ; i<lis.length ; i++){
		lis[i].style.color='blue';
	}
});


</script>