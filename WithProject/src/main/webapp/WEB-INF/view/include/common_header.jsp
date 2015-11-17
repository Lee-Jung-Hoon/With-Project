<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	<div class="dark-layer"></div>
	<header>
		<div class="bookmarkZone">
			<span class="img"><img src="${pageContext.request.contextPath}/images/01.jpg" alt="" /></span>
			<span class="txt">샘플 텍스트</span>
			<button type="button" class="pin-btn">핀</button>
			<div class="pin-click">
				<ul class="pin-list">
					<li><button type="button">즐겨찾기</button></li>
					<li><button type="button">마이스터디</button></li>
					<li><button type="button">메시지</button></li>
				</ul>
				<div class="pin-content">
				
				</div>
			</div>			
		</div>
		<div class="login-area">
			<div class="login-sort login">
				<form action="#" method="post">
					<dl class="list maki">
						<dt><button type="button" class="toggle">로그인</button></dt>
						<dd class="fb-login"><em><a href="#">페이스 북 로그인</a></em></dd>
						<dd class="input-login"><em><input type="text" id="id" placeholder="ID" /></em></dd>
						<dd class="input-login"><em><input type="password" id="pw" placeholder="password" /></em></dd>
						<dd class="input-login"><em><input type="checkbox"  />라라라</em></dd>
						<dd class="btn-login"><em><input type="submit" value="로그인"  /></em></dd>
					</dl>
				</form>
			</div>
			<div class="login-sort join">
				<form action="#" method="post">
					<dl class="list maki">
						<dt><button type="button" class="toggle">회원가입</button></dt>
						<dd class="fb-login"><em><a href="#">페이스 북 로그인</a></em></dd>
						<dd class="input-login"><em><input type="text" id="id" placeholder="ID" /></em></dd>
						<dd class="input-login"><em><input type="password" id="pw" placeholder="password" /></em></dd>
						<dd class="input-login"><em><input type="checkbox"  />라라라</em></dd>
						<dd class="btn-login"><em><input type="submit" value="로그인"  /></em></dd>
					</dl>
				</form>
			</div>
		</div>
		<div class="btn-search">
			<div class="ico-search close">
				<span class="element element-one"></span>
				<span class="element element-two"></span> 				
			</div> 
		</div>
		<h2 class="hide">주메뉴</h2>
		</ul>
			<nav class="nav">
				<ul>
					<li><a href="${pageContext.request.contextPath}/main/main.do">홈</a></li>
					<li><a href="${pageContext.request.contextPath}/exam/examList.do">시험테스트</a></li>
					<li><a href="${pageContext.request.contextPath}/calendar/schedule.do">일정</a></li>
				</ul>
			</nav>
	</header>