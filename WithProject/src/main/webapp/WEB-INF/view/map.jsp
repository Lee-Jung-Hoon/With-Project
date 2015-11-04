<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
html {
	height: 100%
}

body {
	height: 100%;
	margin: 0;
	padding: 0
}

h1 {
	text-align: center
}

a {
	font-weight: bold;
}

#map {
	width: 90%;
	height: 80%;
	border: solid blue;
	margin-left: auto;
	margin-right: auto
}
</style>
<script
	src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDMregcOHkXcoTLTMUEUvTxWcLPRjr2fe8&callback=initMap"
	async defer></script>
<script type="text/javascript">
  window.initMap = function() {
    if (navigator.geolocation) {
      navigator.geolocation.getCurrentPosition(function(position) {
				
        var latitude = position.coords.latitude;
        var longitude = position.coords.longitude;
        
        var position = new google.maps.LatLng(position.coords.latitude,
            position.coords.longitude);

        
        
        
        var map = new google.maps.Map(document.getElementById('map'), {
          center : position,
          zoom : 17,
          mapTypeId : google.maps.MapTypeId.ROADMAP
        });
        // 지도를 클릭한 위치에 표출할 마커입니다
        var marker = new google.maps.Marker({
          // 지도 중심좌표에 마커를 생성합니다 
          position : map.getCenter()
        });
        // 지도에 마커를 표시합니다
        marker.setMap(map);
 					
        // 지도에 클릭 이벤트를 등록합니다
        // 지도를 클릭하면 마지막 파라미터로 넘어온 함수를 호출합니다
        google.maps.event.addListener(map, 'click', function(mouseEvent) {
          // 클릭한 위도, 경도 정보를 가져옵니다 
          var latlng = mouseEvent.latLng;
          // 마커 위치를 클릭한 위치로 옮깁니다
          console.log(latlng);
          marker.setPosition(latlng);
          addMarker(event.latLng, map);
     
          var message = "<a href='#' > 테스트 </a>"; 
          var infowindow = new google.maps.InfoWindow( 
              { content: message,
                size: new google.maps.Size(100,100) 
              })
 					 infowindow.open(map, marker);
        });
        function addMarker(location, map) {
          // Add the marker at the clicked location, and add the next-available label
          // from the array of alphabetical characters.
          var marker = new google.maps.Marker({
            position: location,
            map: map
          });
        }
      })
    }
  };
</script>
</head>
<body>
	<div id="map"></div>
</body>
</html>