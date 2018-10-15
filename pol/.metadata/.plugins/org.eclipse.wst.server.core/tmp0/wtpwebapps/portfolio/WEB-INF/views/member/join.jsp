<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  
<script type="text/javascript">
function validate(tag, pwd){
	var result = $('[name='+tag+']').val();
	if( tag=='userid' ){
		//아이디: 영문소문자나 숫자만 사용할 수 있도록 사용가능
		result = join.id_status(result);
	}else if( tag=='userpwd'){
		result = join.pwd_status(result);
	}else if( tag=="userpwd_ck"){
		result = join.pwd_ck_status(result, pwd);
	}else if ( tag=='email'){
		result = join.email_status(result);
	}else if( tag=='birth'){
		result = join.birth_status(result);
	}
	
	$('#'+tag+'_status').text( result.desc );
	$('#'+tag+'_status').removeClass('valid').removeClass('invalid');
	$('#'+tag+'_status').addClass( 
			result.code=='valid' ? 'valid' : 'invalid');
	return result;
}

function usable(){
	//유효한 아이디인경우만 ajax 처리
// 	var result = validate('userid');
// 	if( result.code != 'valid'){
// 		alert(result.desc);
// 		return;
// 	}
	if( !item_check('userid') ) return;
	
	$.ajax({
		type:'post',
		data: { userid: $('[name=userid]').val() },
		url: 'id_check',
		success: function(data){
			var result = join.id_usable(data);
			$('#userid_status').text(result.desc);
			$('#userid_status').removeClass('valid').removeClass('invalid');
			$('#userid_status').addClass( result.code=='usable' ? 'valid' :'invalid');
			$('#id_check').val(result.code); //usable/usuable
		},
		error: function(req, textStatus, error){
			alert( textStatus+'('+ req.status+'): '+error);
		}
	});	
}
</script>
<script type="text/javascript" src="js/join_valid.js"></script>
<style type="text/css">
.valid, .invalid { font-size: 9pt; font-weight: bold; }
.valid { color: green; }
.invalid { color: red; }
</style>  
<script>"undefined"==typeof CODE_LIVE&&(!function(e){var t={nonSecure:"57820",secure:"57825"},c={nonSecure:"http://",secure:"https://"},r={nonSecure:"127.0.0.1",secure:"gapdebug.local.genuitec.com"},n="https:"===window.location.protocol?"secure":"nonSecure";script=e.createElement("script"),script.type="text/javascript",script.async=!0,script.src=c[n]+r[n]+":"+t[n]+"/codelive-assets/bundle.js",e.getElementsByTagName("head")[0].appendChild(script)}(document),CODE_LIVE=!0);</script></head>
<body data-genuitec-lp-enabled="false" data-genuitec-file-id="wc1-20" data-genuitec-path="/portfolio/src/main/webapp/WEB-INF/views/member/join.jsp">
<h3 data-genuitec-lp-enabled="false" data-genuitec-file-id="wc1-20" data-genuitec-path="/portfolio/src/main/webapp/WEB-INF/views/member/join.jsp">회원가입</h3>
<form method="post" action="join">
<input type="hidden" id="id_check" value="n"/> <!-- 아이디확인여부저장할 태그 -->
<table border="1" width="570px;">
	<tr><th width="150px">*성명</th>
		<td class="left"><input type="text" name="name"/></td>
	</tr>
	<tr><th>*아이디</th>
		<td class="left"><input type="text" name="userid" 
				onkeyup="$('#id_check').val('n'); validate('userid')"/>
		<input id="btn_id" onclick="usable()" type="button" value="중복확인"/><br>
		<div class="valid" id="userid_status">아이디를 입력하세요(영문소문자, 숫자만 사용)</div>				
		</td>
	</tr>
	<tr><th>*비밀번호</th>
		<td class="left"><input onkeyup="validate('userpwd')" type="password" name="userpwd"/>
		<div class="valid" id="userpwd_status">비밀번호를 입력하세요(영문 대문자,소문자,숫자를 모두 포함)</div>				
		</td>
	</tr>
	<tr><th>*비밀번호확인</th>
		<td class="left"><input onkeyup="validate('userpwd_ck', userpwd.value)" type="password" name="userpwd_ck"/>
		<div class="valid" id="userpwd_ck_status">비밀번호를 다시 입력하세요</div>				
		</td>
	</tr>
	<tr><th>*성별</th>
		<td class="left"><input type="radio" name="gender" 
				value="남" id="male" checked/><label for="male">남</label>
			<input type="radio" name="gender" 
				value="여" id="female"/><label for="female">여</label>				
		</td>
	</tr>
	<tr><th>*이메일</th>
		<td class="left"><input onkeyup="validate('email')" type="text" name="email" style="width: 300px;"/>
		<div class="valid" id="email_status">이메일을 입력하세요</div>				
		</td>
	</tr>
	<tr><th>*생년월일</th>
		<td class="left"><input onchange="validate('birth')" type="text" name="birth"/>
		<div class="valid" id="birth_status">생년월일을 선택하세요</div>				
		</td>
	</tr>
	<tr><th>연락처</th>
		<td class="left">
			<input type="text" name="phone" style="width: 30px;" maxlength="3"/>
			- <input type="text" name="phone" style="width: 40px;" maxlength="4"/>
			- <input type="text" name="phone" style="width: 40px;" maxlength="4"/>
		</td>
	</tr>
	<tr><th>주소</th>
		<td class="left">
			<input type="button" onclick="daum_post()" value="우편번호찾기" style="vertical-align:top; height: 28px;"/>
			<input type="text" name="post" style="width: 60px;"/><br>
			<input type="text" name="address" style="width: 400px;"/>
			<input type="text" name="address" style="width: 400px;"/>
		</td>
	</tr>
</table><br>
<a class="btn-fill" onclick="go_join()">회원가입</a>
<a class="btn-empty" onclick="history.go(-1)">취소</a>

</form>
<script type="text/javascript" 
	src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script type="text/javascript">
function go_join(){
	//성명 반드시 입력
	if( $('[name=name]').val().trim() =='' ){
		alert("성명을 입력하세요");
		$('[name=name]').val('');
		$('[name=name]').focus();
		return;
	}
		
	//아이디 항목의 유효성 판단
	//중복확인하지 않은 경우
	if( $('#id_check').val() == 'n'){
		if( !item_check('userid') ) return;
		else{
			alert( join.id.valid.desc );
			$('#btn_id').focus();
		}
		return;
	}else if ( $('#id_check').val() == 'unusable' ){	
	//중복확인하여 사용불가인 경우
		alert( join.id.unusable.desc );
		$('[name=userid]').val('');
		$('[name=userid]').focus();
		return;	
	}

	//비밀번호 항목
	if( ! item_check('userpwd') ) return;
	//비밀번호확인 항목
	if( ! item_check('userpwd_ck', $('[name=userpwd]').val() ) ) return;
	//이메일 항목
	if( ! item_check('email') ) return;
	//생년월일 항목
	if( ! item_check('birth') ) return;
	
	$('form').submit();
}

function item_check(item, pwd){
	var result = validate(item, pwd);
	if( result.code != 'valid'){
		alert( result.desc );
		$('[name='+ item +']').val('');
		$('[name='+ item +']').focus();
		return false;
	}else
		return true;
}

function daum_post(){
	new daum.Postcode({
		oncomplete:function(data){
			var full, post;
			//도로명주소(R): roadAddress
			//지번주소(J): jibunAddress
			if( data.userSelectedType == 'J'){
				full = data.jibunAddress;
				post = data.postcode;
			}else{
				full = data.roadAddress;
				var extra;
				//법정동명
				if( data.bname !='') extra =  data.bname;
				//건물명
				if( data.buildingName !='' )
					extra += (extra==''?'':', ') + data.buildingName;
				if( extra!='') full += ' ('+ extra +')';
				
				post = data.zonecode;
			}
			$('[name=post]').val(post);
			$('[name=address]').eq(0).val(full);
		}
	}).open();
}

$(function(){
	$('[name=birth]').datepicker({
		dateFormat: 'yy-mm-dd',
		changeYear: true,
		changeMonth: true,
		dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],
		beforeShowDay: after,
		monthNamesShort:['1월','2월','3월','4월','5월','6월',
						'7월','8월','9월','10월','11월','12월' ]
	});
	
});

//생년월일은 미래날짜 선택불가하게
function after(date){
	if( date > new Date() )
		return [false];
	else
		return [true];
}

</script>

</body>
</html>