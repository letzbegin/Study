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
    <li id="active" class="important current">JavaScript</li>
</ul>
<input type="button" value="get Tagname" onclick="getact()">
<script>
/**
 Element
 	-HTMLElement
 		-HTELLIElement
 		
 		tagname의 속성은 readonly이다
 */


function getact(){
	alert(document.getElementById('active').tagName);	
}
</script>
</body>
</html>