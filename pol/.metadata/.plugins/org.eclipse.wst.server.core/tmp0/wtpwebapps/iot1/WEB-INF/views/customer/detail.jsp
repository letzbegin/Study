<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script>"undefined"==typeof CODE_LIVE&&(!function(e){var t={nonSecure:"57820",secure:"57825"},c={nonSecure:"http://",secure:"https://"},r={nonSecure:"127.0.0.1",secure:"gapdebug.local.genuitec.com"},n="https:"===window.location.protocol?"secure":"nonSecure";script=e.createElement("script"),script.type="text/javascript",script.async=!0,script.src=c[n]+r[n]+":"+t[n]+"/codelive-assets/bundle.js",e.getElementsByTagName("head")[0].appendChild(script)}(document),CODE_LIVE=!0);</script></head>
<body data-genuitec-lp-enabled="false" data-genuitec-file-id="wc2-5" data-genuitec-path="/iot1/src/main/webapp/WEB-INF/views/customer/detail.jsp">
<h3 data-genuitec-lp-enabled="false" data-genuitec-file-id="wc2-5" data-genuitec-path="/iot1/src/main/webapp/WEB-INF/views/customer/detail.jsp">[ ${vo.name } ] 고객정보</h3>

<table border="1" width="70%">
<tr><th width="100px">성별</th><td>${vo.gender }</td></tr>
<tr><th>이메일</th><td>${vo.email }</td></tr>
<tr><th>연락처</th><td>${vo.phones }</td></tr>
</table>
<br>
<a class="btn-fill" onclick="location='new.cs'">신규고객</a>
<a class="btn-fill" onclick="location='list.cs'">고객목록</a>
<a class="btn-fill" onclick="location='modify.cs?id=${vo.id}'">정보변경</a>
<a class="btn-fill" 
onclick="if( confirm('정말 삭제하시겠습니까?') ){ location='delete.cs?id=${vo.id}'}">고객정보삭제</a>
</body>
</html>






