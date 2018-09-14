<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<!--
alert

window 객체의 속성 중 하나로 경고창을 띄우면 다름 행의 스크립트는 처리가 끝나기 전까지 대기 상태가 된다

-->
<input type="button" id="alert" value="경고처리">
<!--
confirm

확인버튼을 누르면 true 취소를 누르면 false를 리턴한다
-->
<input type="button" id="confirm" value="확인처리">
<!--
prompt

입력창에 입력한 값을 리턴 받는다
-->
<input type="button" id="prompt" value="프롬프트">
</body>
</html>

<script type="text/javascript">
var btnAlert = document.getElementById('alert');
btnAlert.addEventListener('click', function(){
	alert(1);
	alert(2);
	alert(3);
});

var btnconfirm = document.getElementById('confirm');
btnconfirm.addEventListener('click', function(){
	if(confirm('처리를 확인합니다')){
		alert("확인을 누르셨습니다");
	}else{
		alert("취소를 누르셨습니다");
	}
});

var btnprompt = document.getElementById('prompt');
btnprompt.addEventListener('click', function(){
	while(true){
		if(prompt("id 를 입력해주세요") === 'id'){
			alert("id를 입력하셨습니다");
			break;
		}else{
			alert("id라는 문자를 입력해주세요");
		}
	}
});

</script>