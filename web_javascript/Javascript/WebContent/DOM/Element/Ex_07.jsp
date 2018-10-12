<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>jQuery</title>
</head>
<body>
<a id="target" href="http://opentutorials.org">opentutorials</a>

<input type="button" value="check href" onclick="check1()">
<input type="button" value="set title" onclick="check2()">
<input type="button" value="remove title" onclick="check3()">
</body>
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<script>
var t = $('#target');

function check1(){
alert(t.attr('href')); //http://opentutorials.org
}


function check2(){
alert("title 을 opentutorials.org 로 변경합니다 ")	
t.attr('title', 'opentutorials.org'); // title 속성의 값을 설정한다.
alert(t.attr('title'));	
}

function check3(){
	alert("title 속성을 제거합니다")
t.removeAttr('title'); // title 속성을 제거한다.
	
}
</script>
</html>