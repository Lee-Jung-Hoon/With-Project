<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html lang="ko">
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width">
	<title>제목</title>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/reset.css" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/style.css" />
	<script src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
	<script src="http://code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
	<script src="${pageContext.request.contextPath}/js/main.function.js"></script>
</head>
<body>
	<div class="dark-layer"></div>
	<header>
		<div class="search" style="text-align: center;">
			<input type="text" size="50px" placeholder="  검색어를 입력해주세요" />
			<input type="button" value="검색">
		</div>
	</header>
	<main>
		<div id="container" class="img-layer">

			<div class="img-wrap" style="height:200px;">
				<span class="img">로그인</span>
				<span class="txt"><input type="text" /></span>
				<button type="button">버튼1</button>
				<button type="button">버튼2</button>
			</div>
			
			<div class="img-wrap">
				<div class="img-content">					
					<div class="img-inner">
						<span class="img"><img src="${pageContext.request.contextPath}/images/sample.jpg" alt="" /></span>
						<span class="txt">테스트 글입니다테스트 글입니다테스트 글입니다테스트 글입니다</span>
					</div>
					<div class="spine">
						<a href="#">상세보기</a>
					</div>
				</div>
			</div>

			<div class="img-wrap">
				<div class="img-content">					
					<div class="img-inner">
						<span class="img"><img src="${pageContext.request.contextPath}/images/sample1.jpg" alt="" /></span>
						<span class="txt">테스트 </span>
					</div>
					<div class="spine">
						<a href="#">상세보기</a>
					</div>
				</div>
			</div>

			<div class="img-wrap">
				<div class="img-content">					
					<div class="img-inner">
						<span class="img"><img src="${pageContext.request.contextPath}/images/sample.jpg" alt="" /></span>
						<span class="txt">테스트 글입니다테스트 글입니다테스트 글입니다테스트 글입니다</span>
					</div>
					<div class="spine">
						<a href="#">상세보기</a>
					</div>
				</div>
			</div>

			<div class="img-wrap">
				<div class="img-content">					
					<div class="img-inner">
						<span class="img"><img src="${pageContext.request.contextPath}/images/sample2.jpg" alt="" /></span>
						<span class="txt">테스트 글입니다테스트 글입니다테스트 글입니다테스트 글입니다</span>
					</div>
					<div class="spine">
						<a href="#">상세보기</a>
					</div>
				</div>
			</div>

			<div class="img-wrap">
				<div class="img-content">					
					<div class="img-inner">
						<span class="img"><img src="${pageContext.request.contextPath}/images/sample3.jpg" alt="" /></span>
						<span class="txt">테스트 글입니다테스트 글입니다</span>
					</div>
					<div class="spine">
						<a href="#">상세보기</a>
					</div>
				</div>
			</div>		

			<div class="img-wrap">
				<div class="img-content">					
					<div class="img-inner">
						<span class="img"><img src="${pageContext.request.contextPath}/images/sample.jpg" alt="" /></span>
						<span class="txt">테스트 글입니다테스트 글입니다테스트 글입니다테스트 글입니다테스트 글입니다테스트 글입니다테스트 글입니다테스트 글입니다테스트 글입니다테스트 글입니다테스트 글입니다테스트 글입니다테스트 글입니다테스트 글입니다테스트 글입니다테스트 글입니다</span>
					</div>
					<div class="spine">
						<a href="#">상세보기</a>
					</div>
				</div>
			</div>

			<div class="img-wrap">
				<div class="img-content">					
					<div class="img-inner">
						<span class="img"><img src="${pageContext.request.contextPath}/images/sample4.jpg" alt="" /></span>
						<span class="txt">테스트 글입니다테스트 글입니다테스트 글입니다테스트 글입니다테스트 글입니다테스트 글입니다테스트 글입니다테스트 글입니다테스트 글입니다테스트 글입니다테스트 글입니다테스트 글입니다테스트 글입니다테스트 글입니다테스트 글입니다테스트 글입니다</span>
					</div>
					<div class="spine">
						<a href="#">상세보기</a>
					</div>
				</div>
			</div>

			<div class="img-wrap">
				<div class="img-content">					
					<div class="img-inner">
						<span class="img"><img src="${pageContext.request.contextPath}/images/sample.jpg" alt="" /></span>
						<span class="txt">테스트 글입니다테스트 글입니다테스트 글입니다테스트 글입니다테스트 글입니다테스트 글입니다테스트 글입니다테스트 글입니다테스트 글입니다테스트 글입니다테스트 글입니다테스트 글입니다테스트 글입니다테스트 글입니다테스트 글입니다테스트 글입니다</span>
					</div>
					<div class="spine">
						<a href="#">상세보기</a>
					</div>
				</div>
			</div>

			<div class="img-wrap">
				<div class="img-content">					
					<div class="img-inner">
						<span class="img"><img src="${pageContext.request.contextPath}/images/sample.jpg" alt="" /></span>
						<span class="txt">테스트</span>
					</div>
					<div class="spine">
						<a href="#">상세보기</a>
					</div>
				</div>
			</div>
			
			<div class="img-wrap">
				<div class="img-content">					
					<div class="img-inner">
						<span class="img"><img src="${pageContext.request.contextPath}/images/sample.jpg" alt="" /></span>
						<span class="txt">테스트</span>
					</div>
					<div class="spine">
						<a href="#">상세보기</a>
					</div>
				</div>
			</div>
<!-- -->
<div class="img-wrap">
				<div class="img-content">					
					<div class="img-inner">
						<span class="img"><img src="${pageContext.request.contextPath}/images/sample.jpg" alt="" /></span>
						<span class="txt">테스트 글입니다테스트 글입니다테스트 글입니다테스트 글입니다테스트 글입니다테스트 글입니다테스트 글입니다테스트 글입니다테스트 글입니다테스트 글입니다테스트 글입니다테스트 글입니다테스트 글입니다테스트 글입니다테스트 글입니다테스트 글입니다</span>
					</div>
					<div class="spine">
						<a href="#">상세보기</a>
					</div>
				</div>
			</div><div class="img-wrap">
				<div class="img-content">					
					<div class="img-inner">
						<span class="img"><img src="${pageContext.request.contextPath}/images/sample.jpg" alt="" /></span>
						<span class="txt">테스트 글입니다테스트 글입니다테스트 글입니다테스트 글입니다테스트 글입니다테스트 글입니다테스트 글입니다테스트 글입니다테스트 글입니다테스트 글입니다테스트 글입니다테스트 글입니다테스트 글입니다테스트 글입니다테스트 글입니다테스트 글입니다</span>
					</div>
					<div class="spine">
						<a href="#">상세보기</a>
					</div>
				</div>
			</div><div class="img-wrap">
				<div class="img-content">					
					<div class="img-inner">
						<span class="img"><img src="${pageContext.request.contextPath}/images/sample.jpg" alt="" /></span>
						<span class="txt">테스트 글입니다테스트 글입니다테스트 글입니다테스트 글입니다테스트 글입니다테스트 글입니다테스트 글입니다테스트 글입니다테스트 글입니다테스트 글입니다테스트 글입니다테스트 글입니다테스트 글입니다테스트 글입니다테스트 글입니다테스트 글입니다</span>
					</div>
					<div class="spine">
						<a href="#">상세보기</a>
					</div>
				</div>
			</div><div class="img-wrap">
				<div class="img-content">					
					<div class="img-inner">
						<span class="img"><img src="${pageContext.request.contextPath}/images/sample.jpg" alt="" /></span>
						<span class="txt">테스트 글입니다테스트 글입니다테스트 글입니다테스트 글입니다테스트 글입니다테스트 글입니다테스트 글입니다테스트 글입니다테스트 글입니다테스트 글입니다테스트 글입니다테스트 글입니다테스트 글입니다테스트 글입니다테스트 글입니다테스트 글입니다</span>
					</div>
					<div class="spine">
						<a href="#">상세보기</a>
					</div>
				</div>
			</div><div class="img-wrap">
				<div class="img-content">					
					<div class="img-inner">
						<span class="img"><img src="${pageContext.request.contextPath}/images/sample.jpg" alt="" /></span>
						<span class="txt">테스트 글입니다테스트 글입니다테스트 글입니다테스트 글입니다테스트 글입니다테스트 글입니다테스트 글입니다테스트 글입니다테스트 글입니다테스트 글입니다테스트 글입니다테스트 글입니다테스트 글입니다테스트 글입니다테스트 글입니다테스트 글입니다</span>
					</div>
					<div class="spine">
						<a href="#">상세보기</a>
					</div>
				</div>
			</div><div class="img-wrap">
				<div class="img-content">					
					<div class="img-inner">
						<span class="img"><img src="${pageContext.request.contextPath}/images/sample.jpg" alt="" /></span>
						<span class="txt">테스트 글입니다테스트 글입니다테스트 글입니다테스트 글입니다테스트 글입니다테스트 글입니다테스트 글입니다테스트 글입니다테스트 글입니다테스트 글입니다테스트 글입니다테스트 글입니다테스트 글입니다테스트 글입니다테스트 글입니다테스트 글입니다</span>
					</div>
					<div class="spine">
						<a href="#">상세보기</a>
					</div>
				</div>
			</div><div class="img-wrap">
				<div class="img-content">					
					<div class="img-inner">
						<span class="img"><img src="${pageContext.request.contextPath}/images/sample.jpg" alt="" /></span>
						<span class="txt">테스트 글입니다테스트 글입니다테스트 글입니다테스트 글입니다테스트 글입니다테스트 글입니다테스트 글입니다테스트 글입니다테스트 글입니다테스트 글입니다테스트 글입니다테스트 글입니다테스트 글입니다테스트 글입니다테스트 글입니다테스트 글입니다</span>
					</div>
					<div class="spine">
						<a href="#">상세보기</a>
					</div>
				</div>
			</div><div class="img-wrap">
				<div class="img-content">					
					<div class="img-inner">
						<span class="img"><img src="${pageContext.request.contextPath}/images/sample.jpg" alt="" /></span>
						<span class="txt">테스트 글입니다테스트 글입니다테스트 글입니다테스트 글입니다테스트 글입니다테스트 글입니다테스트 글입니다테스트 글입니다테스트 글입니다테스트 글입니다테스트 글입니다테스트 글입니다테스트 글입니다테스트 글입니다테스트 글입니다테스트 글입니다</span>
					</div>
					<div class="spine">
						<a href="#">상세보기</a>
					</div>
				</div>
			</div><div class="img-wrap">
				<div class="img-content">					
					<div class="img-inner">
						<span class="img"><img src="${pageContext.request.contextPath}/images/sample.jpg" alt="" /></span>
						<span class="txt">테스트 글입니다테스트 글입니다테스트 글입니다테스트 글입니다테스트 글입니다테스트 글입니다테스트 글입니다테스트 글입니다테스트 글입니다테스트 글입니다테스트 글입니다테스트 글입니다테스트 글입니다테스트 글입니다테스트 글입니다테스트 글입니다</span>
					</div>
					<div class="spine">
						<a href="#">상세보기</a>
					</div>
				</div>
			</div><div class="img-wrap">
				<div class="img-content">					
					<div class="img-inner">
						<span class="img"><img src="${pageContext.request.contextPath}/images/sample.jpg" alt="" /></span>
						<span class="txt">테스트 글입니다테스트 글입니다테스트 글입니다테스트 글입니다테스트 글입니다테스트 글입니다테스트 글입니다테스트 글입니다테스트 글입니다테스트 글입니다테스트 글입니다테스트 글입니다테스트 글입니다테스트 글입니다테스트 글입니다테스트 글입니다</span>
					</div>
					<div class="spine">
						<a href="#">상세보기</a>
					</div>
				</div>
			</div><div class="img-wrap">
				<div class="img-content">					
					<div class="img-inner">
						<span class="img"><img src="${pageContext.request.contextPath}/images/sample.jpg" alt="" /></span>
						<span class="txt">테스트 글입니다테스트 글입니다테스트 글입니다테스트 글입니다테스트 글입니다테스트 글입니다테스트 글입니다테스트 글입니다테스트 글입니다테스트 글입니다테스트 글입니다테스트 글입니다테스트 글입니다테스트 글입니다테스트 글입니다테스트 글입니다</span>
					</div>
					<div class="spine">
						<a href="#">상세보기</a>
					</div>
				</div>
			</div><div class="img-wrap">
				<div class="img-content">					
					<div class="img-inner">
						<span class="img"><img src="${pageContext.request.contextPath}/images/sample.jpg" alt="" /></span>
						<span class="txt">테스트 글입니다테스트 글입니다테스트 글입니다테스트 글입니다테스트 글입니다테스트 글입니다테스트 글입니다테스트 글입니다테스트 글입니다테스트 글입니다테스트 글입니다테스트 글입니다테스트 글입니다테스트 글입니다테스트 글입니다테스트 글입니다</span>
					</div>
					<div class="spine">
						<a href="#">상세보기</a>
					</div>
				</div>
			</div><div class="img-wrap">
				<div class="img-content">					
					<div class="img-inner">
						<span class="img"><img src="${pageContext.request.contextPath}/images/sample.jpg" alt="" /></span>
						<span class="txt">테스트 글입니다테스트 글입니다테스트 글입니다테스트 글입니다테스트 글입니다테스트 글입니다테스트 글입니다테스트 글입니다테스트 글입니다테스트 글입니다테스트 글입니다테스트 글입니다테스트 글입니다테스트 글입니다테스트 글입니다테스트 글입니다</span>
					</div>
					<div class="spine">
						<a href="#">상세보기</a>
					</div>
				</div>
			</div><div class="img-wrap">
				<div class="img-content">					
					<div class="img-inner">
						<span class="img"><img src="${pageContext.request.contextPath}/images/sample.jpg" alt="" /></span>
						<span class="txt">테스트 글입니다테스트 글입니다테스트 글입니다테스트 글입니다테스트 글입니다테스트 글입니다테스트 글입니다테스트 글입니다테스트 글입니다테스트 글입니다테스트 글입니다테스트 글입니다테스트 글입니다테스트 글입니다테스트 글입니다테스트 글입니다</span>
					</div>
					<div class="spine">
						<a href="#">상세보기</a>
					</div>
				</div>
			</div><div class="img-wrap">
				<div class="img-content">					
					<div class="img-inner">
						<span class="img"><img src="${pageContext.request.contextPath}/images/sample.jpg" alt="" /></span>
						<span class="txt">테스트 글입니다테스트 글입니다테스트 글입니다테스트 글입니다테스트 글입니다테스트 글입니다테스트 글입니다테스트 글입니다테스트 글입니다테스트 글입니다테스트 글입니다테스트 글입니다테스트 글입니다테스트 글입니다테스트 글입니다테스트 글입니다</span>
					</div>
					<div class="spine">
						<a href="#">상세보기</a>
					</div>
				</div>
			</div><div class="img-wrap">
				<div class="img-content">					
					<div class="img-inner">
						<span class="img"><img src="${pageContext.request.contextPath}/images/sample.jpg" alt="" /></span>
						<span class="txt">테스트 글입니다테스트 글입니다테스트 글입니다테스트 글입니다테스트 글입니다테스트 글입니다테스트 글입니다테스트 글입니다테스트 글입니다테스트 글입니다테스트 글입니다테스트 글입니다테스트 글입니다테스트 글입니다테스트 글입니다테스트 글입니다</span>
					</div>
					<div class="spine">
						<a href="#">상세보기</a>
					</div>
				</div>
			</div><div class="img-wrap">
				<div class="img-content">					
					<div class="img-inner">
						<span class="img"><img src="${pageContext.request.contextPath}/images/sample.jpg" alt="" /></span>
						<span class="txt">테스트 글입니다테스트 글입니다테스트 글입니다테스트 글입니다테스트 글입니다테스트 글입니다테스트 글입니다테스트 글입니다테스트 글입니다테스트 글입니다테스트 글입니다테스트 글입니다테스트 글입니다테스트 글입니다테스트 글입니다테스트 글입니다</span>
					</div>
					<div class="spine">
						<a href="#">상세보기</a>
					</div>
				</div>
			</div>
			
		</div>
		<div class="box">
			<div class="box-close">
				<button type="button" class="btn-close">
					<span class="front"></span>
					<span class="back"></span>
					<span class="right"></span>
					<span class="left"></span>
					<span class="top"></span>
					<span class="bottom"></span>
				</button>
			</div>
			<div class="tile">
				<span class=""></span>
				<span class=""></span>
				<span class=""></span>
				<span class=""></span>
				<span class=""></span>
				<span class=""></span>
				<span class=""></span>
				<span class=""></span>
				<span class=""></span>
				<span class=""></span>
				<span class=""></span>
				<span class=""></span>
			</div>
			<div class="list-content">					
				<div class="roll-btn-wrap"><button type="button" class="roll-btn roll-btn-left"><span class="left"></span></button></div>
				<div class="roll-btn-wrap"><button type="button" class="roll-btn roll-btn-right"><span class="right"></span></button></div>
					<div class="img-rolling">
						<ul>
							<li><img src="${pageContext.request.contextPath}/images/sample.jpg" alt="" /></li>
							<li><img src="${pageContext.request.contextPath}/images/sample1.jpg" alt="" /></li>
							<li><img src="${pageContext.request.contextPath}/images/sample2.jpg" alt="" /></li>
							<li><img src="${pageContext.request.contextPath}/images/sample3.jpg" alt="" /></li>
							<li><img src="${pageContext.request.contextPath}/images/sample4.jpg" alt="" /></li>
							<li><img src="${pageContext.request.contextPath}/images/sample5.jpg" alt="" /></li>
						</ul>
					</div>
					<div class="img-rolling-s">
						<span class="current"></span>
						<ul>
							<li><a href="#"><img src="${pageContext.request.contextPath}/images/sample.jpg" alt="" /></a></li>
							<li><a href="#"><img src="${pageContext.request.contextPath}/images/sample1.jpg" alt="" /></a></li>
							<li><a href="#"><img src="${pageContext.request.contextPath}/images/sample2.jpg" alt="" /></a></li>
							<li><a href="#"><img src="${pageContext.request.contextPath}/images/sample3.jpg" alt="" /></a></li>
							<li><a href="#"><img src="${pageContext.request.contextPath}/images/sample4.jpg" alt="" /></a></li>
							<li><a href="#"><img src="${pageContext.request.contextPath}/images/sample5.jpg" alt="" /></a></li>
						</ul>
					</div>
					<div class="list-txt">
						텍스트샘플텍스트샘플텍스트샘플텍스트샘플텍스트샘플텍스트샘플텍스트샘플텍스트샘플텍스트샘플텍스트샘플텍스트샘플텍스트샘플텍스트샘플텍스트샘플텍스트샘플텍스트샘플텍스트샘플텍스트샘플텍스트샘플텍스트샘플텍스트샘플텍스트샘플텍스트샘플텍스트샘플텍스트샘플텍스트샘플텍스트샘플텍스트샘플텍스트샘플텍스트샘플텍스트샘플텍스트샘플텍스트샘플텍스트샘플텍스트샘플텍스트샘플텍스트샘플텍스트샘플텍스트샘플텍스트샘플텍스트샘플텍스트샘플텍스트샘플텍스트샘플텍스트샘플텍스트샘플텍스트샘플텍스트샘플텍스트샘플텍스트샘플텍스트샘플텍스트샘플텍스트샘플텍스트샘플텍스트샘플텍스트샘플텍스트샘플텍스트샘플텍스트샘플텍스트샘플텍스트샘플텍스트샘플텍스트샘플텍스트샘플텍스트샘플
					</div>
			</div>
		</div>
	</main>
	<script type="text/javascript">
	function generateRandom() {
		var num = Math.floor(Math.random() * 1000);
		return num;
		
	}
	function showLetter() {
		$(".img-wrap").first().siblings().each(function(){
			var left = generateRandom();
			var top = generateRandom();
			$(this).css({"top": top + "px", "left": left + "px"});
		});
	}
	showLetter();

	</script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.pinto.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/main.js"></script>
</body>
</html>
