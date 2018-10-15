<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script>"undefined"==typeof CODE_LIVE&&(!function(e){var t={nonSecure:"57820",secure:"57825"},c={nonSecure:"http://",secure:"https://"},r={nonSecure:"127.0.0.1",secure:"gapdebug.local.genuitec.com"},n="https:"===window.location.protocol?"secure":"nonSecure";script=e.createElement("script"),script.type="text/javascript",script.async=!0,script.src=c[n]+r[n]+":"+t[n]+"/codelive-assets/bundle.js",e.getElementsByTagName("head")[0].appendChild(script)}(document),CODE_LIVE=!0);</script></head>
<body data-genuitec-lp-enabled="false" data-genuitec-file-id="wc2-18" data-genuitec-path="/iot1/src/main/webapp/WEB-INF/views/notice/detail.jsp">
<h3 data-genuitec-lp-enabled="false" data-genuitec-file-id="wc2-18" data-genuitec-path="/iot1/src/main/webapp/WEB-INF/views/notice/detail.jsp">공지사항 안내</h3>
<table border="1" width="70%">
<tr><th width="15%">제목</th>
	<td class="left" colspan="5">${vo.title }</td>
</tr>
<tr><th>작성자</th>
	<td>${vo.writer }</td>
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
	<input onclick="location='download.no?id=${vo.id}'" type="button" value="다운로드"/>
	</c:if>
	</td>
</tr>
</table><br>

<a class="btn-fill" onclick="location='reply.no?id=${vo.id}'">답글작성</a>

<!-- 관리자로 로그인한 경우만 수정,삭제의 권한을 갖는다. -->
<c:if test="${login_info.admin eq 'Y' }">
<a class="btn-fill" 
		onclick="location='modify.no?id=${vo.id}'">변경</a>
<a class="btn-fill" onclick="location='delete.no?id=${vo.id}'">삭제</a>
</c:if>

<a class="btn-fill" onclick="$('form').submit()">목록으로</a>
<!-- <a class="btn-fill" onclick="location='list.no'">목록으로</a> -->

<form method="post" action="list.no" id="detail">
	<input type="hidden" name="curPage" value="${page.curPage }"/>
	<input type="hidden" name="search" value="${page.search }"/>
	<input type="hidden" name="keyword" value="${page.keyword }"/>
</form>

</body>
</html>






