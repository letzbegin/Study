<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <style>
    #demo{width:200px;float: left; margin-top:120px;}
    #execute{float: left; margin:0; font-size:0.9em;}
    #execute{padding-left: 5px}
    #execute li{list-style: none}
    #execute pre{border:1px solid gray; padding:10px;}
    </style>
</head>
<body>
<ul id="demo">
    <li class="active">HTML</li>
    <li id="active">CSS</li>
    <li class="active">JavaScript</li>
</ul>
<ul id="execute">
    <li>
        <pre>
var lis = document.getElementsByTagName('li');
for(var i=0; i&lt;lis.length; i++){
    lis[i].style.color='red';   
</pre>
        <pre>
$('li').css('color', 'red')     </pre>
        <input type="button" value="execute" onclick="$('li').css('color', 'red')" />
    </li>
    <li>
        <pre>
var lis = document.getElementsByClassName('active');
for(var i=0; i &lt; lis.length; i++){
    lis[i].style.color='red';   
}</pre>
        <pre>
$('.active').css('color', 'red')</pre>
        <input type="button" value="execute" onclick="$('.active').css('color', 'red')" />
    </li>
    <li>
        <pre>
var li = document.getElementById('active');
li.style.color='red';
li.style.textDecoration='underline';</pre>
        <pre>
$('#active').css('color', 'red').css('textDecoration', 'underline');
        </pre>
        <input type="button" value="execute" onclick="$('#active').css('color', 'red').css('textDecoration', 'underline')" />
    </li>
</ul>
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
</body>
</html>