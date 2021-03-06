function loadScript() {
	var script = document.createElement('script');
	script.type = 'text/javascript';
	script.src = 'https://maps.googleapis.com/maps/api/js?v=3.exp&'
			+ 'callback=initialize';
	document.body.appendChild(script);
}
// 오늘 날짜의 정보
var today = new Date();
var nowday = today.getDay();
var nowtime = today.getHours() + "" + today.getMinutes();

// 구글맵에 설정할 마커위치
// 0번 배열은 유저의 위치
var locations = [ [], ];

function getlc() {
	// 사용가 위도와 경도를 가져옴
	// Geolocation API에 액세스할 수 있는지를 확인
	if (navigator.geolocation) {
		// 위치 정보를 얻기
		navigator.geolocation.getCurrentPosition(function(pos) {
			$('#latitude').html(pos.coords.latitude); // 위도
			$('#longitude').html(pos.coords.longitude); // 경도

			locations[0][0] = "나의현재위치";
			locations[0][1] = pos.coords.latitude;
			locations[0][2] = pos.coords.longitude;
			console.log(locations[0]);
			getlctn(pos.coords.latitude, pos.coords.longitude)
		});
	} else {
		alert("이 브라우저에서는 Geolocation이 지원되지 않습니다.")
	}
}

// 위,경도를 기반으로 현재 나의 위치 정보를 가져옴
function getlctn(la, lo) {
	$.ajax({
		url : 'lctncheck',
		data : {
			lat : la,
			lon : lo
		},
		success : function(data) {
			var loc = data;
			var loc0 = loc["results"][0];
			var loc1 = loc0["geometry"];

			console.log("맵실행");
			go_search(loc0["address_components"][4]["long_name"],
					loc0["address_components"][3]["long_name"]);
		},
		error : function(req, status) {
			alert(status + ":" + req.status);
		}
	});
}

// 주변의 약국위치 정보를 가져와 배열에 저장
function go_search(si, gun) {
	$.ajax({
		url : 'data/pharmacy',
		data : {
			sido : si,
			gungu : gun
		},
		success : function(data) {
			console.log(nowday);
			console.log(nowtime);
			$(data).find('item').each(
			// if(nowday == 3){
			// if($(this).find('dutyTime3s').text()<=time){
			// if($(this).find('dutyTime3c').text()>=time){
			function(idx) {
				locations.push([]);
				locations[idx + 1][0] = $(this).find('dutyName').text();
				locations[idx + 1][1] = $(this).find('wgs84Lat').text();
				locations[idx + 1][2] = $(this).find('wgs84Lon').text();
				console.log(locations[idx + 1]);
			});
			// }
			// }
			// }
			initialize();
		},
		error : function(req, status) {
			alert(status + ": " + req.status);
		}
	});
}

// 비동기 방식
// function myMap(latitude, longitude,name) {
function initialize() {

	// 구글 api 위치설정
	var map = new google.maps.Map(document.getElementById('googleMap'), {
		zoom : 14,
		center : new google.maps.LatLng(locations[0][1], locations[0][2]),
		mapTypeId : google.maps.MapTypeId.ROADMAP
	});

	var infowindow = new google.maps.InfoWindow();

	var marker;

	for (var i = 0; i < locations.length; i++) {
		marker = new google.maps.Marker(
				{
					position : new google.maps.LatLng(locations[i][1],
							locations[i][2]),
					map : map
				});

		google.maps.event.addListener(marker, 'click', (function(marker, i) {
			return function() {
				infowindow.setContent(locations[i][0]);
				infowindow.open(map, marker);
			}
		})(marker, i));
	}
}