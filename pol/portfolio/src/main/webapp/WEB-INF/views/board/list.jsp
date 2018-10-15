<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
#list-top {
	width: 70%;
	padding-left: 15%;
	padding-bottom: 20px;
}
</style>
</head>
<body>
	<div class="container-fluid text-center">
		<div class="row content">
			<div class="col-sm-2">
				<div class="panel panel-default">
					<div class="panel-heading">게시판</div>
					<div class="panel-body">공지사항</div>
				</div>
			</div>
			<div class="col-sm-8 text-left">
				<h3>게시글 목록</h3>

				<table class="table">
					<tr>
						<th width="50px">번호</th>
						<th style="text-align: center;">제목</th>
						<th width="100px">작성일자</th>
						<th width="100px">첨부파일</th>
					</tr>
					<c:forEach items="${page.list }" var="vo">
						<tr>
							<td>${vo.no }</td>
							<td class="left" onclick="go_detail(${vo.id})">${vo.title }</td>
							<td>${vo.writedate }</td>
							<td>${ empty vo.filename ? '' : '<span class="glyphicon glyphicon-file"></span>' }</td>
						</tr>
					</c:forEach>
				</table>
				
				<span style="float: left; margin-left: 30%">
						 <select name="search">
								<option ${page.search eq 'all' ? 'selected' : '' } value="all">전체</option>
								<option ${page.search eq 'title' ? 'selected' : '' }
									value="title">제목</option>
								<option ${page.search eq 'content' ? 'selected' : '' }
									value="content">내용</option>
								<option ${page.search eq 'writer' ? 'selected' : '' }
									value="writer">작성자</option>
						</select> <input type="text" name="keyword" value="${page.keyword }"
							style="width: 350px; vertical-align: top;" /> <a
							class="btn btn-success btn-sm" onclick="$('form').submit()">검색</a>
							<c:if test="${!empty login_info }">
							<a class="btn btn-success btn-sm" style="float: right;"
								onclick="location='new.bo'">글쓰기</a>
						</c:if>
						</span>
						<form method="post" action="list.bo" id="list">
					<p id="list-top">
						
						

					</p>
					<input type="hidden" name="id" /> <input type="hidden"
						name="curPage" id="curPage" />
				</form>
						
				<br>
				<jsp:include page="/WEB-INF/views/board/page.jsp" />

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
</body>
<script type="text/javascript">
	function go_detail(id) {
		$('[name=id]').val(id);
		$('form').attr('action', 'detail.bo');
		$('form').submit();
	}
</script>
</html>