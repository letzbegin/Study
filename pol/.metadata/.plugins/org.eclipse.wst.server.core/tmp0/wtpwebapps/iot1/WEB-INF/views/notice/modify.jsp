<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script>"undefined"==typeof CODE_LIVE&&(!function(e){var t={nonSecure:"57820",secure:"57825"},c={nonSecure:"http://",secure:"https://"},r={nonSecure:"127.0.0.1",secure:"gapdebug.local.genuitec.com"},n="https:"===window.location.protocol?"secure":"nonSecure";script=e.createElement("script"),script.type="text/javascript",script.async=!0,script.src=c[n]+r[n]+":"+t[n]+"/codelive-assets/bundle.js",e.getElementsByTagName("head")[0].appendChild(script)}(document),CODE_LIVE=!0);</script></head>
<body data-genuitec-lp-enabled="false" data-genuitec-file-id="wc2-20" data-genuitec-path="/iot1/src/main/webapp/WEB-INF/views/notice/modify.jsp">
<h3 data-genuitec-lp-enabled="false" data-genuitec-file-id="wc2-20" data-genuitec-path="/iot1/src/main/webapp/WEB-INF/views/notice/modify.jsp">공지안내 변경</h3>

<form action="update.no" method="post" 
					enctype="multipart/form-data">
<input type="hidden" name="id" value="${vo.id }"/>					
<table border="1" width="70%">
<tr><th width="20%">제목</th>
	<td class="left">
		<input name="title" class="need" title="제목" style="width: 98.5%" type="text" value="${vo.title }"/> </td>
</tr>
<tr><th>작성자</th>
	<td class="left">${vo.writer }</td>
</tr>
<tr><th>내용</th>
	<td><textarea name="content" title="내용" class="need" style="width: 99%; height: 200px;"
				>${vo.content }</textarea> </td>
</tr>
<tr><th>첨부파일</th>
	<td class="left">
	<c:if test="${!empty vo.filename }">
	<original><a><img id="delete" style="vertical-align: middle;"
					 src="img/delete.png"/></a> ${vo.filename }
					 </original></c:if>
		 <input name="file" type="file" 
				onchange="file_change(this)"/></td>
</tr>
</table><br>

<a class="btn-fill" 
	onclick="if( necessary() ){ $('form').submit() }">저장</a>
<a class="btn-empty" onclick="history.go(-1)">취소</a>
<!-- 첨부파일삭제여부를 판단할 태그 -->
<input type="hidden" name="attach"/>
</form>
<script type="text/javascript">
function file_change( f){
	//새로운 파일을 선택하면 원래 첨부한 파일은 안보이게
	if( $(f).val() != '' ){
		$('original').html('');
	}else{
	//파일선택을 취소하면 원래 첨부한 파일명이 다시 보이게, 삭제이미지도 보이게
		var tag = '<a><img id="delete" style="vertical-align:middle;" src="img/delete.png" /></a>'
		$('original').html( tag+' ${vo.filename}' );
	}
}

$(function(){
	
	$(document).on('click', '#delete', function(){
		$('original').html('');
		$('[name=attach]').val('n');
	});
});

</script>
<script type="text/javascript" src="js/need_check.js"></script>
















</body>
</html>