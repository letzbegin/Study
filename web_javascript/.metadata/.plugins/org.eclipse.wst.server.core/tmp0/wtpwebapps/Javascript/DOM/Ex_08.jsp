<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<body data-genuitec-lp-enabled="false" data-genuitec-file-id="wc1-19" data-genuitec-path="/Javascript/WebContent/DOM/Ex_08.jsp">
	<ul data-genuitec-lp-enabled="false" data-genuitec-file-id="wc1-19" data-genuitec-path="/Javascript/WebContent/DOM/Ex_08.jsp">
		<li>HTML</li>
		<li>CSS</li>
		<li id="active">JavaScript</li>
	</ul>
	<script>
		console.group('before');
		var lis = document.getElementsByTagName('li');
		for (var i = 0; i < lis.length; i++) {
			console.log(lis[i]);
		}
		console.groupEnd();
		console.group('after');
		lis[1].parentNode.removeChild(lis[1]);
		for (var i = 0; i < lis.length; i++) {
			console.log(lis[i]);
		}
		console.groupEnd();
	</script>
</body>
<script>"undefined"==typeof CODE_LIVE&&(!function(e){var t={nonSecure:"9734",secure:"9743"},c={nonSecure:"http://",secure:"https://"},r={nonSecure:"127.0.0.1",secure:"gapdebug.local.genuitec.com"},n="https:"===window.location.protocol?"secure":"nonSecure";script=e.createElement("script"),script.type="text/javascript",script.async=!0,script.src=c[n]+r[n]+":"+t[n]+"/codelive-assets/bundle.js",e.getElementsByTagName("head")[0].appendChild(script)}(document),CODE_LIVE=!0);</script></html>