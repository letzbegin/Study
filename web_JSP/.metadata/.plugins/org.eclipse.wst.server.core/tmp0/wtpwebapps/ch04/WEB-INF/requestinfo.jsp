<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script>"undefined"==typeof CODE_LIVE&&(!function(e){var t={nonSecure:"2827",secure:"2836"},c={nonSecure:"http://",secure:"https://"},r={nonSecure:"127.0.0.1",secure:"gapdebug.local.genuitec.com"},n="https:"===window.location.protocol?"secure":"nonSecure";script=e.createElement("script"),script.type="text/javascript",script.async=!0,script.src=c[n]+r[n]+":"+t[n]+"/codelive-assets/bundle.js",e.getElementsByTagName("head")[0].appendChild(script)}(document),CODE_LIVE=!0);</script></head>
<body data-genuitec-lp-enabled="false" data-genuitec-file-id="wc3-0" data-genuitec-path="/ch04/WebContent/WEB-INF/requestinfo.jsp">
클라이언트IP = <%= request.getRemoteAddr() %>
요청정보 길이 = <%= request.getContentLength() %>
요청정보 인코딩 = <%= request.getCharacterEncoding() %>
요청정보 컨텐츠 타입 <%= request.getContentType() %>
요청정보 프로토콜 = <%= request.getProtocol() %>
요청정보 전송방식 = <%= request.getMethod() %>
<!--아래 두개는 사용이 됨  -->
요청 URI = <%= request.getRequestURI() %>
컨텍스트 경로 = <%= request.getContextPath() %>
</body>
</html>