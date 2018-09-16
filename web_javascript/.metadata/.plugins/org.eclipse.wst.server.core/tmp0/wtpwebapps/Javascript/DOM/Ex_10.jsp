<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>jQuery Object</title>
<script>"undefined"==typeof CODE_LIVE&&(!function(e){var t={nonSecure:"9734",secure:"9743"},c={nonSecure:"http://",secure:"https://"},r={nonSecure:"127.0.0.1",secure:"gapdebug.local.genuitec.com"},n="https:"===window.location.protocol?"secure":"nonSecure";script=e.createElement("script"),script.type="text/javascript",script.async=!0,script.src=c[n]+r[n]+":"+t[n]+"/codelive-assets/bundle.js",e.getElementsByTagName("head")[0].appendChild(script)}(document),CODE_LIVE=!0);</script></head>
<body data-genuitec-lp-enabled="false" data-genuitec-file-id="wc1-17" data-genuitec-path="/Javascript/WebContent/DOM/Ex_10.jsp">
<ul data-genuitec-lp-enabled="false" data-genuitec-file-id="wc1-17" data-genuitec-path="/Javascript/WebContent/DOM/Ex_10.jsp">
    <li>html</li>
    <li>css</li>
    <li>JavaScript</li>
</ul>
<input type="button" value="Jquery use" onclick="jqu()">
<script src="http://code.jquery.com/jquery-1.11.0.min.js"></script>
</body>
<script>
    console.log($('li').length);
    console.log($('li')[0]);
    var li = $('li');
    for(var i=0; i<li.length; i++){
        console.log(li[i]);	//리턴하는 객체는 jQuery 객체가 아닌 DOM 객체이다. 때문에 JQuery 문법 사용 불가
    }
function jqu(){
//     사용하고자 한다면 아래의 방식으로 사용 해야한다
    for(var i=0; i<li.length; i++){
    	//li[i] 객체는  DOM 객체이지만 JQuery로 감싸게 되면 jQuery 객체가되 문법이 사용 가능하다
        $(li[i]).css('color', 'red');
    }
}
</script>
</html>