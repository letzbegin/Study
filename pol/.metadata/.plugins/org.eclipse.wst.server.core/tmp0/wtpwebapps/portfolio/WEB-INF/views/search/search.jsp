<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

</head>
<body>
	<div class="container-fluid text-center">
		<div class="row content">
			<div class="col-sm-8">
				<h2 id="region-name">선택지역</h2>
				<div id="korea" style="width: 600px; height: 800px;"></div>
				<script type="text/javascript" src="js/raphael-min.js"></script>
				<script type="text/javascript" src="js/korea.js"></script>
			</div>
			<div class="col-sm-1">
				<div id="sido-data" style="margin: 0 auto;"></div>
			</div>
			<div class="col-sm-3">
				
<!-- 				<div id="popup-background" onclick="fade_map()"></div> -->
			</div>
		</div>
	</div>

	<!-- Modal -->
	 
  <div class="modal fade" id="mypar" role="dialog">
    <div class="modal-dialog">
    
      Modal content
      <div class="modal-content">
        <div class="modal-header" style="padding:35px 50px;">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4><span class="glyphicon glyphicon-list-alt"></span> 약국 리스트</h4>
        </div>
        <div class="modal-body" style="padding:40px 50px;">
          <div id="public-data" style="margin: 0 auto;"></div>
        </div>
        <div class="modal-footer">
        	<div id="popup"></div>
        	<div id="googleMap" style="height:400px;width:100%;" onclick="fade_map()"></div>
          <button type="submit" class="btn btn-danger btn-default pull-right" data-dismiss="modal"><span class="glyphicon glyphicon-remove"></span> Cancel</button>
        </div>
      </div>
    </div>
  </div>
   
</body>
<script type="text/javascript">
	function show_map(latitude, longitude, pharmacy_name) {
// 		$('#popup').css('display', 'block');
// 		$('#popup-background').css('display', 'block');

		//     var myLatLng = {lat: -25.363, lng: 131.044};
		var myLatLng = new google.maps.LatLng(latitude, longitude);

		// Create a map object and specify the DOM element
		// for display.
		var map = new google.maps.Map(document.getElementById('googleMap'), {
			center : myLatLng,
			zoom : 15,
			mapTypeId : google.maps.MapTypeId.ROADMAP
		});

		// Create a marker and set its position.
		var marker = new google.maps.Marker({
			map : map,
			position : myLatLng,
			title : pharmacy_name
		});
		marker.setMap(map);
	}
	function fade_map() {
		$('#popup').css('display', 'none');
		$('#popup-background').css('display', 'none');
	}
	
	function go_search(gun){
		$.ajax({
			url: 'data/pharmacy',
			data : { gungu:gun},
			success: function( data ){
				var tag = "<table>";
				$(data).find('item').each(function(idx){
					var map_data = $(this).find('wgs84Lat').text()+','
								+  $(this).find('wgs84Lon').text()+',"'
								+  $(this).find('dutyName').text()+'"';

					tag += "<tr><td>"+ (idx+1) +"</td>"
						+  "<td><a onclick='show_map("+ map_data+ ")'>"+$(this).find('dutyName').text() + "</a></td>"
						+  "<td>"+$(this).find('dutyTel1').text() + "</td>"
						+  "<td>"+$(this).find('dutyAddr').text() + "</td>";
					tag += "</tr>";
				});
				tag += "<table>";
				$('#public-data').html(tag);
				$("#mypar").modal();
			},
			error: function(req, status){
				alert(status+": "+req.status);
			}
		});
	} 
	
	
</script>
<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCsrerDHJrp9Wu09Ij7MUELxCTPiYfxfBI"></script>

</html>