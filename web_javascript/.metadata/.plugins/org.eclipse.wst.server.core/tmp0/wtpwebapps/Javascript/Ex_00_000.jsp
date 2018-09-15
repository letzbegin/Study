<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script>"undefined"==typeof CODE_LIVE&&(!function(e){var t={nonSecure:"9734",secure:"9743"},c={nonSecure:"http://",secure:"https://"},r={nonSecure:"127.0.0.1",secure:"gapdebug.local.genuitec.com"},n="https:"===window.location.protocol?"secure":"nonSecure";script=e.createElement("script"),script.type="text/javascript",script.async=!0,script.src=c[n]+r[n]+":"+t[n]+"/codelive-assets/bundle.js",e.getElementsByTagName("head")[0].appendChild(script)}(document),CODE_LIVE=!0);</script></head>
<body data-genuitec-lp-enabled="false" data-genuitec-file-id="wc1-7" data-genuitec-path="/Javascript/WebContent/Ex_00_000.jsp">

<!-- Html 코드를 내부에 스크립트 코드를 삽입하는 처리방식 
	
	inline 방식이라고 한다
-->
<input type="button" onclick="alert('Hello World')" value="인라인 방식" data-genuitec-lp-enabled="false" data-genuitec-file-id="wc1-7" data-genuitec-path="/Javascript/WebContent/Ex_00_000.jsp">

<!-- 스크립트 태그 안에 코드를 넣어 ID값을 준 태그에서 일어난 이벤트를 처리하는 방식

	스크립트 방식

 -->

<input type="button" id="script" value="스크립트 방식">
<script type="text/javascript">
	var hw = document.getElementById('script');
	hw.addEventListener('click', function(){
		alert("Hello World");
	})
</script>

<!-- 외부파일을 가져 오는 형태 
	
	주의사항
	Html을 위에서 부터 순차적으로 읽어오면서 처리 하는 방식이 때문에
	외부에서 불어오는 형태의 경우, 하단에 처리를 해 놓는 방식이 좋다
-->
<input type="button" id="button" value="외부 삽입">

</body>
<script type="text/javascript" src="button.js"></script>
</html>


