<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="../css/example.css" />
<link rel="stylesheet" type="text/css" href="../css/main.css" />
<script src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
<script type="text/javascript" src="../js/jquery.pinto.js"></script>
<script type="text/javascript" src="../js/main.js"></script>
<script type="text/javascript">
  $(document).ready(function() {

  });
  $(window).scroll(function() {
    $('.banner-wing').animate({
      top : $(window).scrollTop() + 600 + "px"
    }, {
      queue : false,
      duration : 350
    });
  });
</script>
</head>
<body>
	<div class="wrapper">

		<div class="top-layer">
			<input type="text" class="input01" /> <input type="button"
				class="input02" value="검색" />
		</div>
		<div class="container-wrap">
			<div class="banner-wing">
				<input type="button" value="굥워니"
					style="display: block; width: 50px; height: 50px;'" /> <input
					type="button" value="수리용"
					style="display: block; width: 50px; height: 50px;'" />
			</div>
			<div id="container" class="img-layer">
				<div class="img-inner" style="height: 300px;">
					<input type="text" />
					<div class="button-inner">
						<button>버튼1</button>
						<button>버튼2</button>
					</div>
					<span class="txt">테스트 글입니다테스트 글입니다테스트 글입니다테스트 글입니다</span>
				</div>
				<div class="img-inner">
					<span class="img"><img src="../img/sample.jpg" alt="" /></span> 
					<span class="txt">테스트 글입니다asgsdgasdgasdgasdg테스트 글입니다</span>
				</div>
				<div class="img-inner">
					<span class="img"><img src="../img/sample.jpg" alt="" /></span> 
					<span	class="txt">테스트 글입니다테스트 sadhasdhasdhasdhasdh글입니다</span>
				</div>
	
			</div>
		</div>
	</div>
</body>
</body>
</html>