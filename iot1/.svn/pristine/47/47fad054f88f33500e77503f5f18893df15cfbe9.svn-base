var join = {
id:{
	empty:{ 
		code: 'empty',
		desc: '아이디를 입력하세요(영문소문자,숫자만 사용)'
	},
	space:{
		code: 'space',
		desc: '공백없이 입력하세요'
	},
	invalid: {
		code: 'invalid',
		desc: '아이디는 영문소문자,숫자만 입력하세요'
	},
	min: {
		code: 'min',
		desc: '아이디는 5글자 이상 입력하세요'
	},
	max: {
		code: 'max',
		desc: '아이디는 10글자 이내로 입력하세요'
	},
	valid: {
		code: 'valid',
		desc: '아이디 중복여부를 확인하세요.'
	},
	usable: {
		code: 'usable',
		desc: '사용가능한 아이디입니다'
	},
	unusable: {
		code: 'unusable',
		desc: '이미 사용중인 아이디입니다'
	}
},
id_usable: function(usable){
	if( usable=='true')
		return this.id.usable;
	else
		return this.id.unusable;
},
pwd:{
	empty:{ 
		code: 'empty',
		desc: '비밀번호를 입력하세요(영문대문자,소문자,숫자를 모두 포함)'
	},
	space:{
		code: 'space',
		desc: '공백없이 입력하세요'
	},
	invalid: {
		code: 'invalid',
		desc: '비밀번호는 영문대문자,소문자,숫자만 입력하세요'
	},
	min: {
		code: 'min',
		desc: '비밀번호는 5글자 이상 입력하세요'
	},
	max: {
		code: 'max',
		desc: '비밀번호는 10글자 이내로 입력하세요'
	},
	valid: {
		code: 'valid',
		desc: '사용가능한 비밀번호입니다.'
	},
	lack: {
		code: 'lack',
		desc: '비밀번호는 영문대문자,소문자,숫자를 모두 포함해야 합니다.'
	}
},
pwd_ck: {
	empty:{
		code: 'empty',
		desc: '비밀번호를 다시 입력하세요'
	},
	invalid: {
		code: 'invalid',
		desc: '비밀번호가 일치하지 않습니다.'
	},
	valid: {
		code: 'valid',
		desc: '비밀번호가 일치합니다.'
	}
},
email: {
	empty:{
		code: 'empty',
		desc: '이메일을 입력하세요'
	},
	valid: {
		code: 'valid',
		desc: '유효한 이메일입니다'
	},
	invalid: {
		code: 'invalid',
		desc: '유효하지 않은 이메일입니다'
	}
},
email_status: function(email){ //a_A0b-c.te0sAt@hanul-edu.co.kr
	var reg = /[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/;
	if( email=='')
		return this.email.empty;
	else if ( reg.test(email) )
		return this.email.valid;
	else
		return this.email.invalid;
},
pwd_ck_status: function(pwd_ck, pwd){
	if( pwd_ck=='')
		return this.pwd_ck.empty;
	else if( pwd_ck == pwd )
		return this.pwd_ck.valid;
	else
		return this.pwd_ck.invalid;
},
pwd_status: function(pwd){
	var space = /\s/g;
	var reg = /[^A-Za-z0-9]/g;
	var upper = /[A-Z]/g;
	var lower = /[a-z]/g;
	var digit = /[0-9]/g;
	if( pwd=='')
		return this.pwd.empty;
	else if( pwd.match(space) )
		return this.pwd.space;
	else if( reg.test(pwd) ) //영문소문자, 대문자, 숫자 외의 문자 입력한 경우
		return this.pwd.invalid;
	else if( pwd.length<5 )
		return this.pwd.min;
	else if( pwd.length>10 )
		return this.pwd.max;
	else if( !lower.test(pwd) | !upper.test(pwd) |  !digit.test(pwd) ){
//		console.log(this.pwd.lack.code+" : "+ this.pwd.lack.desc);
		return this.pwd.lack;
	}
	else
		return this.pwd.valid;
},
birth: {
	empty:{
		code: 'empty',
		desc: '생년월일을 선택하세요'
	},
	valid: {
		code: 'valid',
		desc: '유효한 생년월일입니다'
	}
},
birth_status: function(birth){
	if ( birth=='' )
		return this.birth.empty;
	else
		return this.birth.valid;
},
id_status: function(id){
	//정규식으로 문자를 판단한다.
	var space = /\s/g;
	var reg = /[^a-z0-9]/g;
	if( id=='' ){ //입력하지 않은 경우
		return this.id.empty;
	}else if( id.match(space) ){ //공백입력한 경우
		return this.id.space;
	}else if( reg.test(id) ){//영문소문자,숫자 외의 문자 입력한 경우
		return this.id.invalid;
	}else if( id.length<5){ //5글자 이상
		return this.id.min;
	}else if( id.length>10){ //10글자 이하
		return this.id.max;
	} else
		return this.id.valid;
}

}