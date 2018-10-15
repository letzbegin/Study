<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script>"undefined"==typeof CODE_LIVE&&(!function(e){var t={nonSecure:"57820",secure:"57825"},c={nonSecure:"http://",secure:"https://"},r={nonSecure:"127.0.0.1",secure:"gapdebug.local.genuitec.com"},n="https:"===window.location.protocol?"secure":"nonSecure";script=e.createElement("script"),script.type="text/javascript",script.async=!0,script.src=c[n]+r[n]+":"+t[n]+"/codelive-assets/bundle.js",e.getElementsByTagName("head")[0].appendChild(script)}(document),CODE_LIVE=!0);</script></head>
<body data-genuitec-lp-enabled="false" data-genuitec-file-id="wc2-6" data-genuitec-path="/iot1/src/main/webapp/WEB-INF/views/customer/list.jsp">

<h3 data-genuitec-lp-enabled="false" data-genuitec-file-id="wc2-6" data-genuitec-path="/iot1/src/main/webapp/WEB-INF/views/customer/list.jsp">고객목록</h3>
<table border="1" >
<tr><th>번호</th><th>성명</th><th>이메일</th></tr>
<c:forEach items="${list }" var="vo">
<tr><td>${vo.no }</td>
	<td><a onclick="location='detail.cs?id=${vo.id}'">${vo.name }</a></td>
	<td>${vo.email }</td></tr>
</c:forEach>

</table>
<br>
<a class="btn-fill" onclick="location='new.cs'">신규고객등록</a>



</body>
</html>