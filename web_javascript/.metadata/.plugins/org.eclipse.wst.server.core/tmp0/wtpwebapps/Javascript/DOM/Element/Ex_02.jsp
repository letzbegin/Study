<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script>"undefined"==typeof CODE_LIVE&&(!function(e){var t={nonSecure:"9734",secure:"9743"},c={nonSecure:"http://",secure:"https://"},r={nonSecure:"127.0.0.1",secure:"gapdebug.local.genuitec.com"},n="https:"===window.location.protocol?"secure":"nonSecure";script=e.createElement("script"),script.type="text/javascript",script.async=!0,script.src=c[n]+r[n]+":"+t[n]+"/codelive-assets/bundle.js",e.getElementsByTagName("head")[0].appendChild(script)}(document),CODE_LIVE=!0);</script></head>
<body data-genuitec-lp-enabled="false" data-genuitec-file-id="wc1-21" data-genuitec-path="/Javascript/WebContent/DOM/Element/Ex_02.jsp">
	<ul data-genuitec-lp-enabled="false" data-genuitec-file-id="wc1-21" data-genuitec-path="/Javascript/WebContent/DOM/Element/Ex_02.jsp">
		<li>html</li>
		<li>css</li>
		<li id="active">JavaScript</li>
	</ul>
	<input type="button" value="className change" onclick="change()">
	<input type="button" value="className change2" onclick="change2()">
	<script>
		var active = document.getElementById('active');
		// class 값을 변경할 때는 프로퍼티의 이름으로 className을 사용한다.
		function change() {
			active.className = "important current";
			alert(active.className);
		}
		function change2() {
			active.className += " readed"
			// 클래스를 추가할 때는 아래와 같이 문자열의 더한다.
			alert(active.className);
		}
	</script>
</body>
</html>