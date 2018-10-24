<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<style type="text/css">
.rolling_panel {
	position: relative;
	width: 400px;
	height: 100px;
	margin: 0 auto;
	padding: 0;
	overflow: hidden;
}

.rolling_panel ul {
	position: absolute;
	margin: 5px;
	padding: 0;
	list-style: none;
}

.rolling_panel ul li {
	float: left;
	width: 400px;
	height: 100px;
}
</style>

<body>
	<nav class="navbar navbar-default navbar-fixed-top">
		<div class="container">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse"
					data-target="#myNavbar">
					<span class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="home">어서오세약</a>
			</div>
			<div class="collapse navbar-collapse" id="myNavbar">
				<ul class="nav navbar-nav navbar-right">
					<li><a href="search">검색</a></li>
					<li><a href="pillnon">의약품정보</a></li>
					<li><a href="list.bo">게시판</a></li>
					<li><a href="guide">사용가이드</a></li>
					<li><a href="http://localhost:8980/">WebRTC</a></li>
					<li>	
						<c:if test="${!empty login_info }">
						<a id="login_tl" href="" onclick="go_logout()">${login_info.name }</a>
						</c:if>
						<c:if test="${empty login_info }">
							<a id="login_tl" data-toggle="modal" href=""
								data-target="#myModal">로그인</a>
							<!-- Modal -->
							<div class="modal fade" id="myModal" role="dialog">
								<div class="modal-dialog">
									<!-- Modal content-->
									<div class="modal-content">
										<div class="modal-header">
											<button type="button" class="close" data-dismiss="modal">&times;</button>
											<h4 class="modal-title">아이디와 비밀번호를 입력해 주세요</h4>
										</div>
										<div class="modal-body">
											<div class="input-group">
												<span class="input-group-addon"><i
													class="glyphicon glyphicon-user"></i></span> <input id="userid"
													type="text" class="form-control" name="userid"
													placeholder="아이디">
											</div>
											<div class="input-group">
												<span class="input-group-addon"><i
													class="glyphicon glyphicon-lock"></i></span> <input id="userpwd"
													type="password" class="form-control" name="userpwd"
													placeholder="비밀번호">
											</div>
										</div>
										<div class="modal-footer">
											<button type="button" class="btn btn-default"
												data-dismiss="modal" onclick="location='member'">가입하기</button>
											<button type="button" class="btn btn-default"
												data-dismiss="modal" onclick="go_Login()">로그인</button>
											<button type="button" class="btn btn-default"
												data-dismiss="modal">취소</button>
										</div>
									</div>
								</div>
							</div>
						</c:if></li>
				</ul>
			</div>
		</div>
	</nav>

	<div class="jumbotron text-center"
		style="margin-bottom: 0; padding: 0;">
		<br> <br>
		<div class="rolling_panel">

			<ul>
				<li><h2>공지사항입니다1</h2></li>
				<li><h2>공지사항입니다2</h2></li>
				<li><h2>공지사항입니다3</h2></li>
				<li><h2>공지사항입니다4</h2></li>
			</ul>
		</div>
		<a href="javascript:void(0)" id="prev"><span
			class="glyphicon glyphicon-triangle-left"></span></a> <a
			href="javascript:void(0)" id="next"><span
			class="glyphicon glyphicon-triangle-right"></span></a>
	</div>

</body>
<script type="text/javascript">
	$(document).ready(function() {

		var $panel = $(".rolling_panel").find("ul");

		var itemWidth = $panel.children().outerWidth(); // 아이템 가로 길이
		var itemLength = $panel.children().length; // 아이템 수

		// Auto 롤링 아이디
		var rollingId;

		auto();

		// 배너 마우스 오버 이벤트
		$panel.mouseover(function() {
			clearInterval(rollingId);
		});

		// 배너 마우스 아웃 이벤트
		$panel.mouseout(function() {
			auto();
		});

		// 이전 이벤트
		$("#prev").on("click", prev);

		$("#prev").mouseover(function(e) {
			clearInterval(rollingId);
		});

		$("#prev").mouseout(auto);

		// 다음 이벤트
		$("#next").on("click", next);

		$("#next").mouseover(function(e) {
			clearInterval(rollingId);
		});

		$("#next").mouseout(auto);

		function auto() {

			// 2초마다 start 호출
			rollingId = setInterval(function() {
				start();
			}, 2000);
		}

		function start() {
			$panel.css("width", itemWidth * itemLength);
			$panel.animate({
				"left" : -itemWidth + "px"
			}, function() {

				// 첫번째 아이템을 마지막에 추가하기
				$(this).append("<li>" + $(this).find("li:first").html() + "</li>");

				// 첫번째 아이템을 삭제하기
				$(this).find("li:first").remove();

				// 좌측 패널 수치 초기화
				$(this).css("left", 0);
			});
		}

		// 이전 이벤트 실행
		function prev(e) {
			$panel.css("left", -itemWidth);
			$panel.prepend("<li>" + $panel.find("li:last").html() + "</li>");
			$panel.animate({
				"left" : "0px"
			}, function() {
				$(this).find("li:last").remove();
			});
		}

		// 다음 이벤트 실행
		function next(e) {
			$panel.animate({
				"left" : -itemWidth + "px"
			}, function() {
				$(this).append("<li>" + $(this).find("li:first").html() + "</li>");
				$(this).find("li:first").remove();
				$(this).css("left", 0);
			});
		}
	});

	function go_Login() {
		$.ajax({
			url : 'login',
			type : 'post',
			data : {
				userid : $('#userid').val(),
				userpwd : $('#userpwd').val()
			},
			success : function(data) {
				if (data == "fail") {
					alert("아이디 또는 비밀번호가 다릅니다!");
					$('#userid').val('');
					$('#userpwd').val('');
				} else {
					alert("로그인에 성공하셨습니다");
					location.reload();
				}
			},
			error : function(req, textStatus, err) {
				alert(textStatus + "(" + req.status + ") : " + err);
			}
		});
	}
	
	function go_logout() {
		$.ajax({
			url : 'logout',
			type : 'post',
			success : function() {
				location.reload();
			},
			error : function(req, textStatus, err) {
				alert(textStatus + "(" + req.status + ") : " + err);
			}
		});
	}
</script>
</html>