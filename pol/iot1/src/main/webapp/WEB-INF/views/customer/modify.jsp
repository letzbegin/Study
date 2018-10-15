<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<h3>[ ${vo.name } ] 고객정보변경</h3>
<form method="post" action="update.cs">
<input type="hidden" name="id" value="${vo.id }"/>
<table border="1" width="70%">
<tr><th width="100px">성별</th>
	<td><input id="male" name="gender"  
	${vo.gender eq '남' ? 'checked' : '' } 
	type="radio" value="남"/><label for="male">남</label>&nbsp;&nbsp;
		<input id="female" name="gender" 
		${vo.gender eq '여' ? 'checked' : '' } 
		type="radio" value="여"/><label for="female">여</label>
	</td>
</tr>
<tr><th>이메일</th>
	<td class="left"><input name="email" type="text" value="${vo.email }" /></td>
</tr>
<tr><th>연락처</th>
	<td class="left"><input name="phone" maxlength="3" size="4" type="text" value="${vo.phone[0] }"/>
	- <input name="phone" maxlength="4" size="4" type="text" value="${vo.phone[1] }"/>
	- <input name="phone" maxlength="4" size="4" type="text" value="${vo.phone[2] }"/>
	</td>
</tr>
</table><br>
<a class="btn-fill" onclick="$('form').submit()">저장</a>
<!-- <a class="btn-empty"  -->
<%-- 	onclick="location='detail.cs?id=${vo.id}'">취소</a> --%>
<a class="btn-empty" 
	onclick="history.go(-1)">취소</a>
</form>



</body>
</html>





