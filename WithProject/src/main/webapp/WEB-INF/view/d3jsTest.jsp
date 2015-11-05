<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="http://d3js.org/d3.v3.min.js"></script>
<script src="${pageContext.request.contextPath}/js/liquidFillGauge.js"></script>
<style>
	.liquidFillGaugeText {
		font-family: Helvetica;
		font-weight: bold;
	}
</style>
</head>
<body>
<svg id="fillgauge6" width="19%" height="200" onclick="gauge6.update(5
    );"></svg>
<script language="JavaScript">
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
    config5.minValue = 1;
    config5.maxValue = 100
    config5.displayPercent = false;
    var gauge6 = loadLiquidFillGauge("fillgauge6", 1, config5);

    function NewValue(){
      return Math.round(Math.random()*100);
    }
</script>
</body>
</html>