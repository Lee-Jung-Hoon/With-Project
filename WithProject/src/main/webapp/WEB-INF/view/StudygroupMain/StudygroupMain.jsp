<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 
<!doctype html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width">
<style type="text/css">
	.group-title {
		font-weight: bold;
	}
	
	.active-place {
		color: #333; 
		text-shadow: 2px 2px 4px #000000;
	}
	
	.active-place img{
		height: 20px;
	}
	
	.graph1-4 {
		overflow: hidden; 
		margin-bottom: 20px;
	}
	
	.graph1-4 .graph1-4-1{
		overflow: hidden; 
		float:left; 
		width: 23.5%; 
		height: 200px;
	}
	
	.bg-red {
		background: #E94B3B;
	}
	
	.bg-blue {
		background: #1C7EBB;
	}
	
	.bg-yellow {
		background: #F98E33;
	}
		
	.bg-green {
		background: #23AE89;
	}
	
	.dash-imgDIV {
		float: left; 
		margin: 50px 15px;
		width: 30%;
	}
	
	.dash-numberDIV {
		width: 59%;
    float: left;
    text-align: center;
    line-height: 200px;
    font-size: 70px;
    color: white;
	}
	
	.gap {
		 float:left; 
		 width: 2%; 
		 height: 200px;
	}
	
	.work-category {
		display: -webkit-box; 
		width: 100%; 
		text-overflow: ellipsis; 
		overflow: hidden; 
		-webkit-box-orient: vertical; 
		word-wrap: break-word; 
		-webkit-line-clamp: 1;
	}
	
.timeline {
  list-style-type: none;
  display: flex;
  align-items: center;
  justify-content: center;
}

.timeline .li {
  transition: all 200ms ease-in;
}

.timeline .timestamp {
  margin-bottom: 20px;
  padding: 0px 40px;
  display: flex;
  flex-direction: column;
  align-items: center;
  font-weight: 100;
}

.timeline .status {
  padding: 0px 40px;
  display: flex;
  justify-content: center;
  border-top: 2px solid #D6DCE0;
  position: relative;
  transition: all 200ms ease-in;
}
.timeline .status h4 {
  font-weight: 600;
  margin-top: 20px;
}
.timeline .status:before {
  content: "";
  width: 25px;
  height: 25px;
  background-color: white;
  border-radius: 25px;
  border: 1px solid #ddd;
  position: absolute;
  top: -15px;
  left: 42%;
  transition: all 200ms ease-in;
}

.timeline .li.complete .status {
  border-top: 2px solid #E94B3B;
}
.timeline .li.complete .status:before {
  background-color: #E94B3B;
  border: none;
  transition: all 200ms ease-in;
}
.timeline .li.complete .status h4 {
  color: #E94B3B;
}

@media (min-device-width: 320px) and (max-device-width: 700px) {
  .timeline {
    list-style-type: none;
    display: block;
  }

  .timeline .li {
    transition: all 200ms ease-in;
    display: flex;
    width: inherit;
  }

  .timeline .timestamp {
    width: 100px;
  }

  .timeline .status:before {
    left: -8%;
    top: 30%;
    transition: all 200ms ease-in;
  }
</style>
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
			
		<a href='${pageContext.request.contextPath}/studygroup/StudygroupAdminMain.do'>관리자 메인</a>
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
			<div>제목</div>
			<ul class="timeline" id="timeline" style="color: #758D96;">
				<li class="li complete">
					<div class="timestamp">
						<span class="author">Abhi Sharma</span> <span class="date">11/15/2014<span>
					</div>
					<div class="status">
						<h4>Shift Created</h4>
					</div>
				</li>
				<li class="li complete">
					<div class="timestamp">
						<span class="author">Abhi Sharma</span> <span class="date">11/15/2014<span>
					</div>
					<div class="status">
						<h4>Shift Created</h4>
					</div>
				</li>
				<li class="li complete">
					<div class="timestamp">
						<span class="author">Abhi Sharma</span> <span class="date">11/15/2014<span>
					</div>
					<div class="status">
						<h4>Shift Created</h4>
					</div>
				</li>
				<li class="li complete">
					<div class="timestamp">
						<span class="author">Abhi Sharma</span> <span class="date">11/15/2014<span>
					</div>
					<div class="status">
						<h4>Shift Created</h4>
					</div>
				</li>
				<li class="li complete">
					<div class="timestamp">
						<span class="author">PAM Admin</span> <span class="date">11/15/2014<span>
					</div>
					<div class="status">
						<h4>Email Sent</h4>
					</div>
				</li>
				<li class="li complete">
					<div class="timestamp">
						<span class="author">Aaron Rodgers</span> <span class="date">11/15/2014<span>
					</div>
					<div class="status">
						<h4>SIC Approval</h4>
					</div>
				</li>
				<li class="li">
					<div class="timestamp">
						<span class="author">PAM Admin</span> <span class="date">TBD<span>
					</div>
					<div class="status">
						<h4>Shift Completed</h4>
					</div>
				</li>
			</ul>
		</div>
		

		<div class='graph1-1' style="overflow: hidden;">
			<div style="width: 20%; float: left; text-align: center; font-size: 35px;">스터디 소개</div>
			<div style="float: right; width: 80%; font-size: 15px;">
				${studyGroup.groupDetail}				
			</div>
		</div>

		<div class='graph1-2'>
			<div class='graph1-2-1'>최근 과제 게시판 글보기</div>
			<div class="graph1-2-2">스터디 관련 취업정보
			</div> 
		</div>
		
		<div>
			<table class="table-common">
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
							<td><a href='${work.url}' target="_black";>${work.title}</a></td>
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
					<a href='http://www.saramin.co.kr/zf_user/' target="_black";>채용 공고 더보기</a>
				</div>
		</div>
	</div>
	</main>
</body>
</html>
