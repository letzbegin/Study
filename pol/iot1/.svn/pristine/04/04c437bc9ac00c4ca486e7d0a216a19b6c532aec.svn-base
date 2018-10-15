<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>    
<style>
#header {
	width: 900px;
	height: 50px;
	margin:	0 auto; 
}
#header > * {float: left;}
#header ul li { 
	display: inline; padding-left: 60px; }
.category { 
	font-weight: bold;
	color: red;  
}	
</style>    
<div id="header">
	<a onclick="location='index'"><img src="img/hanul.logo.png" alt="로고"/></a>
	<ul>
		<li><a class="${category eq 'cs' ? 'category' : ''}" onclick="location='list.cs'">고객관리</a></li>
		<li><a class="${category eq 'no' ? 'category' : ''}" onclick="location='list.no'">공지사항</a></li>
		<li><a class="${category eq 'bo' ? 'category' : ''}" onclick="location='list.bo'">게시글</a></li>
		<li><a class="${category eq 'pu' ? 'category' : ''}" 
				onclick="location='list.pu'">공공데이터</a></li>
	</ul>
<!-- 로그인한 경우: 사용자정보, 로그아웃버튼 -->
	<c:if test="${!empty login_info }">
	<p style="float: right;">
		${login_info.userid } [ ${ login_info.name } ]
		<a class="btn-fill" onclick="go_logout()">로그아웃</a>
	</p>
	</c:if>
<!-- 로그인하지 않은 경우: 아이디/비번 입력항목, 로그인/회원가입버튼 -->
	<c:if test="${empty login_info }">
	<p style="float: right;">
		<a class="btn-fill" onclick="go_login()">로그인</a>
		<a class="btn-fill" onclick="location='member'">회원가입</a>
	</p>
	<span style="width:120px; float: right;">
		<input type="text" style="width: 100px; height: 18px;"
				id="userid" placeholder="아이디"/>
		<input type="password" style="width: 100px; height: 18px;"
			onkeypress="if( event.keyCode==13) go_login()"	id="userpwd" placeholder="비밀번호"/>
	</span>
	</c:if>
</div>
<script type="text/javascript">
function go_logout(){
	$.ajax({
		type:'post',
		url: 'logout',
		success: function(){
			location.reload();
		},
		error: function(req){
			alert( req.status+": "+req.responseText);
		}
	});
}

function go_login(){
	$.ajax({
		type: 'post',
		url: 'login',
		data: { userid: $('#userid').val(), 
				userpwd: $('#userpwd').val() },
		success: function(data){
			if( data=="fail"){
				alert("아이디나 비밀번호가 일치하지 않습니다!");
				$('#userid').val('');
				$('#userpwd').val('');
			}else
				location.reload();
		},
		error: function(req, textStatus, err){
			alert( textStatus + "("+ req.status+") : "+err );
		}
	});
}
</script>
<hr>
    