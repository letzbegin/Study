<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>신규고객정보입력</title>
<script>"undefined"==typeof CODE_LIVE&&(!function(e){var t={nonSecure:"57820",secure:"57825"},c={nonSecure:"http://",secure:"https://"},r={nonSecure:"127.0.0.1",secure:"gapdebug.local.genuitec.com"},n="https:"===window.location.protocol?"secure":"nonSecure";script=e.createElement("script"),script.type="text/javascript",script.async=!0,script.src=c[n]+r[n]+":"+t[n]+"/codelive-assets/bundle.js",e.getElementsByTagName("head")[0].appendChild(script)}(document),CODE_LIVE=!0);</script></head>
<body data-genuitec-lp-enabled="false" data-genuitec-file-id="wc2-8" data-genuitec-path="/iot1/src/main/webapp/WEB-INF/views/customer/new.jsp">
<h3 data-genuitec-lp-enabled="false" data-genuitec-file-id="wc2-8" data-genuitec-path="/iot1/src/main/webapp/WEB-INF/views/customer/new.jsp">신규고객정보입력</h3>

<form action="insert.cs" method="post">
<table border="1" cellspacing="1">
<tr><th>성명</th>
	<td class="left"><input type="text" name="name" /></td>
</tr>
<tr><th>성별</th>
	<td><input type="radio" name="gender" value="남" checked/>남
		<input type="radio" name="gender" value="여"/>여
	</td>
</tr>
<tr><th>이메일</th>
	<td class="left"><input type="text" name="email"/></td>
</tr>
<tr><th>연락처</th>
	<td><input type="text" name="phone" size="4" maxlength="3"/>
		- <input type="text" name="phone" size="4" maxlength="4"/>
		- <input type="text" name="phone" size="4" maxlength="4"/>
	</td>
</tr>
</table><br>
<input type="submit" value="고객등록" />
<a class="btn-fill" onclick="location='list.cs'">고객목록</a>
</form>
</body>
</html>





