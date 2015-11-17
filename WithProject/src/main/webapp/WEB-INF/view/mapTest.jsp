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
<script type="text/javascript" src="http://code.jquery.com/jquery-2.0.3.min.js"></script>
<script type="text/javascript">
$(document).ready(function () {
  if (navigator.geolocation) {
    navigator.geolocation.getCurrentPosition(function(position) {

  var mapContainer = document.getElementById('map'), // 지도를 표시할 div  
  mapOption = { 
      center: new daum.maps.LatLng(position.coords.latitude,  position.coords.longitude), // 지도의 중심좌표
      level: 3 // 지도의 확대 레벨
  };

var map = new daum.maps.Map(mapContainer, mapOption); // 지도를 생성합니다


daum.maps.event.addListener(map, 'click', function(mouseEvent) {        
  
  // 클릭한 위도, 경도 정보를 가져옵니다 
  var latlng = mouseEvent.latLng; 
  
  var message = '클릭한 위치의 위도는 ' + latlng.getLat() + ' 이고, ';
  message += '경도는 ' + latlng.getLng() + ' 입니다';
  
  console.log(message);
});


var circle = new daum.maps.Circle({
  center : new daum.maps.LatLng(position.coords.latitude, position.coords.longitude),  // 원의 중심좌표 입니다 
  radius: 250, // 미터 단위의 원의 반지름입니다 
  strokeWeight: 4, // 선의 두께입니다 
  strokeColor: '#75B8FA', // 선의 색깔입니다
  strokeOpacity: 0.5, // 선의 불투명도 입니다 1에서 0 사이의 값이며 0에 가까울수록 투명합니다
  strokeStyle: 'solid', // 선의 스타일 입니다
  fillColor: 'transparent', // 채우기 색깔입니다
  fillOpacity: 0.7  // 채우기 불투명도 입니다   
}); 

//지도에 원을 표시합니다 
circle.setMap(map); 


//지도에 표시된 마커 객체를 가지고 있을 배열입니다
var markers = [];

// markers 배열에 경도 위도 객체 추가
$.getJSON("/WithProject/studygroup/mapList.json",function(data){
  $(data).each(function(idx, obj){
    addMarker(new daum.maps.LatLng( obj.groupActiveLatitude,  obj.groupActiveLongitude));
   }); 
});

//마커를 생성하고 지도위에 표시하는 함수입니다
function addMarker(position) {  
  // 마커를 생성합니다
  var marker = new daum.maps.Marker({
      position: position
  });

  // 마커가 지도 위에 표시되도록 설정합니다
  marker.setMap(map);
  
  // 생성된 마커를 배열에 추가합니다
  markers.push(marker);
}

//배열에 추가된 마커들을 지도에 표시하거나 삭제하는 함수입니다
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