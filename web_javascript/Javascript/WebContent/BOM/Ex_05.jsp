<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<input type="button" onclick="winopen()" value="open">
<input type="text" onkeypress="winmessage(this.value)">
<input type="button" value="close" onclick="winclose()">
</body>
</html>

<script type="text/javascript">

function winopen(){
	win = window.open('demo2.html','test','width=300px, height=400px');
}
function winmessage(msg){
	win.document.getElementById('message').innerText=msg;
}
function winclose(){
	win.close;
}

</script>