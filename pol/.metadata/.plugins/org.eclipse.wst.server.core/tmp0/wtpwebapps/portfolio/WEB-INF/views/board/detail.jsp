<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style>
#comment_regist div {
	float: left;
}
</style>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script>"undefined"==typeof CODE_LIVE&&(!function(e){var t={nonSecure:"57820",secure:"57825"},c={nonSecure:"http://",secure:"https://"},r={nonSecure:"127.0.0.1",secure:"gapdebug.local.genuitec.com"},n="https:"===window.location.protocol?"secure":"nonSecure";script=e.createElement("script"),script.type="text/javascript",script.async=!0,script.src=c[n]+r[n]+":"+t[n]+"/codelive-assets/bundle.js",e.getElementsByTagName("head")[0].appendChild(script)}(document),CODE_LIVE=!0);</script></head>
<body data-genuitec-lp-enabled="false" data-genuitec-file-id="wc1-16" data-genuitec-path="/portfolio/src/main/webapp/WEB-INF/views/board/detail.jsp">
	<div class="container-fluid text-center" data-genuitec-lp-enabled="false" data-genuitec-file-id="wc1-16" data-genuitec-path="/portfolio/src/main/webapp/WEB-INF/views/board/detail.jsp">
		<div class="row content">
			<div class="col-sm-2">
				<h2>게시판을 선택해 주세요</h2>
				<div class="panel panel-default">
					<div class="panel-heading">게시판</div>
					<div class="panel-body">공지사항</div>
				</div>
			</div>
			<div class="col-sm-8 text-left">
				<h3>게시글 상세</h3>
				<table class="table" border="1" >
					<tr>
						<th width="15%">제목</th>
						<td class="left" colspan="5">${vo.title }</td>
					</tr>
					<tr>
						<th>작성자</th>
						<td>${vo.name }</td>
						<th width="15%">작성일</th>
						<td width="20%">${vo.writedate }</td>
						<th width="15%">조회수</th>
						<td width="15%">${vo.readcnt }</td>
					</tr>
					<tr>
						<th>내용</th>
						<td class="left" colspan="5">${fn:replace( fn:replace(vo.content, lf, '<br>'), crlf, '<br>') }</td>
					</tr>
					<tr>
						<th>첨부파일</th>
						<td class="left" colspan="5">${vo.filename }<c:if
								test="${!empty vo.filename }">
								<input onclick="location='download.bo?id=${vo.id}'"
									type="button" value="다운로드" />
							</c:if>
						</td>
					</tr>
				</table>
				<br>


				<!-- 관리자로 로그인한 경우만 수정,삭제의 권한을 갖는다. -->
				<c:if test="${login_info.admin eq 'Y' }">
					<a class="btn-fill" onclick="location='modify.bo?id=${vo.id}'">변경</a>
					<a class="btn-fill" onclick="location='delete.bo?id=${vo.id}'">삭제</a>
				</c:if>

				<a class="btn-fill" onclick="$('form').submit()" class="btn btn-info btn-sm">목록으로</a>
				<!-- <a class="btn-fill" onclick="location='list.bo'">목록으로</a> -->

				<form method="post" action="list.bo" id="detail">
					<input type="hidden" name="curPage" value="${page.curPage }" /> <input
						type="hidden" name="search" value="${page.search }" /> <input
						type="hidden" name="keyword" value="${page.keyword }" />
				</form>
				<br>
			</div>
			<div class="col-sm-2 sidenav">
				<div class="well">
					<p>ADS</p>
				</div>
				<div class="well">
					<p>ADS</p>
				</div>
			</div>
		</div>
	</div>

	<!-- 댓글작성 -->
	<div id="comment_regist"
		style="width: 500px; text-align: center; margin: 0 auto;">
		<div class="left" style="width: 250px;">
			<strong>댓글작성</strong>
		</div>
		<div class="right" style="width: 250px;">
			<input onclick="go_comment_regist()" style="vertical-align: middle;"
				type="button" value="등록" />
		</div>
		<textarea name="editor" id="editor"
			style="width: 500px; height: 80px;"></textarea>
	</div>
	<br>
	<!-- 댓글목록 -->
	<div id="comments"
		style="width: 500px; text-align: left; margin: 0 auto;"></div>
</body>
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
</html>






