<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>

<!--
Copyright 2017 Google Inc.
Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at
    http://www.apache.org/licenses/LICENSE-2.0
Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
-->

<html lang="en">
<head>

<!-- Global site tag (gtag.js) - Google Analytics -->
<script async
	src="https://www.googletagmanager.com/gtag/js?id=UA-33848682-1"></script>
<script>
window.dataLayer = window.dataLayer || [];
function gtag() {
  window.dataLayer.push(arguments);
}
gtag('js', new Date());
gtag('config', 'UA-33848682-1');z
</script>

<meta charset="utf-8">
<meta name="description"
	content="Simplest possible examples of HTML, CSS and JavaScript.">
<meta name="author" content="//samdutton.com">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta itemprop="name"
	content="simpl.info: simplest possible examples of HTML, CSS and JavaScript">
<meta itemprop="image" content="/images/icons/icon192.png">
<meta id="theme-color" name="theme-color" content="#fff">

<base target="_blank">


<title>RTCPeerConnection</title>

<style>
button {
	margin: 0 20px 0 0;
	width: 85.9px;
}

button#hangupButton {
	margin: 0;
}

p.borderBelow {
	margin: 0 0 1.5em 0;
	padding: 0 0 1.5em 0;
}

video {
	height: 225px;
	margin: 0 0 20px 0;
	vertical-align: top;
	width: calc(50% - 13px);
	background-color: black;
}

video#localVideo {
	margin: 0 20px 20px 0;
}

@media ( max-width : 400px) {
	button {
		width: 83px;
	}
	button {
		margin: 0 11px 10px 0;
	}
	video {
		height: 90px;
		margin: 0 0 10px 0;
		width: calc(50% - 7px);
	}
	video#localVideo {
		margin: 0 10px 20px 0;
	}
}
</style>

</head>

<body>
	<div class="container-fluid text-center">
		<div class="row content">
			<div class="col-sm-2">
				<div class="panel panel-default">
					<div class="panel-heading">
						<a href="pillnon">처방전 없이 살수 있는 의약품</a>
					</div>
					<div class="panel-body">
						<a href="pillusage">복용법</a>
					</div>
				</div>
			</div>
			<div class="col-sm-8 text-left">

				<div id="container">

					<div id="highlight"></div>

					<h1>Test RTCPeerConnection</h1>

					<!-- <p>Check out the complete set of WebRTC demos at <a href="https://webrtc.github.io/samples/" title="WebRTC samples GitHub Pages">webrtc.github.io/samples</a>.</p> -->

					<video id="localVideo" autoplay muted></video>
					<video id="remoteVideo" autoplay></video>

					<div>
						<button class="btn btn-default" id="startButton">Start</button>
						<button class="btn btn-default" id="callButton">Call</button>
						<button class="btn btn-default" id="hangupButton">Hang Up</button>
					</div>
					<script src="js/main.js"></script>

					<!--     <a href="https://github.com/samdutton/simpl/blob/gh-pages/rtcpeerconnection" title="View source for this page on GitHub" id="viewSource">View source on GitHub</a> -->

				</div>
			</div>
			<div class="col-sm-2 sidenav">
				<div class="well">
					<p>ADS</p>
				</div>
				<div class="well">
					<p>ADS</p>
				</div>
			</div>
		</div>
	</div>
</body>
<script type="text/javascript">
function getIP(json) {
	//외부ip를 가져옴 webRTC에 사용
	$("#myip").text("My public IP address is: " + json.ip)
	//사용가 위도와 경도를 가져옴
	
	$.ajax({
			
		url : 'ipcheck',
		data : {
			myip : json.ip, lat : la
		},
		success : function(data) {
			//Json를 스크립트로 파싱
			var mylocation = JSON.parse(data);
			myMap(mylocation.latitude, mylocation.longitude, "나의 위치");
			console.log("맵실행");
			go_search(mylocation.region_name, mylocation.city);
		},
		error : function(req, status) {
			alert(status + ":" + req.status);
		}
	});
} 

</script>
<script type="application/javascript"
	src="https://api.ipify.org?format=jsonp&callback=getIP"></script>
</html>