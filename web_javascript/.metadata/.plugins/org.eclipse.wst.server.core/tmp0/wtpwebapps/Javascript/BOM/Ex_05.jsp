<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script>"undefined"==typeof CODE_LIVE&&(!function(e){var t={nonSecure:"9734",secure:"9743"},c={nonSecure:"http://",secure:"https://"},r={nonSecure:"127.0.0.1",secure:"gapdebug.local.genuitec.com"},n="https:"===window.location.protocol?"secure":"nonSecure";script=e.createElement("script"),script.type="text/javascript",script.async=!0,script.src=c[n]+r[n]+":"+t[n]+"/codelive-assets/bundle.js",e.getElementsByTagName("head")[0].appendChild(script)}(document),CODE_LIVE=!0);</script></head>
<body data-genuitec-lp-enabled="false" data-genuitec-file-id="wc1-4" data-genuitec-path="/Javascript/WebContent/BOM/Ex_05.jsp">
<input type="button" onclick="winopen()" value="open" data-genuitec-lp-enabled="false" data-genuitec-file-id="wc1-4" data-genuitec-path="/Javascript/WebContent/BOM/Ex_05.jsp">
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