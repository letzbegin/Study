<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script>"undefined"==typeof CODE_LIVE&&(!function(e){var t={nonSecure:"9734",secure:"9743"},c={nonSecure:"http://",secure:"https://"},r={nonSecure:"127.0.0.1",secure:"gapdebug.local.genuitec.com"},n="https:"===window.location.protocol?"secure":"nonSecure";script=e.createElement("script"),script.type="text/javascript",script.async=!0,script.src=c[n]+r[n]+":"+t[n]+"/codelive-assets/bundle.js",e.getElementsByTagName("head")[0].appendChild(script)}(document),CODE_LIVE=!0);</script></head>
<body data-genuitec-lp-enabled="false" data-genuitec-file-id="wc1-7" data-genuitec-path="/Javascript/WebContent/DOM/Element/Ex_01.jsp">
<ul data-genuitec-lp-enabled="false" data-genuitec-file-id="wc1-7" data-genuitec-path="/Javascript/WebContent/DOM/Element/Ex_01.jsp">
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