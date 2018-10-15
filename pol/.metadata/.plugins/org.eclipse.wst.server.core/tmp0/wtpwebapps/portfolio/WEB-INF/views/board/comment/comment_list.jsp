<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
    
<c:forEach items="${list }" var="vo" varStatus="status">
${status.index == 0 ? '<hr>' : ''}  
<div>${vo.name } [ <fmt:formatDate value="${vo.writedate }" 
						pattern="yyyy-MM-dd hh:mm:ss" /> ]</div>
<div id="original_${vo.id }">${fn:replace(vo.content, lf, '<br>') }</div>
<div id="modify_${vo.id }" style="display: none;"></div>
<!-- 로그인한 사용자가 작성한 댓글인 경우 수정,삭제 권한 가짐 -->
<c:if test="${login_info.userid eq vo.userid }">
	<div class="right">
	<input onclick="modify_save( ${vo.id } )" type="button" value="수정" id="btn_modify_save_${vo.id }"/>
	<input onclick="delete_cancel( ${vo.id} )" type="button" value="삭제" id="btn_delete_cancel_${vo.id }"/>
	</div>
</c:if>
<hr>
</c:forEach>
<script type="text/javascript" data-genuitec-lp-enabled="false" data-genuitec-file-id="wc1-15" data-genuitec-path="/portfolio/src/main/webapp/WEB-INF/views/board/comment/comment_list.jsp">
function delete_cancel( id ){
	//취소 버튼
	if(  $('#btn_delete_cancel_'+id).attr('value') == '취소' )
		display_mode(id);
	else{
	//삭제 버튼
		if( confirm('정말 삭제하시겠습니까?') ){
			$.ajax({
				url: 'board/comment/delete/'+id,
				success: function(){
					comment_list();
				},
				error: function(req, status){
					alert(status+": "+req.status);
				}
			});
		}
	}
}
function display_mode( id ){
	//수정, 삭제 버튼
	$('#btn_modify_save_'+id).attr('value', '수정');
	$('#btn_delete_cancel_'+id).attr('value', '삭제');
	//원래 댓글 보이고, 변경댓글 안 보이게
	$('#original_'+id).css('display', 'block');
	$('#modify_'+id).css('display', 'none');
}
function modify_save( id ){
	//수정버튼
	if( $('#btn_modify_save_'+id).attr('value') == '수정' ){
		var tag = "<textarea id='modify_editor' style='width:500px; height:50px;'>";
		tag += $('#original_' + id).html().replace(/<br>/g, '\n') + "</textarea>";
		$('#modify_'+id).html(tag);
		modify_mode(id);
	}else{
	//저장버튼
		//변경입력한 댓글을 DB에 저장한 후 다시 조회해온다.
		var comment = new Object();
		comment.id = id;
		comment.content = $('#modify_editor').val();
		
		$.ajax({
			type:'post',
			url: 'board/comment/update',
			data: JSON.stringify(comment),
			contentType: 'application/json; charset=utf-8',
			success: function( data ){
				alert( "댓글변경 "+ data);
				comment_list();
			},
			error: function(req, status){
				alert( status+": "+req.status);
			}
		});
		display_mode(id);
	}
}
function modify_mode(id){
	//저장,취소버튼
	$('#btn_modify_save_'+id).attr('value', '저장' );
	$('#btn_delete_cancel_'+id).attr('value', '취소' );
	//원래 댓글은 안보이고, 변경댓글이 보이게
	$('#original_'+id).css('display', 'none');
	$('#modify_'+id).css('display', 'block');
}

</script>






