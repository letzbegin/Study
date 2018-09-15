<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

	<!--웹 주소 알아내기  -->
	<input type="button"
		onclick="alert(location.toString(), location.href);" value="주소 알아보기">


	<!--
웹 주소
https://opentutorials.org:8080/course/1375/6634?id=아이디#bookmark

https://			||프로토콜	||location.protocol
opentutorials.org	||호스트		||location.host
:8080				||포트		||location.port
/course/1375/6634	||패스		||location.pathname
?id=아이디			||서치		||location.search
#bookmark			||해시		||location.hash
  -->
	<input type="button" id="detail" value="세부사항 알아보기">

<!--
location.href='http://www.naver.com';
형식으로 특정 주소로 이동시켜 본다
-->
	<input type="button" id="naver" value="네이버로 이동시켜보기">

<!--
location.href=location.href;
location.reload;
두가지 방식으로 처리 가능하다
-->
	<input type="button" id="reload" value="리로딩">



	<script type="text/javascript">
var detail = document.getElementById('detail');
	detail.addEventListener('click',function(){
		alert("프로토콜:"+location.protocol );
		alert( "호스트:"+location.host);	
		alert( "포트:"+location.port);	
		alert("패스:"+ location.pathname);	
		alert("서치:"+ location.search);	
		alert("해시:"+ location.hash);	
	});


var naver = document.getElementById('naver');
	naver.addEventListener('click',function(){
		location.href='http://www.naver.com';
	});
	
var reload = document.getElementById('reload');
	reload.addEventListener('click',function(){
		location.reload();
	});
</script>
</body>
</html>