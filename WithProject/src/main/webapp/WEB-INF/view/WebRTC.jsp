<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
	.remoteVideo {
		margin-top: 20px;
		margin-bottom: 20px;
		width: 320px;
		height: 240px;
	}
</style>
</head>
<body>
	<form>
		<label for="connectChannelID">Channel ID</label>
		<input type="text" id="connectChannelID">
		<button id="createChannelButton">Create Channel</button>
		<button id="connectChannelButton">Connect Channel</button>
	</form>
	<!-- 상대방이 보일 비디오 태그 -->
	<video class="remoteVideo" id="remoteVideo"></video> 
	<script src="http://www.playrtc.com/sdk/js/playrtc.js"></script>
	<script>
		'use strict';
		
		var connectChannelID = document.querySelector("#connectChannelID"),
			createChannelButton = document.querySelector("#createChannelButton"),
			connectChannelButton = document.querySelector("#connectChannelButton"),
			playrtc;
		
		playrtc = new PlayRTC({
		  projectKey: "60ba608a-e228-4530-8711-fa38004719c1", // 프로젝트키 할당
		  remoteMediaTarget: "remoteVideo"										// 미디어가 실행될 태그를 설정
		});
		
		// 채널 만드는 버튼을 눌렀을 경우 이벤트
		createChannelButton.addEventListener("click", function(e) {
      // 다른 이벤트 실행을 방지
      e.preventDefault();
      // 채널을 생성
      playrtc.createChannel();
    });
		
		playrtc.on("connectChannel", function(channelId) {
		  connectChannelID.value = channelId;
    });
		
		// 채널 접속 버튼을 눌렀을 경우 이벤트
		connectChannelButton.addEventListener("click", function(e) {
		  // 다른 이벤트 실행을 방지
		  e.preventDefault();
		  
		  var channelId = connectChannelID.value;
		  
		  // 채널 아이디가 비어있을 경우
		  if(!channelId) {
		    playrtc.getChannelList
		  }
		  else {
			  playrtc.connectChannel(channelId);
		  }
    }, false);
		
	</script>
</body>
</html>