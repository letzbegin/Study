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
    <li id="active">JavaScript</li>
</ul>
<input type="button" value="check id" onclick="check()">
<input type="button" value="change id" onclick="change()">
<script>
/**
 id는 오직 하나만 등장할수 있는 식별자 이다.
 r/w 둘다 가능하다
 
 */
var active = document.getElementById('active');

function check(){
	alert(active.id);
}
function change(){
	active.id = 'deactive';
}
</script>
</body>
</html>