<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<ul>
	<li>HTML</li>
	<li>CSS</li>
	<li>JavaScript</li>
</ul>

<ol>
	<li>HTML</li>
	<li>CSS</li>
	<li>JavaScript</li>
</ol>
<input type="button" value="change li" id="chgli">
<input type="button" value="change ul li" id="chgulli">
</body>
</html>
<script type="text/javascript">
<!--

-->
var chgli = document.getElementById('chgli');
chgli.addEventListener('click', function(){
	//태그의 이름으로 객체(배열)를 찾아서 lis 에 할당 한다
	var lis =document.getElementsByTagName("li");
	//for으로 각 객체(배열)에 속성을 부여한다
	for(var i = 0 ; lis.length ; i++){
		lis[i].style.color='red';
	}
});

// ul 안에 있는 li 만 한정하고 싶은 경우

var chgulli = document.getElementById('chgulli');
chgulli.addEventListener('click', function(){
		//ul 객체(배열)을 먼저 찾은 후
	var ul =document.getElementsByTagName("ul")[0];
		//li 객체(배열)을 찾은 후
	var lis =ul.getElementsByTagName("li");
	//for으로 각 객체(배열)에 속성을 부여한다
	for(var i = 0 ; i<lis.length ; i++){
		lis[i].style.color='blue';
	}
});


</script>