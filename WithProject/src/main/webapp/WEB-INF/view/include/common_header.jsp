<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	<div class="dark-layer"></div>
	<script>
  $(document).ready(function() {
    var d = new Date();

    $("#memberAge").on('change', function() {
      var test = (d.getFullYear() - $("#memberAge").val() + 1);
      $("#rAge").html("나이 : " + (test) + "세");
      
      var gender = document.getElementsByName('memberGender');
      for (var i = 0; i < gender.length; i++) {
        if (gender[i].checked == true) {
					console.log(gender[i].value);
        }
      }
    })   
  
    if ("${no}" != null) {
        socket = io.connect("http://localhost:10001");
        socket.emit("login", "${no}");
        var study
        $(".studyMemberList").empty();
        $.get("/WithProject/member/memberList.do", )
        for(var i  in data){}
      }
    })
  </script>
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
					<div class="studyMemberList">
						
					</div>
				</div>
			</div>			
		</div>
		<div class="login-area">
		<div class="login-sort login">
			<form action="${pageContext.request.contextPath}/member/login.do" method="post">
				<dl class="list maki">
				
					<c:choose>
					<c:when test="${empty id}">
					<dt>
						<button type="button" class="toggle">LOGIN</button>
					</dt>
					</c:when>
					<c:otherwise>
					<dt>
							<button type="button" class="toggle" onclick='location.href="${pageContext.request.contextPath}/member/logout.do"'>LOGOUT</button>
					</dt>
					</c:otherwise>
					</c:choose>
					 <dd class="fb-login">
						<em><a href="#">페이스 북 로그인</a></em>
					</dd>
					<dd class="input-login">
						<em><input type="text" name="id" id="id" placeholder="ID" /></em>
					</dd>
					<dd class="input-login">
						<em><input type="password" name="password" id="password" placeholder="password" /></em>
					</dd>
					<dd class="btn-login">
						<em><input type="submit" value="로그인"  /></em>
					</dd>
				</dl>
			</form>
		</div>
			<div class="login-sort join">
			<form action="${pageContext.request.contextPath}/member/join.do" method="post">
				<dl class="list maki">
					<dt>
						<a href="#" class="toggle">JOIN</a>
					</dt>
					<dd class="input-login">
						<em><input type="text" name="memberName" id="memberName" placeholder="name" /></em>
					</dd>
					<dd class="input-login">
						<em><input type="text" name="id" id="id" placeholder="E-mail" /></em>
					</dd>
					<dd class="input-login">
						<em><input type="password" name="password" id="password" placeholder="password" /></em>
					</dd>
					<dd class="input-login">
						<em> 
						 <input type="radio" id="memberGender" name="memberGender" class="check" value="남성" />남성 
						 <input type="radio" id="memberGender" name="memberGender" class="check" value="여성" />여성 
						 <select id="memberAge" name="memberAge">
								<c:forEach begin="1940" end="2015" var="i">
									<option  value="${i}">${i}</option>
								</c:forEach>
						</select> 
								<span id="rAge"></span>
						</em>
					</dd>
					<dd class="btn-login">
						<em><input type="submit" value="로그인" /></em>
					</dd>
				</dl>
			</form>
		</div>
	</div>
	<script>
			if ($('body').hasClass('page-main')) {
			  document.write('<div class="btn-search">');
			  document.write('<div class="ico-search close">');
			  document.write('<span class="element element-one"></span><span class="element element-two"></span>');
			  document.write('</div>');
			  document.write('</div>');
			}
		</script>
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