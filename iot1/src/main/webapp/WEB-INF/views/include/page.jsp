<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%> 
<style type="text/css">
.page_list { float: left; width: 100%; }
.page_on, .page_off{
	display: inline-block; width: 30px; line-height: 28px; 
}
.page_on {
	border: 1px gray solid; font-weight: bold; color: #fff; 
	background: gray;
}
.page_off:hover{ text-decoration: none;
}
.page_next, .page_last, .page_first, .page_prev {
	display: inline-block; width: 30px; 
	line-height: 28px; 
	border:  1px solid #d0d0d0;
	text-indent: -9999px;
}
.page_next { background: url('img/page_next.jpg') center no-repeat; }
.page_last { background: url('img/page_last.jpg') center no-repeat; }
.page_first { background: url('img/page_first.jpg') center no-repeat; }
.page_prev { background: url('img/page_prev.jpg') center no-repeat; }

</style>

<p class="page_list">

<!-- 이전블럭버튼: 이전블럭의 마지막페이지: page.beginPage-1
                     이전블럭의 첫페이지: page.beginPage-page.blockPage -->
<c:if test="${page.curBlock gt 1 }">
<a class="page_first" onclick="go_page(1)">첫페이지</a><a 
class="page_prev" onclick="go_page(${page.beginPage-page.blockPage})">이전블럭</a>
<%-- class="page_prev" onclick="go_page(${page.beginPage-1})">이전블럭</a> --%>
</c:if>


<c:forEach var="i" begin="${page.beginPage }" end="${page.endPage }">
	<c:if test="${i eq page.curPage }">
 		<span class="page_on">${i }</span>
 	</c:if>
 	
	<c:if test="${i ne page.curPage }">
 		<a class="page_off" onclick="go_page(${i})">${i }</a>
 	</c:if>
</c:forEach>

<!-- 다음블럭버튼: 다음블럭첫페이지 -->
<c:if test="${page.curBlock lt page.totalBlock }">
<a class="page_next" onclick="go_page(${page.endPage+1})">다음</a><a 
class="page_last" onclick="go_page(${page.totalPage})">마지막페이지</a>
</c:if>

</p>
<script type="text/javascript">
function go_page(page){
	$('#curPage').val(page);
	$('#list').submit();
}
</script>
