<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 
<!doctype html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width">
<title>스터디 메인 | WITH 스터디</title>
<c:import url="/WEB-INF/view/include/common_top.jsp">
</c:import>
<script src="http://d3js.org/d3.v3.min.js" language="JavaScript"></script>
<script src="${pageContext.request.contextPath}/js/liquidFillGauge.js" language="JavaScript"></script>
</head>
<body class="page-sub">
	<c:import url="/WEB-INF/view/include/common_header.jsp">
		<c:param name="groupNo" value="${studyGroup.groupNo}"></c:param>
	</c:import>
	<main>
	<div class="container">
		<div class='main-title'>
			<strong class='group-title'>${studyGroup.groupName}</strong> 
			<a class="active-place" href='http://map.daum.net/link/map/${studyGroup.groupActivePlace},${studyGroup.groupActiveLongitude},${studyGroup.groupActiveLatitude}'	target='_blank'> 
				<img alt=""	src="http://www.iconarchive.com/download/i57835/icons-land/vista-map-markers/Map-Marker-Marker-Outside-Pink.ico">${studyGroup.groupActivePlace}
			</a>
			
		<a href='${pageContext.request.contextPath}/studygroup/StudygroupAdminMain.do?groupNo=${studyGroup.groupNo}'>관리자 메인</a>
		</div>
		
		<div class='graph1-4'>
			<div class='graph1-4-1 bg-red'>
				<div class='dash-imgDIV'>
					<img style="width: 100%;" src="${pageContext.request.contextPath}/images/icon_user.png" alt=""/>
				</div>
				<div class='dash-numberDIV'>${fn:length(member)}명</div>
			</div>
			<div class='gap'></div>
			
			<div class='graph1-4-1 bg-blue'>
				<div class='dash-imgDIV'>
					<img style="width: 100%;" src="${pageContext.request.contextPath}/images/icon_dollar.png" alt=""/>
				</div>
				<div class='dash-numberDIV' style="font-size: 30px;">${money}원
				</div>
			</div>
			<div class='gap'></div>
			
			<div class='graph1-4-1 bg-yellow'>
				<div class='dash-imgDIV'>
					<img style="width: 100%;" src="${pageContext.request.contextPath}/images/icon_smile.png" alt=""/>
				</div>
				<div class='dash-numberDIV'>오늘의 스터디그룹 방문자수
				</div>
			</div>
			<div class='gap'></div>
			
			<div class='graph1-4-1 bg-green'>
				<div class='dash-imgDIV'>
					<img style="width: 100%;" src="${pageContext.request.contextPath}/images/icon_cloud.png" alt=""/>
				</div>
				<div class='dash-numberDIV'>자료실 게시글 수
				</div>
			</div>
		</div>


		<div class="graph1-1">
			<div style="margin-bottom:20px; font-size:18px; font-weight:bold;">일정 타임라인</div>
			<ul class="timeline" id="timeline" style="color: #758D96;">
				<c:if test="${not empty calendar}">
				<c:forEach items="${calendar}" var="calendar">
				<li class="li complete">
					<div class="timestamp">
						<span class="date">${calendar.startDate}</span>
					</div>
					<div class="status">
						<h4>${calendar.title}</h4>
					</div>
				</li>
				</c:forEach>
				
				</c:if>
			</ul>
		</div>
		

		<div class='graph1-1' style="overflow: hidden;">
			<div style="width: 20%; float: left; text-align: center; font-size: 35px;">스터디 소개</div>
			<div style="float: right; width: 80%; font-size: 15px;">
				${studyGroup.groupDetail}				
			</div>
		</div>

		
		<div>
			<table class="table-common table-studyGroup">
				<colgroup>
					<col style="width:10%;" />
					<col style="width:30%" />
					<col style="width:10%" />
					<col style="width:10%" />
					<col style="width:10%" />
					<col style="width:10%" />
					<col style="width:10%" />
					<col style="width:10%" />
				</colgroup>
					<thead>
						<tr>
							<th>직종</th>
							<th>내용</th>
							<th>회사명</th>
							<th>근무형태</th>
							<th>시작일</th>
							<th>마감일</th>
							<th>신입/경력</th>
							<th>연봉</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="work" items="${workInfo}">
						<tr>
							<td><span class='work-category'>${work.jobCategory}</span></td>
							<td><a href='${work.url}' target="_blank">${work.title}</a></td>
							<td>${work.company}</td>
							<td>${work.jobType}</td>
							<td>${work.openingTimeStamp}</td>
							<td>${work.expirationTimeStamp}</td>
							<td>${work.experienceLevel}</td>
							<td>${work.salary}</td>
						</tr>
					</c:forEach>
					</tbody>
				</table>
				<div style="text-align: right; text-decoration: underline; margin-top: 10px;">
					<a href='http://www.saramin.co.kr/zf_user/' target="_blank">채용 공고 더보기</a>
				</div>
		</div>
	</div>
	</main>
</body>
</html>
