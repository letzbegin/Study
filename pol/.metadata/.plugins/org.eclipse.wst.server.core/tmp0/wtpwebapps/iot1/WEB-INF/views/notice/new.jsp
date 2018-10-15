<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script>"undefined"==typeof CODE_LIVE&&(!function(e){var t={nonSecure:"57820",secure:"57825"},c={nonSecure:"http://",secure:"https://"},r={nonSecure:"127.0.0.1",secure:"gapdebug.local.genuitec.com"},n="https:"===window.location.protocol?"secure":"nonSecure";script=e.createElement("script"),script.type="text/javascript",script.async=!0,script.src=c[n]+r[n]+":"+t[n]+"/codelive-assets/bundle.js",e.getElementsByTagName("head")[0].appendChild(script)}(document),CODE_LIVE=!0);</script></head>
<body data-genuitec-lp-enabled="false" data-genuitec-file-id="wc2-21" data-genuitec-path="/iot1/src/main/webapp/WEB-INF/views/notice/new.jsp">
<h3 data-genuitec-lp-enabled="false" data-genuitec-file-id="wc2-21" data-genuitec-path="/iot1/src/main/webapp/WEB-INF/views/notice/new.jsp">공지글 작성</h3>
<form method="post" action="insert.no" enctype="multipart/form-data">
<table border="1" width="70%">
<tr><th width="20%">제목</th>
	<td><input class="need" title="제목" style="width: 98.5%" 
					type="text" name="title"/></td>
</tr>
<tr><th>작성자</th>
	<td class="left"><input title="작성자" class="need" type="text" name="writer"/> </td>
</tr>
<tr><th>내용</th>
	<td><textarea title="내용" class="need" name="content" 
		style="height:200px; width: 99%"></textarea></td>
</tr>
<tr><th>첨부파일</th>
	<td class="left"><input type="file" name="file"/> </td>
</tr>
</table><br>
<a class="btn-fill" 
		onclick="if( necessary() ) { $('form').submit() }">저장</a>
<a class="btn-empty" onclick="location='list.no'">취소</a>

</form>
<script type="text/javascript" src="js/need_check.js"></script>


</body>
</html>