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
    <li>html</li>
    <li>css</li>
    <li>JavaScript</li>
</ul>
<script src="http://code.jquery.com/jquery-1.11.0.min.js"></script>
<script>
    var li = $('li');
    li.map(function(index, elem){
        console.log(index, elem);
        //각 배열을 돌아가면 index 값과 DOM 객체 (elem)를 리턴한다. JQuery 문법을 사용하기 위해 랩핑한다
        $(elem).css('color', 'red');
    })
</script>
</body>
</html>