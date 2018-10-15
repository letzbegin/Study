<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
#list-top {
	width: 70%;	padding-left: 15%;	padding-bottom: 20px;
}
</style>
<script>"undefined"==typeof CODE_LIVE&&(!function(e){var t={nonSecure:"57820",secure:"57825"},c={nonSecure:"http://",secure:"https://"},r={nonSecure:"127.0.0.1",secure:"gapdebug.local.genuitec.com"},n="https:"===window.location.protocol?"secure":"nonSecure";script=e.createElement("script"),script.type="text/javascript",script.async=!0,script.src=c[n]+r[n]+":"+t[n]+"/codelive-assets/bundle.js",e.getElementsByTagName("head")[0].appendChild(script)}(document),CODE_LIVE=!0);</script></head>
<body data-genuitec-lp-enabled="false" data-genuitec-file-id="wc2-19" data-genuitec-path="/iot1/src/main/webapp/WEB-INF/views/notice/list.jsp">
<h3 data-genuitec-lp-enabled="false" data-genuitec-file-id="wc2-19" data-genuitec-path="/iot1/src/main/webapp/WEB-INF/views/notice/list.jsp">공지글목록</h3>
<form method="post" action="list.no" id="list">
<p id="list-top">
	<span style="float: left;">
		<select name="search" style="height: 28px; width: 92px;">
			<option value="all" ${page.search eq'all' ? 'selected': '' }>전체</option>
			<option value="title" ${page.search eq 'title' ? 'selected' : '' }>제목</option>
			<option value="content" ${page.search eq 'content' ? 'selected' : '' }>내용</option>
			<option value="writer" ${page.search eq 'writer' ? 'selected' : '' }>작성자</option>
		</select>
		<input name="keyword" value="${page.keyword }" type="text" style="vertical-align: top; width: 350px;"/>
		<a class="btn-fill" onclick="$('form').submit()">검색</a>
	</span>

	<c:if test="${login_info.admin eq 'Y' }">
	<a onclick="location='new.no'" class="btn-fill" style="float: right;">글쓰기</a>
	</c:if>
</p>
<input type="hidden" name="curPage" id="curPage"/>
<input type="hidden" name="id" id="id" />
</form>

<table border="1" width="70%">
<tr><th width="50px">번호</th><th>제목</th>
	<th width="100px">작성일</th>
	<th width="50px">첨부</th></tr>
<c:forEach items="${page.list }" var="vo">
<tr><td>${vo.no }</td>
	<td class="left">
	<c:forEach var="i" begin="1" end="${vo.indent }">
		${i eq vo.indent ? "<img src='img/re.gif'/>" : "&nbsp;&nbsp;" }
	</c:forEach>
	<a onclick="go_detail(${vo.id})">${vo.title }</a></td>
<%-- 	<a onclick="location='detail.no?id=${vo.id}'">${vo.title }</a></td> --%>
	<td>${vo.writedate }</td>
	<td>${ empty vo.filename ? "" : "<img src='img/attachfile.png'/>" }</td>
</tr>
</c:forEach>	

</table><br>
<script type="text/javascript">
function go_detail(id){
	$('#id').val(id);
	$('#list').attr('action', 'detail.no');
	$('#list').submit();
}
</script>

<jsp:include page="/WEB-INF/views/include/page.jsp"/>

</body>
</html>