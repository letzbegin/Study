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
    <li id="active">JavaScript</li>
</ul>
<input type="button" value="element(Javascript)" onclick="element()">
<input type="button" value="collection(li)" onclick="collection()">
</body>
<script type="text/javascript">
// 	단수개의 객체라면 element 에 복수개의 객체라면 collection으로 관리 된다
function element(){
	var li = document.getElementById('active')
	alert(li.constructor.name);	//HTMLElement(li의 element) = HTMLLIELEMENT
}
function collection(){
	var lis = document.getElementsByTagName("li");
	alert(lis.constructor.name);	//HTMLCollection 유사 배열
}
	
</script>
</html>