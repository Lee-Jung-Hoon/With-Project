<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="dark-layer"></div>
	<header>
		<div class="bookmarkZone">즐겨찾기</div>
		<div class="login-area">
			<div class="login">
				<form action="#" method="post">
					<dl class="list maki">
						<dt>
							<a href="#" class="toggle">로그인</a>
						</dt>
						<dd class="fb-login">
							<em><a href="">페이스 북 로그인</a></em>
						</dd>
						<dd class="input-login">
							<em><input type="text" id="id" placeholder="ID" /></em>
						</dd>
						<dd class="input-login">
							<em><input type="password" id="pw" placeholder="password" /></em>
						</dd>
						<dd class="btn-login">
							<em><input type="submit" value="로그인" /></em>
						</dd>
					</dl>
				</form>
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