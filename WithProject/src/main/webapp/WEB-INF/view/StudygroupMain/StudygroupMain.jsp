<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width">
<title>스터디 메인 | WITH 스터디</title>
<%@ include file="/WEB-INF/view/include/common_top.jsp"%>
    <script src="http://d3js.org/d3.v3.min.js" language="JavaScript"></script>
    <script src="${pageContext.request.contextPath}/js/liquidFillGauge.js" language="JavaScript"></script>
</head>
<body class="page-sub">
	<%@ include file="/WEB-INF/view/include/common_header.jsp"%>
	<main>
   <div class="container">
   	<div class='main-title'>
   		<strong style="font-weight: bold;">스터디그룹 자바프라푸치노</strong>
 			<a style="color:#333; text-shadow: 2px 2px 4px #000000;" href='http://map.daum.net/link/map/남산타워,126.99103756996934,37.54793187817988' target='_blank'>
 			<img style="height: 20px;" alt="" src="http://www.iconarchive.com/download/i57835/icons-land/vista-map-markers/Map-Marker-Marker-Outside-Pink.ico">남산타워</a>
   	</div>
   	

 
			<div class='graph1-2'>
				<div class='graph1-2-1'>스터디그룹 멤버</div>
				<div class="graph1-2-2">최근 등록 일정</div>
			</div>
<div class='graph1-1'>
<svg id="fillgauge1" width="97%" height="250" onclick="gauge1.update(NewValue());"></svg>
<svg id="fillgauge2" width="19%" height="200" onclick="gauge2.update(NewValue());"></svg>
<svg id="fillgauge3" width="19%" height="200" onclick="gauge3.update(NewValue());"></svg>
<svg id="fillgauge4" width="19%" height="200" onclick="gauge4.update(NewValue());"></svg>
<svg id="fillgauge5" width="19%" height="200" onclick="gauge5.update(NewValue());"></svg>
<svg id="fillgauge6" width="19%" height="200" onclick="gauge6.update(NewValue());"></svg>
<script language="JavaScript">
    var gauge1 = loadLiquidFillGauge("fillgauge1", 55);
    var config1 = liquidFillGaugeDefaultSettings();
    config1.circleColor = "#FF7777";
    config1.textColor = "#FF4444";
    config1.waveTextColor = "#FFAAAA";
    config1.waveColor = "#FFDDDD";
    config1.circleThickness = 0.2;
    config1.textVertPosition = 0.2;
    config1.waveAnimateTime = 1000;
    var gauge2= loadLiquidFillGauge("fillgauge2", 28, config1);
    var config2 = liquidFillGaugeDefaultSettings();
    config2.circleColor = "#D4AB6A";
    config2.textColor = "#553300";
    config2.waveTextColor = "#805615";
    config2.waveColor = "#AA7D39";
    config2.circleThickness = 0.1;
    config2.circleFillGap = 0.2;
    config2.textVertPosition = 0.8;
    config2.waveAnimateTime = 2000;
    config2.waveHeight = 0.3;
    config2.waveCount = 1;
    var gauge3 = loadLiquidFillGauge("fillgauge3", 60.1, config2);
    var config3 = liquidFillGaugeDefaultSettings();
    config3.textVertPosition = 0.8;
    config3.waveAnimateTime = 5000;
    config3.waveHeight = 0.15;
    config3.waveAnimate = false;
    config3.waveOffset = 0.25;
    config3.valueCountUp = false;
    config3.displayPercent = false;
    var gauge4 = loadLiquidFillGauge("fillgauge4", 50, config3);
    var config4 = liquidFillGaugeDefaultSettings();
    config4.circleThickness = 0.15;
    config4.circleColor = "#808015";
    config4.textColor = "#555500";
    config4.waveTextColor = "#FFFFAA";
    config4.waveColor = "#AAAA39";
    config4.textVertPosition = 0.8;
    config4.waveAnimateTime = 1000;
    config4.waveHeight = 0.05;
    config4.waveAnimate = true;
    config4.waveRise = false;
    config4.waveHeightScaling = false;
    config4.waveOffset = 0.25;
    config4.textSize = 0.75;
    config4.waveCount = 3;
    var gauge5 = loadLiquidFillGauge("fillgauge5", 60.44, config4);
    var config5 = liquidFillGaugeDefaultSettings();
    config5.circleThickness = 0.4;
    config5.circleColor = "#6DA398";
    config5.textColor = "#0E5144";
    config5.waveTextColor = "#6DA398";
    config5.waveColor = "#246D5F";
    config5.textVertPosition = 0.52;
    config5.waveAnimateTime = 5000;
    config5.waveHeight = 0;
    config5.waveAnimate = false;
    config5.waveCount = 2;
    config5.waveOffset = 0.25;
    config5.textSize = 1.2;
    config5.minValue = 30;
    config5.maxValue = 150
    config5.displayPercent = false;
    var gauge6 = loadLiquidFillGauge("fillgauge6", 120, config5);

    function NewValue(){
        if(Math.random() > .5){
            return Math.round(Math.random()*100);
        } else {
            return (Math.random()*100).toFixed(1);
        }
    }
</script>
</div>






 	<div class='graph1-1' style="    overflow: hidden;">
   		<div style="width: 20%;   float: left;    text-align: center;    font-size: 35px;">스터디 소개</div>
   		<div style="    float: right;    width: 80%;    font-size: 15px;">
   		스터디는 일상에서 대화하게 되는 다양한 주제에 대해서 그때 쓸 수 있는 표현과 단어를 배우고, 배운 내용들을 활용해 보면서 진행됩니다.<br/>
전 한국어를 잘 알아들을 수 있지만, 제가 한국어를 쓰진 않을거에요~ <br/>
여러분이 영어를 많이 쓰실 수 있는 환경을 만들고.. 대신 모르는게 있으면 한국어로 얘기하면 알려드릴게요!<br/>
<br/>
1. Greetings with class - Tell me something interesting about your week?
<br/>
일주일 만에 만나는 우리! 지난 한주는 어땠나요? 영어로 말해봐요~
<br/><br/>
2. Introduction video on topic for lesson - something fun.
<br/>
오늘 다룰 주제에 관련된 비디오를 봅니다. 재미있는 영상자료를 준비할거에요!
<br/><br/>
3. Learn something new! Useful English idioms and phrases.
<br/>
새로운 걸 배워야겠죠? 오늘의 주제에 대해 얘기할 땐, 어떤 표현과 어떤 단어를 쓸수 있는지?
미국인들을 일상대화에서 어떤 말들을 쓰는지! 진짜 유용하게 쓰이는 표현들만 하나씩 배웁니다. 
<br/><br/>
4. Practice what we learned.<br/>
오늘 배운 내용으로 같이 대화해봐요~~ 스피킹이 느는 가장 좋은 방법은, 말그래도 말을 해보는 것!
<br/><br/>
5. Play game, or watch video to help remember our topic.<br/>
배운 내용들을 review할거에요. 게임을 할 수도 있고, 관련된 영상을 더 볼 수 있겠죠?
<br/><br/>
6. Success!
<br/><br/>
<br/>
이런 분들이 오시면 좋아요
- 교과서식 표현에서 벗어나, 생활 영어 표현을 배우고 싶어요.
- 문법은 아는데 말이 잘 안나와요~
<br/><br/>
참가자 레벨
- 일상적인 대화가 바로바로 문장으로 안나오는 초급이에요.
<br/>
</div>
</div>




			<div class='graph1-2'>
				<div class='graph1-2-1'>최근 과제 게시판 글보기</div>
				<div class="graph1-2-2">최근 등록 일정</div>
			</div>
		</div>
	</main>
</body>
</html>
