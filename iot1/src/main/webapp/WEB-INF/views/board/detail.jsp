<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<h3>게시글 상세</h3>
<table border="1" width="70%">
<tr><th width="15%">제목</th>
	<td class="left" colspan="5">${vo.title }</td>
</tr>
<tr><th>작성자</th>
	<td>${vo.name }</td>
	<th width="15%">작성일</th>
	<td width="20%">${vo.writedate }</td>
	<th width="15%">조회수</th>
	<td width="15%">${vo.readcnt }</td>
</tr>
<tr><th>내용</th>
	<td class="left" 
	colspan="5">${fn:replace( fn:replace(vo.content, lf, '<br>'), crlf, '<br>') }</td>
</tr>
<tr><th>첨부파일</th>
	<td class="left"  colspan="5">
	${vo.filename }
	<c:if test="${!empty vo.filename }">
	<input onclick="location='download.bo?id=${vo.id}'" type="button" value="다운로드"/>
	</c:if>
	</td>
</tr>
</table><br>


<!-- 관리자로 로그인한 경우만 수정,삭제의 권한을 갖는다. -->
<c:if test="${login_info.admin eq 'Y' }">
<a class="btn-fill" 
		onclick="location='modify.bo?id=${vo.id}'">변경</a>
<a class="btn-fill" onclick="location='delete.bo?id=${vo.id}'">삭제</a>
</c:if>

<a class="btn-fill" onclick="$('form').submit()">목록으로</a>
<!-- <a class="btn-fill" onclick="location='list.bo'">목록으로</a> -->

<form method="post" action="list.bo" id="detail">
	<input type="hidden" name="curPage" value="${page.curPage }"/>
	<input type="hidden" name="search" value="${page.search }"/>
	<input type="hidden" name="keyword" value="${page.keyword }"/>
</form>

<br>

<!-- 댓글작성 -->
<div id="comment_regist" style="width: 500px; text-align: center; margin: 0 auto;">
	<div class="left" style="width: 250px; "><strong>댓글작성</strong></div>
	<div class="right" style="width: 250px;">
		<input onclick="go_comment_regist()" style="vertical-align: middle;" type="button" value="등록"/>		
	</div>
	<textarea name="editor" id="editor" style="width: 500px; height: 80px;"></textarea>
</div><br>
<!-- 댓글목록 -->
<div id="comments" 
	style="width: 500px; text-align: left; margin: 0 auto;"></div>
<script type="text/javascript">
$(function(){
	comment_list();
});

function comment_list(){
	$.ajax({
		url: 'board/comment/${vo.id}',
// 		url: 'list.no',
		success: function( data ){
			$('#comments').html(data);
		},
		error: function(req, status){
			alert(status+": "+req.status);			
		}
	});
}

function go_comment_regist(){
	//로그인하지 않은 경우 로그인하도록
	if( ${empty login_info} ){
		alert("댓글을 등록하려면 로그인 하세요!");
		$('#userid').focus();
		return;
	}
	if( $.trim($('#editor').val()) =='' ){
		alert('댓글을 입력하세요!');
		$('#editor').val('');
		$('#editor').focus();
		return;
	}
	
	$.ajax({
		type: 'post',
		url: 'board/comment/insert',
		data: { content: $('#editor').val(), pid: ${vo.id} },
		success: function(data){
			if( data=="true"){
				$('#editor').val('');
				alert("댓글이 등록되었습니다");
				comment_list();
			}else{
				alert("댓글 등록 실패!");
			}
		},
		error: function(req, status, err){
			alert( status +": " +req.responseText+", "+err);
		}
	});
}
</script>
<style>
#comment_regist div{ float: left; }
</style>


</body>
</html>






