<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script>"undefined"==typeof CODE_LIVE&&(!function(e){var t={nonSecure:"9734",secure:"9743"},c={nonSecure:"http://",secure:"https://"},r={nonSecure:"127.0.0.1",secure:"gapdebug.local.genuitec.com"},n="https:"===window.location.protocol?"secure":"nonSecure";script=e.createElement("script"),script.type="text/javascript",script.async=!0,script.src=c[n]+r[n]+":"+t[n]+"/codelive-assets/bundle.js",e.getElementsByTagName("head")[0].appendChild(script)}(document),CODE_LIVE=!0);</script></head>
<body data-genuitec-lp-enabled="false" data-genuitec-file-id="wc1-9" data-genuitec-path="/Javascript/WebContent/DOM/Ex_03.jsp">
<ul data-genuitec-lp-enabled="false" data-genuitec-file-id="wc1-9" data-genuitec-path="/Javascript/WebContent/DOM/Ex_03.jsp">
    <li>HTML</li>
    <li>CSS</li>
    <li>JavaScript</li>
</ul>
<ol>
    <li>HTML</li>
    <li class="active">CSS</li>
    <li>JavaScript</li>
</ol>
<input type="button" onclick="first()" value="selector 1">
<input type="button" onclick="second()" value="selector 2">
<input type="button" onclick="third()" value="selector 3">

</body>
</html>

<script type="text/javascript">
	//CSS의 선택자를 이용해서 태그를 선택
	//최초의 li 태그를 가진 값만 선택
	function first(){
		var li = document.querySelector("li");
		li.style.color="blue";
	}
// 	모든 li태그 선택
	function second(){
		//배열을 리턴 하기 때문에 foreach문으로 처리
// 		var lis = document.querySelectorAll("li");
//		위와 같이 사용하면 노드객체도 같이 가져와 작동에는 문제가 없으나 콘솔창에서 에러를 발생 시킨다
		var lis = Array.from(document.querySelectorAll('li'))
//	 	for (String str : string[]) {
//			str.getXXX	
//		자바와의 차이점에 유의하자
		for(var name in lis){	
			lis[name].style.color="orange";
		}
		
	}
// 	class 선택자를 이용
	function third(){
		var li = document.querySelector(".active");
		li.style.color="red";
	}

</script>