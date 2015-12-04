<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!doctype html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width">
<!--     <link rel='stylesheet prefetch' href='http://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.1.0/css/bootstrap.css'> -->
<!-- <link rel='stylesheet prefetch' href='http://maxcdn.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css'> -->
<title>스터디 메인 | WITH 스터디</title>
<style type="text/css">
@import url(//fonts.googleapis.com/css?family=Open+Sans);

@import url(//fonts.googleapis.com/css?family=Open+Sans);

body {
	margin: 5px 20px;
	background-image:
		url("data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHhtbG5zOnhsaW5rPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5L3hsaW5rIiB3aWR0aD0iNiIgaGVpZ2h0PSI2Ij4KPHJlY3Qgd2lkdGg9IjYiIGhlaWdodD0iNiIgZmlsbD0iI2VlZWVlZSI+PC9yZWN0Pgo8ZyBpZD0iYyI+CjxyZWN0IHdpZHRoPSIzIiBoZWlnaHQ9IjMiIGZpbGw9IiNlNmU2ZTYiPjwvcmVjdD4KPHJlY3QgeT0iMSIgd2lkdGg9IjMiIGhlaWdodD0iMiIgZmlsbD0iI2Q4ZDhkOCI+PC9yZWN0Pgo8L2c+Cjx1c2UgeGxpbms6aHJlZj0iI2MiIHg9IjMiIHk9IjMiPjwvdXNlPgo8L3N2Zz4=");
	font-family: 'Open Sans';
	font-weight: 300;
}

h2 {
	margin-bottom: 30px;
	color: #4679bd;
	font-weight: 400;
	text-align: center;
}

p.footer {
	margin-bottom: 20px;
	color: #999999;
	font-size: 18px;
	text-align: center;
}

/* -----------------------------------------------
 * Timeline
 * --------------------------------------------- */
.timeline {
	list-style: none;
	padding: 10px 0;
	position: relative;
	font-weight: 300;
}

.timeline:before {
	top: 0;
	bottom: 0;
	position: absolute;
	content: " ";
	width: 2px;
	background: #ffffff;
	left: 50%;
	margin-left: -1.5px;
}

.timeline>li {
	margin-bottom: 20px;
	position: relative;
	width: 50%;
	float: left;
	clear: left;
}

.timeline>li:before, .timeline>li:after {
	content: " ";
	display: table;
}

.timeline>li:after {
	clear: both;
}

.timeline>li:before, .timeline>li:after {
	content: " ";
	display: table;
}

.timeline>li:after {
	clear: both;
}

.timeline>li>.timeline-panel {
	width: calc(100% - 25px);
	width: -moz-calc(100% - 25px);
	width: -webkit-calc(100% - 25px);
	float: left;
	border: 1px solid #dcdcdc;
	background: #ffffff;
	position: relative;
}

.timeline>li>.timeline-panel:before {
	position: absolute;
	top: 26px;
	right: -15px;
	display: inline-block;
	border-top: 15px solid transparent;
	border-left: 15px solid #dcdcdc;
	border-right: 0 solid #dcdcdc;
	border-bottom: 15px solid transparent;
	content: " ";
}

.timeline>li>.timeline-panel:after {
	position: absolute;
	top: 27px;
	right: -14px;
	display: inline-block;
	border-top: 14px solid transparent;
	border-left: 14px solid #ffffff;
	border-right: 0 solid #ffffff;
	border-bottom: 14px solid transparent;
	content: " ";
}

.timeline>li>.timeline-badge {
	color: #ffffff;
	width: 24px;
	height: 24px;
	line-height: 50px;
	text-align: center;
	position: absolute;
	top: 16px;
	right: -12px;
	z-index: 100;
}

.timeline>li.timeline-inverted>.timeline-panel {
	float: right;
}

.timeline>li.timeline-inverted>.timeline-panel:before {
	border-left-width: 0;
	border-right-width: 15px;
	left: -15px;
	right: auto;
}

.timeline>li.timeline-inverted>.timeline-panel:after {
	border-left-width: 0;
	border-right-width: 14px;
	left: -14px;
	right: auto;
}

.timeline-badge>a {
	color: #ffffff !important;
}

.timeline-badge a:hover {
	color: #dcdcdc !important;
}

.timeline-title {
	margin-top: 0;
	color: inherit;
}

.timeline-heading h4 {
	font-weight: 400;
	padding: 0 15px;
	color: #4679bd;
}

.timeline-body>p, .timeline-body>ul {
	padding: 10px 15px;
	margin-bottom: 0;
}

.timeline-footer {
	padding: 5px 15px;
	background-color: #f4f4f4;
}

.timeline-footer p {
	margin-bottom: 0;
}

.timeline-footer>a {
	cursor: pointer;
	text-decoration: none;
}

.timeline>li.timeline-inverted {
	float: right;
	clear: right;
}

.timeline>li:nth-child(2) {
	margin-top: 60px;
}

.timeline>li.timeline-inverted>.timeline-badge {
	left: -12px;
}

.no-float {
	float: none !important;
}

@media ( max-width : 767px) {
	ul.timeline:before {
		left: 40px;
	}
	ul.timeline>li {
		margin-bottom: 0px;
		position: relative;
		width: 100%;
		float: left;
		clear: left;
	}
	ul.timeline>li>.timeline-panel {
		width: calc(100% - 65px);
		width: -moz-calc(100% - 65px);
		width: -webkit-calc(100% - 65px);
	}
	ul.timeline>li>.timeline-badge {
		left: 28px;
		margin-left: 0;
		top: 16px;
	}
	ul.timeline>li>.timeline-panel {
		float: right;
	}
	ul.timeline>li>.timeline-panel:before {
		border-left-width: 0;
		border-right-width: 15px;
		left: -15px;
		right: auto;
	}
	ul.timeline>li>.timeline-panel:after {
		border-left-width: 0;
		border-right-width: 14px;
		left: -14px;
		right: auto;
	}
	.timeline>li.timeline-inverted {
		float: left;
		clear: left;
		margin-top: 30px;
		margin-bottom: 30px;
	}
	.timeline>li.timeline-inverted>.timeline-badge {
		left: 28px;
	}
}
</style>
<c:import url="/WEB-INF/view/include/common_top.jsp"></c:import>
<script>
	$(document).ready(function() {
	  $(".joinMember").on('click', function() {
      $(this).next().slideToggle("slow");
    });
	});
	
	// submit 펑션
	function acceptMember(size) {
	  var member = [];
	  for(var i=0; i<size; i++) {
	    if($('input:checkbox[id="check_'+i+'"]').is(":checked") == true) {
	      member.push($(".check_"+i).attr("data-no"));
	    }
	  }
	  $.ajax({
	    url: "${pageContext.request.contextPath}/joinGroup/acceptMember.json?groupNo=${groupNo}&member="+member
	  })
	  .done(function(response) {
	    alert(response);
	    location.reload();
    })
  }
	
</script>
</head>
<body class="page-sub">
	<c:import url="/WEB-INF/view/include/common_header.jsp"></c:import>
	<main>
	<div class="container">
		<div>




			<div>
				<h2>스터디그룹 타임라인</h2>

				<ul class="timeline">
					<li>
						<div class="timeline-badge">
							<a><i class="fa fa-circle" id=""></i></a>
						</div>
						<div class="timeline-panel">
							<div class="timeline-heading">
								<h4>Timeline Event</h4>
							</div>
							<div class="timeline-body">
								<p>Invitamus me testatur sed quod non dum animae tuae
									lacrimis ut libertatem deum rogus aegritudinis causet. Dicens
									hoc contra serpentibus isto.</p>
							</div>
							<div class="timeline-footer">
								<p class="text-right">Feb-21-2014</p>
							</div>
						</div>
					</li>

					<li class="timeline-inverted">
						<div class="timeline-badge">
							<a><i class="fa fa-circle invert" id=""></i></a>
						</div>
						<div class="timeline-panel">
							<div class="timeline-heading">
								<h4>Timeline Event</h4>
							</div>
							<div class="timeline-body">
								<p>Stranguillione in deinde cepit roseo commendavit patris
									super color est se sed. Virginis plus plorantes abscederem
									assignato ipsum ait regem Ardalio nos filiae Hellenicus mihi
									cum. Theophilo litore in lucem in modo invenit quasi nomen
									magni ergo est se est Apollonius, habet clementiae venit ad
									nomine sed dominum depressit filia navem.</p>
							</div>
							<div class="timeline-footer">
								<p class="text-right">Feb-23-2014</p>
							</div>
						</div>
					</li>

					<li>
						<div class="timeline-badge">
							<a><i class="fa fa-circle" id=""></i></a>
						</div>
						<div class="timeline-panel">
							<div class="timeline-heading">
								<h4>Timeline Event</h4>
							</div>
							<div class="timeline-body">
								<p>Advenientibus aliorum eam ad per te sed. Facere debetur
									aut veneris accedens.</p>
							</div>
							<div class="timeline-footer">
								<p class="text-right">Feb-23-2014</p>
							</div>
						</div>
					</li>

					<li class="timeline-inverted">
						<div class="timeline-badge">
							<a><i class="fa fa-circle invert" id=""></i></a>
						</div>
						<div class="timeline-panel">
							<div class="timeline-heading">
								<h4>Timeline Event</h4>
							</div>
							<div class="timeline-body">
								<p>Volvitur ingreditur id ait mea vero cum autem quod ait
									Cumque ego illum vero cum unde beata. Commendavi si non dum est
									in. Dionysiadem tuos ratio puella ut casus, tunc lacrimas
									effunditis magister cives Tharsis. Puellae addita verbaque'
									capellam sanctissima quid, apollinem existimas filiam rex cum
									autem quod tamen adnuente rediens eam est se in. Peracta licet
									ad nomine Maria non ait in modo compungi mulierem volutpat.</p>
							</div>
							<div class="timeline-footer">
								<p class="text-right">Feb-27-2014</p>
							</div>
						</div>
					</li>

					<li>
						<div class="timeline-badge">
							<a><i class="fa fa-circle" id=""></i></a>
						</div>
						<div class="timeline-panel">
							<div class="timeline-heading">
								<h4>Timeline Event</h4>
							</div>
							<div class="timeline-body">
								<p>Adfertur guttae sapientiae ducitur est Apollonius ut a a
									his domino Lycoridem in lucem. Theophile atque bona dei cenam
									veniebant est cum. Iusto opes mihi Tyrum in modo compungi
									mulierem ubi augue eiusdem ordo quos vero diam omni catervis
									famulorum. Bene dictis ut diem finito servis unde.</p>
							</div>
							<div class="timeline-footer">
								<p class="text-right">Mar-01-2014</p>
							</div>
						</div>
					</li>

					<li class="timeline-inverted">
						<div class="timeline-badge">
							<a><i class="fa fa-circle invert" id=""></i></a>
						</div>
						<div class="timeline-panel">
							<div class="timeline-heading">
								<h4>Timeline Event</h4>
							</div>
							<div class="timeline-body">
								<p>Crede respiciens loco dedit beneficio ad suis alteri si
									puella eius in. Acceptis codicello lenonem in deinde plectrum
									anni ipsa quod eam est Apollonius.</p>
							</div>
							<div class="timeline-footer primary">
								<p class="text-right">Mar-02-2014</p>
							</div>
						</div>
					</li>
					<li class="clearfix no-float"></li>
				</ul>

				<div style="background: #eee;">
					<div class="joinMember"
						style="text-align: center; color: #4679bd; background: #eee; font-size: 30px; border: 1px solid gray; border-radius: 10px;">참여
						신청 멤버</div>
					<div class='joinTable'
						style="color: gray; text-align: center; margin: 15px auto 15px; padding-bottom: 15px; width: 80%;">
						<table border="1">
							<colgroup>
								<col width="5%">
								<col width="10%">
								<col width="15%">
								<col width="35%">
								<col width="15%">
								<col width="20%">
							</colgroup>
							<thead>
								<tr>
									<th>승인여부</th>
									<th>이름</th>
									<th>아이디</th>
									<th>참여 한마디</th>
									<th>전화번호</th>
									<th>참여 신청 일자</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${member}" var="member" varStatus="status">
									<tr>
										<td><input type="checkbox" name='check_${status.index}' id='check_${status.index}' 
											class='check_${status.index}' data-no="${member.memberNo}"></td>
										<td>${member.memberName}</td>
										<td>${member.id}</td>
										<td>${member.groupComment}</td>
										<td>${member.memberTel}</td>
										<td>${member.groupJoinDate}</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
						<div class="btnDIV" style="text-align: right; padding: 20px;">
							<input style="padding: 10px;" type="button"  value="참여 승인" onclick='acceptMember(${fn:length(member)} )'>
						</div>
					</div>
				</div>

			</div>
		</div>
	</div>
	</main>
</body>
</html>
