/<%@ page language="java" contentType="text/html; charset=UTF-8"
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
<script type="text/javascript"	src="http://apis.daum.net/maps/maps3.js?apikey=ed9f2771750f83351d39d6973594a653"></script>
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

            //위치 정보와 인포윈도우에 표시할 정보
            var locations = 
              	[
                	[37.67320854233434, 128.70530754830628, "<img alt='' style='height:50px; width:50px;' src='../img/sample.jpg'><a href='#'>1번</a>" ],
                	[37.6732922, 128.7065569, "2번"]
                	// 마커를 추가해야하는 경우 이 부분에 추가해줘야함
                ];
            for (i = 0; i < locations.length; i++) {
              
              // 다중 마커 locations[i][0] 경도, location[i][1] 위도
              var marker = new daum.maps.Marker({
                position : new daum.maps.LatLng(locations[i][0], locations[i][1])
              });
              marker.setMap(map);

              // 마커가 클릭됐을때 인포 윈도우를 띄워주는 함수
              daum.maps.event.addListener(marker,'click', (function(marker, i) {
                        return function() {
                          var infowindow = new daum.maps.InfoWindow(
                              {
                                content : '<p style="margin:7px 22px 7px 12px;font:12px/1.5 sans-serif">'
                                    + locations[i][2] + '</p>',
                                removable : true
                              });
                          infowindow.open(map, marker);
                        }
              })(marker, i));
            }
            
            // 지도의 중심점이 바뀔 경우 호출되는 함수
            daum.maps.event.addListener(map, 'center_changed', function() {        
              // 지도의  레벨을 얻어옵니다
              var level = map.getLevel();
              // 지도의 중심좌표를 얻어옵니다 
              var latlng = map.getCenter(); 
              // 지도의 중심 변경에 따른 확인문
              var message = '지도 레벨 : ' + level + ', 중심 좌표 : 위도 ' + latlng.getLat() + ', 경도 ' + latlng.getLng(); 
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
</body>
</html>