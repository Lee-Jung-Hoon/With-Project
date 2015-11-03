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
<script type="text/javascript"
	src="http://apis.daum.net/maps/maps3.js?apikey=ed9f2771750f83351d39d6973594a653"></script>
<script type="text/javascript">
  window.onload = function() {
    // 현재 위치를 얻어올 수 있는 경우
    if (navigator.geolocation) {
      navigator.geolocation.getCurrentPosition(function(position) {
            // 지도의 중심 설정
            var position = new daum.maps.LatLng(position.coords.latitude, position.coords.longitude);
						// position.coords.latitude 현재 사용자의 경도
						// position.coords.longitude 현재 사용자의 위도
            
            // 지도 표시를 위한 기본 설정
            var map = new daum.maps.Map(document.getElementById('map'), {
              center : position,
              level : 5,
              mapTypeId : daum.maps.MapTypeId.ROADMAP
            });
						

            // 지도 컨트롤러 표시
            var zoomControl = new daum.maps.ZoomControl();
            map.addControl(zoomControl, daum.maps.ControlPosition.RIGHT);
            var mapTypeControl = new daum.maps.MapTypeControl();
            map.addControl(mapTypeControl, daum.maps.ControlPosition.TOPRIGHT);
            

         // 지도를 클릭한 위치에 표출할 마커입니다
         var marker = new daum.maps.Marker({ 
             // 지도 중심좌표에 마커를 생성합니다 
             position: map.getCenter() 
         }); 
         // 지도에 마커를 표시합니다
         marker.setMap(map);

         // 지도에 클릭 이벤트를 등록합니다
         // 지도를 클릭하면 마지막 파라미터로 넘어온 함수를 호출합니다
         daum.maps.event.addListener(map, 'click', function(mouseEvent) {        
             // 클릭한 위도, 경도 정보를 가져옵니다 
             var latlng = mouseEvent.latLng; 
             // 마커 위치를 클릭한 위치로 옮깁니다
             marker.setPosition(latlng);
             
             var message = '클릭한 위치의 위도 : ' + latlng.getLat() + '경도 : ' + latlng.getLng();
             console.log(message);
             
         });
       })
    }
    // 현재 위치를 얻어오지 못하는 경우
    else {
      alert("현재 위치 정보를 얻어오지 못했습니다.");
    }
  }
</script>
</head>
<body>
	<div id="map"></div>
	<div id="fb-root"></div>
<script>(function(d, s, id) {
  var js, fjs = d.getElementsByTagName(s)[0];
  if (d.getElementById(id)) return;
  js = d.createElement(s); js.id = id;
  js.src = "//connect.facebook.net/ko_KR/sdk.js#xfbml=1&version=v2.5";
  fjs.parentNode.insertBefore(js, fjs);
}(document, 'script', 'facebook-jssdk'));</script>
<div class="fb-login-button" data-max-rows="1" data-size="medium" data-show-faces="true" data-auto-logout-link="false"></div>
</body>
</html>