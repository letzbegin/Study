<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
function pharmacy_data(){
	$('#public-data').html('');
	
	var tag = "<p></p><table border='1' width='80%'>";
	tag += "<tr><th width='50px'>번호</th>"
			+"<th width='140px'>약국명</th>"
			+"<th width='130px'>전호번호</th>"
			+"<th>주소</th></tr>";
			
	$.ajax({
		url: 'data/pharmacy',
		success: function( data ){
			$(data).find('item').each(function(idx){
				var map_data = $(this).find('YPos').text()+','
							+  $(this).find('XPos').text()+',"'
							+  $(this).find('yadmNm').text()+'"';

				tag += "<tr><td>"+ (idx+1) +"</td>"
					+  "<td><a onclick='show_map("+ map_data+ ")'>"+$(this).find('yadmNm').text() + "</a></td>"
					+  "<td>"+$(this).find('telno').text() + "</td>"
					+  "<td>"+$(this).find('addr').text() + "</td>";
				tag += "</tr>";
			});
			tag += "<table>";
			$('#public-data').html(tag);
		},
		error: function(req, status){
			alert(status+": "+req.status);
		}
	});
}

$(function(){
	$(document).on('change', '#sido', function(){
		animal_sigungu(); //시도에 따른 시군구조회
	});
	$(document).on('change', '#sigungu', function(){
		animal_shelter(); //시군구에 따른 보호소 조회
	});
	$(document).on('change', '#upkind', function(){
		animal_kind(); //축종에 따른 품종 조회
	});
});

function animal_kind(){
	$('#public-data').html('');
	$('#list-top li:gt(3)').remove();
	if( $('#upkind').val()=='' ) return;
	
	$.ajax({
		url: 'data/animal/kind',
		data : { upkind: $('#upkind').val() },
		success: function( data ){
			var tag = '<li><select id="kind" style="height: 28px; width:200px;">';
			tag += '<option value="">품종 선택</option>';
			$(data).find('item').each(function(){
				tag += '<option value="'+$(this).find('kindCd').text()
					+'">'+ $(this).find('KNm').text() +'</option>';
			});
			tag += '</select></li>';
			$('#list-top').append(tag);
		},
		error: function(req, text){
			alert( text+": "+req.status);
		}
	});
}

function animal_shelter(){
	$('#public-data').html('');
	$('#list-top li:gt(1)').remove();
	if( $('#sigungu').val()=='' ) return;
	
	//선택한 시도,시군구의 보호소목록 조회
	
	$.ajax({
		url: 'data/animal/shelter',
		data: { sido: $('#sido').val(),  sigungu: $('#sigungu').val() },
		success: function(data){
			var tag = '<li><select id="shelter" style="height:28px; width:200px;" >';
			tag += '<option value="">보호소 선택</option>';
			
			$(data).find('item').each(function(){
				tag += '<option value="'+ $(this).find('careRegNo').text() 
						+'">'+ $(this).find('careNm').text() +'</option>';	
			});
			
			tag += '</select></li>';
			
			//축종은 개, 고양이, 기타 로 정해져 있다.
			tag += '<li><select id="upkind" style="height:28px; width:100px;">';
			tag += '<option value="">축종 선택</option>';
			tag += '<option value="417000">개</option>';
			tag += '<option value="422400">고양이</option>';
			tag += '<option value="429900">기타</option>';
			tag += '</select></li>';
			
			$('#list-top').append(tag);
		},
		error: function(req, status){
			alert( status +": "+req.status);
		}		
	});
}


function animal_sigungu(){
	$('#public-data').html('');
	//시도 선택시마다 시군구태그가 추가되지 않도록 한다
	$('#list-top li:gt(0)').remove();
	//선택한 시도정보가 없는 경우 시군구 조회할 필요 없음	
	if( $('#sido').val()=='' ) return;
		
	$.ajax({
		url: 'data/animal/sigungu',
		data : { sido: $('#sido').val() },
		success: function( data ){
			var tag = '<li><select id="sigungu" style="height:28px; width:120px;">';
				tag += '<option value="">시군구 선택</option>'
				$(data).find('item').each(function(){
					tag += '<option value="'+ $(this).find('orgCd').text()
						+ '">'+ $(this).find('orgdownNm').text() +'</option>';					
				});
				tag += '</select></li>';
			$('#list-top').append(tag);
		},
		error: function(req, status){
			alert(status+": "+req.status);
		}
	});
}

function animal_data(){
	$('#public-data').html('');
	$('#list-top').css('display', 'block');
	
	var tag = '<li><select id="sido" style="height:28px; width:130px;">';
		tag += '<option value="">시도 선택</option>';
		
	$.ajax({
		url: 'data/aniaml/sido',
		success: function(data){
			$(data).find('item').each(function(){
				tag += '<option value="'+ $(this).find('orgCd').text() +'">' + $(this).find('orgdownNm').text() + '</option>';
			});
			tag += '</select></li>';
			
			tag += '<a onclick="animal_list()" class="btn-fill" style="float:right;">조회</a>';
			
			$('#list-top').html(tag);
		},
		error: function(req, status){
			alert(status+": "+req.status);
		}
	});		
}

function animal_list(){
	$('#public-data').html('');

	var animal = new Object();
	animal.sido = $('#sido').val();
	//시도, 보호소 태그를 동적으로 만들다보니 태그가 존재하지 않을 수 있다.
	//따라서 태그 존재여부에 따라 태그값을 넣거나 빈문자를 넣는다.
	animal.sigungu = $('#sigungu').length>0 ? $('#sigungu').val() : '';
	animal.shelter = $('#shelter').length>0 ? $('#shelter').val() : '';
	animal.upkind = $('#upkind').length>0 ? $('#upkind').val() : '';
	animal.kind = $('#kind').length>0 ? $('#kind').val() : '';
	
	$.ajax({
		type: 'post',
		data : JSON.stringify(animal),
		contentType: 'application/json; charset=utf-8',
		url: 'data/animal/list',
		success: function(data){
			if( $(data).find('totalCount').text()==0 ) {
				alert('해당 유기동물정보가 없습니다');
				return;
			}
	var tag = '<p></p><table border="2" width="80%">';
			
			$(data).find('item').each(function(idx){
				if( animal.shelter !='' ){
					if(idx==0){
			tag += '<tr><th width="80px;">주소</th>'
				+ '<td class="left">'+ $(this).find('careAddr').text() +'</td>'
				+ '<th width="100px;">전화번호</th>'
				+ '<td width="120px;">'+ $(this).find('careTel').text() +'</td></tr>'
				+ '</table><p></p><table border="2" width="80%">';
					} 
				}
				
		tag += '<tr><td width="100" rowspan="3" '
		+ ( animal.shelter=='' ? '' : 'style="border-bottom: 2px solid; "') + ' >'
		+'<img width="100" height="100" src="'+ $(this).find('filename').text()+'"/></td>';
		
		tag += '<th width="50px;">성별</th>';
	tag += '<td width="30px;">'+ $(this).find('sexCd').text() +'</td>';
	
	tag += '<th width="30px;">나이</th>';
	tag += '<td width="70px;">'+ $(this).find('age').text() +'</td>';
	
	tag += '<th width="30px;">체중</th>';
	tag += '<td width="70px;">'+ $(this).find('weight').text() +'</td>';

	tag += '<th width="30px;">색상</th>';
	tag += '<td width="70px;">'+ $(this).find('colorCd').text() +'</td>';

	tag += '<th width="40px;">접수일</th>';
	tag += '<td width="70px;">'+ $(this).find('happenDt').text() +'</td>';
	tag += '</tr>';
	
	tag += '<tr><th>특징</th>';
	tag += '<td colspan="9" class="left">'+ $(this).find('specialMark').text() +'</td>';
	tag += '</tr>';
	
	tag += '<tr '+ ( animal.shelter==''?'': 'style="border-bottom: 2px solid; "' ) +'><th>발견장소</th>';
	tag += '<td colspan="8" class="left">'+ $(this).find('happenPlace').text() +'</td>';
	tag += '<td>'+ $(this).find('processState').text() +'</td>';
	tag += '</tr>';
			
if( animal.shelter == ''){
// 	유기동물보호시설정보
	tag += '<tr style="border-bottom: 2px solid; ">';
	tag += '<td colspan="2" class="left">'
							+ $(this).find('careNm').text() +'</td>';
	tag += '<td colspan="7" class="left">'
							+ $(this).find('careAddr').text() +'</td>';							
	tag += '<td colspan="2">'
							+ $(this).find('careTel').text() +'</td>';							
	tag += '</tr>';
}
			});	
			
			tag +="</table>";
			$('#public-data').html(tag);
		},
		error: function(req, status){
			alert(status+": "+req.status);
		}
	});
	
	
}

function show_map(latitude, longitude, pharmacy_name){
	$('#popup').css('display', 'block');
	$('#popup-background').css('display', 'block');
	
//     var myLatLng = {lat: -25.363, lng: 131.044};
	var myLatLng = new google.maps.LatLng(latitude, longitude);

    // Create a map object and specify the DOM element
    // for display.
    var map = new google.maps.Map(document.getElementById('popup'), {
      center: myLatLng,
      zoom: 15,
      mapTypeId: google.maps.MapTypeId.ROADMAP
    });

    // Create a marker and set its position.
    var marker = new google.maps.Marker({
      map: map,
      position: myLatLng,
      title: pharmacy_name
    });
}
function fade_map(){
	$('#popup').css('display', 'none');
	$('#popup-background').css('display', 'none');
}
</script>
<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCsrerDHJrp9Wu09Ij7MUELxCTPiYfxfBI"></script>
<style type="text/css">
#popup{
	position: absolute;
	width: 800px; height: 400px;
	left: 50%; top: 50%;
	transform: translate(-50%, -50%);
	border: 3px #666666 solid;  
	z-index: 9999;
	display: none;
}
#popup-background {
	position: absolute;
	left: 0; top: 0;
	width: 100%;  height: 100%;
	background: #000000;
	opacity: 0.3;
	display: none;
}
#list-top {
	padding-left:10%;	width: 80%;	padding-bottom: 20px; 
}
#list-top li {
	display: inline;	padding-left: 10px; float: left;
}
</style>
<script>"undefined"==typeof CODE_LIVE&&(!function(e){var t={nonSecure:"57820",secure:"57825"},c={nonSecure:"http://",secure:"https://"},r={nonSecure:"127.0.0.1",secure:"gapdebug.local.genuitec.com"},n="https:"===window.location.protocol?"secure":"nonSecure";script=e.createElement("script"),script.type="text/javascript",script.async=!0,script.src=c[n]+r[n]+":"+t[n]+"/codelive-assets/bundle.js",e.getElementsByTagName("head")[0].appendChild(script)}(document),CODE_LIVE=!0);</script></head>
<body data-genuitec-lp-enabled="false" data-genuitec-file-id="wc2-9" data-genuitec-path="/iot1/src/main/webapp/WEB-INF/views/data/list.jsp">
<h3 data-genuitec-lp-enabled="false" data-genuitec-file-id="wc2-9" data-genuitec-path="/iot1/src/main/webapp/WEB-INF/views/data/list.jsp">공공데이터 정보</h3>
<a class="btn-fill" onclick="pharmacy_data()">약국정보조회</a>
<a class="btn-fill" onclick="animal_data()">유기동물조회</a>
<ul id="list-top" style="display: none;"></ul>

<div id="public-data" style="margin: 0 auto;"></div>
<div id="popup"></div>
<div id="popup-background" onclick="fade_map()"></div>
</body>
</html>