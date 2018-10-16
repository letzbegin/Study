<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<h3>게시글 작성</h3>
<form method="post" action="insert.bo" enctype="multipart/form-data">
<table border="1" width="70%">
<tr><th width="20%">제목</th>
	<td><input class="need" title="제목" style="width: 98.5%" 
					type="text" name="title"/></td>
</tr>
<tr><th>작성자</th>
	<td class="left">${ login_info.name }</td>
</tr>
<tr><th>내용</th>
	<td><textarea title="내용" class="need" name="content" 
		style="height:200px; width: 99%"></textarea></td>
</tr>
<tr><th>첨부파일</th>
	<td class="left"><input type="file" name="file"/> </td>
</tr>
</table><br>
<a  class="btn btn-success"
		onclick="if( necessary() ) { $('form').submit() }">저장</a>
<a  class="btn btn-success" onclick="location='list.bo'">취소</a>

</form>
<script type="text/javascript" src="js/need_check.js"></script>


</body>
</html>