<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="//code.jquery.com/jquery-1.11.3.min.js"></script>
<title>Insert title here</title>
<style>
.remoteVideo {
	margin-top: 20px;
	margin-bottom: 20px;
	width: 320px;
	height: 240px;
}
.MyVideo {
	margin-top: 20px;
	margin-bottom: 20px;
	width: 320px;
	height: 240px;
}
</style>
</head>
<body>
	<form>
		<label for="connectChannelID">Channel ID</label> <input type="text"
			id="connectChannelID">
		<button id="createChannelButton">Create Channel</button>
		<button id="connectChannelButton">Connect Channel</button>
	</form>
	<h1>채널 목록</h1>
	<div class="channelList"></div>
	<!-- 상대방이 보일 비디오 태그 -->
	<div id="container"></div>
	<video class="MyVideo" id="MyVideo"></video>
	<video class="remoteVideo" id="remoteVideo"></video>
	<script src="http://www.playrtc.com/sdk/js/playrtc.js"></script>
	<script>
    'use strict';
    var connectChannelID = document.querySelector("#connectChannelID"), createChannelButton = document
        .querySelector("#createChannelButton"), connectChannelButton = document
        .querySelector("#connectChannelButton"), playrtc;

    playrtc = new PlayRTC({
      projectKey : "03bceae2-660f-4aba-8235-2fc16d339aea", // 프로젝트키 할당
      remoteMediaTarget : "remoteVideo" // 미디어가 실행될 태그를 설정
    });

    $(function() {
      channelList();
    });
    
    function addVal() {
      $('.test').on('click', function(){
        var txt = $(this).text();
        $("#connectChannelID").val(txt);
        connectChannelButton.click();
        
    	}); 
    }

    // 채널리스트를 불러와주기 위한 기능
    function channelList() {
      $(".channelList").empty();
      // 채널 전체 목록을 가져옴
      playrtc.getChannelList(function(result) {
        var div = "<table border='1'><tr><th>채널 No</th><th>채널 ID</th></tr>";
        for (var i = 0; i < result.channels.length; i++) {
          div += "<tr>";
          div += "<td>" + (i+1) + "</td>";
          div += "<td><a href='#' class='test'>";
          div += result.channels[i].channelId;
          div += "</a></td></tr>";
        }
        div+= "</table>";
        $(".channelList").append(div);
        
        addVal();
        
      }, function(err) {
        console.log(err);
      });
    }
    // 채널 만드는 버튼을 눌렀을 경우 이벤트
    createChannelButton.addEventListener("click", function(e) {
      channelList();
      // 다른 이벤트 실행을 방지
      e.preventDefault();
      // 채널을 생성
     	playrtc.createChannel();asdf
    });

    playrtc.on("connectChannel", function(channelId) {
      connectChannelID.value = channelId;
    });

    // 채널 접속 버튼을 눌렀을 경우 이벤트
    connectChannelButton.addEventListener("click", function(e) {
      channelList();
      // 다른 이벤트 실행을 방지
      e.preventDefault();

      var channelId = connectChannelID.value;

      // 채널 아이디가 비어있을 경우
      if (!channelId) {

      } else {
        playrtc.connectChannel(channelId);
      }
    }, false);
  </script>
</body>
</html>