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
<script type="text/javascript"
	src="http://code.jquery.com/jquery-2.0.3.min.js"></script>
<script type="text/javascript">
  $(document).ready( function() { 
        if (navigator.geolocation) {
          navigator.geolocation.getCurrentPosition(function(position) {
            var mapContainer = document.getElementById('map'), // 지도를 표시할 div  
            // 맵 옵션
            mapOption = {
              center : new daum.maps.LatLng(position.coords.latitude, position.coords.longitude), // 지도의 중심좌표
              level : 4 // 지도의 확대 레벨
            };

            var map = new daum.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
            
            var imageSrc = 'https://cdn3.iconfinder.com/data/icons/map/500/around_me-512.png', // 마커이미지의 주소입니다    
            		imageSize = new daum.maps.Size(64, 69), // 마커이미지의 크기입니다
            		imageOption = {offset: new daum.maps.Point(27, 69)}; // 마커이미지의 옵션입니다. 마커의 좌표와 일치시킬 이미지 안에서의 좌표를 설정합니다.
              
        		// 마커의 이미지정보를 가지고 있는 마커이미지를 생성합니다
        		var markerImage = new daum.maps.MarkerImage(imageSrc, imageSize, imageOption),
            		markerPosition = new daum.maps.LatLng(position.coords.latitude, position.coords.longitude); // 마커가 표시될 위치입니다

        		// 마커를 생성합니다
        		var mark = new daum.maps.Marker({
           			position: markerPosition, 
            		image: markerImage // 마커이미지 설정 
        		});

        		// 마커가 지도 위에 표시되도록 설정합니다
        		mark.setMap(map);

            var circle = new daum.maps.Circle({
              center : new daum.maps.LatLng(position.coords.latitude, position.coords.longitude), // 원의 중심좌표 
              radius : 1000, // 미터 단위의 원의 반지름 
              strokeWeight : 4, // 선의 두께
              strokeColor : '#75B8FA', // 선의 색깔
              strokeOpacity : 0.5, // 선의 불투명도 1에서 0 사이의 값이며 0에 가까울수록 투명
              strokeStyle : 'solid', // 선의 스타일
              fillColor : 'transparent', // 채우기 색깔
              fillOpacity : 0.7 // 채우기 불투명도   
            });

            //지도에 원을 표시
            circle.setMap(map);
            
            //지도에 표시된 마커 객체를 가지고 있을 배열
            var markers = [];

            $.getJSON("/WithProject/studygroup/mapList.json", function(data) {
              $(data).each(function(idx, obj) {
                
                // 반경 내 거리 계산을 위한 부분
                var lat1 = position.coords.latitude;
                var lon1 = position.coords.longitude;
                
                var lat2 = obj.groupActiveLatitude;
                var lon2 = obj.groupActiveLongitude;
           	    var theta;
           	    var dist;  
           	    theta = lon1 - lon2;  
           	    dist = Math.sin((lat1* Math.PI / 180.0)) * Math.sin((lat2* Math.PI / 180.0)) + Math.cos((lat1* Math.PI / 180.0))   
           	          * Math.cos((lat2* Math.PI / 180.0)) * Math.cos((theta* Math.PI / 180.0));  
           	    dist = Math.acos(dist);  
           	    dist = (dist* 180.0 / Math.PI);  
            	      
           	    dist = dist * 60 * 1.1515;   
           	    dist = dist * 1.609344;    // 단위 mile 에서 km 변환.  
           	    dist = dist * 1000.0;      // 단위  km 에서 m 로 변환  
           	    console.log("중심점과의 거리 : " + dist+"M");
               
           	    if(dist < 1000) {
                  // markers 배열에 경도 위도 객체 추가
	                addMarker(new daum.maps.LatLng(obj.groupActiveLatitude, obj.groupActiveLongitude));
           	    }
              });
            });

            //마커를 생성하고 지도위에 표시하는 함수
            function addMarker(position) {
              // 마커를 생성합니다
              var marker = new daum.maps.Marker({
                position : position
              });

              // 마커가 지도 위에 표시되도록 설정
              marker.setMap(map);

              // 생성된 마커를 배열에 추가
              markers.push(marker);
            }

            //배열에 추가된 마커들을 지도에 표시
            function setMarkers(map) {
              for (var i = 0; i < markers.length; i++) {
                markers[i].setMap(map);
              }
            }
          })
        }
      });
</script>
</head>
<body>
	<div id="map"></div>
</body>
</html>