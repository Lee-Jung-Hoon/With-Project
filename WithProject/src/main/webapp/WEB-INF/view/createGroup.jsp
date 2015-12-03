<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width">
<title>강의개설 | WITH 스터디</title>
<%@ include file="/WEB-INF/view/include/common_top.jsp"%>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/create-group.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/jquery.tag-editor.css">
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.uploadPreview.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/plugin/SE2/js/HuskyEZCreator.js" charset="utf-8"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.MultiFile.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.form.js"></script>
</head>
<body class="page-sub page-join">
   <%@ include file="/WEB-INF/view/include/common_header.jsp"%>
   <main>
   <div class="container">
      <h3 class="title">개설하기</h3>
      <form action="${pageContext.request.contextPath}/studygroup/saveGroup.do" method="post" id="WriteForm" enctype="multipart/form-data">
   
         <div class="registDIV">

            <!-- 첫번째 입력란 -->
            <div class="firstStep">
               <div class="stepLeft">
                  <div class="input">
                     <h4>스터디 기본 정보 입력</h4>
                  </div>
                  <div class="input">
                     <h4>스터디그룹 이름 입력</h4>
                     <input class="groupName" placeholder="스터디그룹 이름" type="text" name="groupName"
                        id="groupName">
                  </div>
                 	<div class="input">
										<h4>대표이미지</h4>
							<div id="image-preview" class="image-preview">
								<span><label for="image-upload" id="image-label">사진 변경</label></span> 
								<input type="file" name="image" id="image-upload"
									style="display: none" accept="image/png, image/gif, image/jpeg" />
							</div>
<!-- 						<input class='fileInput' type="file" name="photo" multiple="multiple" /> -->
<!-- 							<div id="aflie3-list" style="border:2px solid #c9c9c9; min-height:50px;"></div> -->
						</div>
                  <div class="input" style="height:432px;">
                     <h4>상세내용 입력</h4>
                     <textarea rows="10" cols="40" id="groupDetail" name="groupDetail"   style="width:100%; height:300px;"></textarea>
                  </div>
                  <div class="btn-area">
                     <button type="button" class="nextStep_First commonBtn">다음 단계</button>
                  </div>
               </div>

               <div class="stepRight">
                  <ul class="advice">
                     <li><strong>'스터디그룹 이름'</strong>을 입력해주세요.</li>
                     <li>스터디그룹 특성에 맞는 <strong>이미지</strong>로<br /> 업로드 해주시고 대표 이미지가 없을 경우
                        추천하는 이미지를 선택해 사용할 수 있습니다.</li>
                     <li>개설하는 모임의 <strong>상세내용</strong>을<br /> 입력하고 편집기를 이용해 다양한<br />형태의 내용을 입력해 주세요.</li>
                  </ul>
               </div>
            </div>



            <!-- 두번째 입력란 -->
   
               <div class="secondStep blind">
                  <div class="stepLeft">
                     <div class="input">
                        <h4>일정/장소 정보 입력</h4>
                     </div>
                     <div class="input">
                        <h4>스터디그룹 모집기간 설정</h4>
                        <div>
                           <input type="date" name="groupRecruitStartDate" id="groupRecruitStartDate" /> 
                           <strong> ~ </strong>
                           <input type="date" name="groupRecruitEndDate" id="groupRecruitEndDate" />
                        </div>
                        <br />
                        <h4>스터디그룹 활동기간 설정</h4>
                        <div>
                           <input type="date" name="groupStartDate" id="groupStartDate">
                           <input type="time" name="groupStartTime" id="groupStartTime">
                           <strong> ~ </strong> <input type="date" name="groupEndDate"
                              id="groupEndDate"> <input type="time"
                              name="groupEndTime" id="groupEndTime">
                        </div>
                     </div>
                     <div class="input">
                        <h4>모임 장소 설정</h4>
                        <input class="groupActivePlace" type="text" name="groupActivePlace" id="groupActivePlace" placeholder="모임 장소 입력" />
                     </div>
                     <div class="input">
                        <h4>주 활동지역 지도 위치 설정</h4>
                        <div id="map"></div>
                        <input type="hidden" id="groupActiveLongitude" name="groupActiveLongitude" /> 
                        <input type="hidden" id="groupActiveLatitude" name="groupActiveLatitude" />
                     </div>
                     <div class="btn-area">
                        <button type="button" class="prevStep_Second commonBtn">이전 단계</button> 
                        <button type="button" class="nextStep_Second commonBtn">다음 단계</button>
                     </div>
                  </div>

                  <div class="stepRight">
                     <ul class="advice">
                        <li>개설하려는 스터디그룹의 <strong>'기간'</strong>을<br />설정해주세요.</li>
                        <li>모집기간 : 스터디그룹원들을<br />모집하는 기한을 설정합니다.</li>
                        <li>활동기간 : 스터디그룹이 활동할<br />기한을 설정합니다.</li>
                        <li>스터디그룹 특성에 맞는 <strong>이미지</strong>로<br />업로드 해주시고 대표 이미지가 없을 경우 추천하는 이미지를 선택해 사용할 수 있습니다</li>
                        <li>참여자들이 <strong>장소</strong>를 명확히 알 수<br />있도록 장소명을 입력해 주세요.</li>
                        <li>
                           <ul>
                              <li><strong>장소</strong>를 지도에 표시하기 위해<br />지도 위치 설정을 해 주세요.</li>
                              <li>설정은 지역명이나 주요명칭을 기입하여 지정 할 수 있습니다.</li>
                              <li>시, 도, 구, 동 단위로 설정할 수<br />있습니다.</li>
                              <li>지도를 클릭하고 핀을 이동하여<br />위치를 지정할 수도 있습니다.<br /></li>
                              <li>간혹 주소정보를 불러오지 못해 지역<br />범주에 속하지 못할 수 있습니다.</li></li>
                           </ul>      
                     </ul>
                  </div>
               </div>

      


            <!-- 세번째 입력란 -->
            <div class="thirdStep blind">
               <div class="stepLeft">
                  <div class="input">
                     <h4>부가 정보 입력</h4>
                  </div>
                  <div class="input">
                     <h4>연락처 및 이메일 설정</h4>
                     <div>
                        <table class="table-common2">
                           <tbody>
                              <tr>
                                 <th>개설자 전화번호 설정</th>
                                 <td>
                                    <input type="hidden" name="groupTel" id="groupTel" />
                                    <select id="firstTel" name="firstTel">
                                       <option value="010" selected="selected">010</option>
                                       <option value="011">011</option>
                                       <option value="018">018</option>
                                    </select> - 
                                    <input type="text" style="width: 50px; text-align: center;" id="secondTel" name="secondTel">
                                    - <input type="text" style="width: 50px; text-align: center;" name="thirdTel" id="thirdTel"></td>
                              </tr>
                              <tr>
                                 <th>개설자 이메일주소 설정</th>
                                 <td>
                                    <input type="hidden" name="groupEmail" id="groupEmail" />
                                    <input type="text" style="width: 150px;" name="email" id="email"> @ 
                                    <select id="domain" name="domain">
                                       <option value="naver.com">naver.com</option>
                                       <option value="gmail.com">gmail.com</option>
                                       <option value="daum.net">daum.net</option>
                                    </select>
                                 </td>
                              </tr>
                           </tbody>
                        </table>
                     </div>
                  </div>

                  <div class="input">
                     <h4>태그 입력 및 설정</h4>
                     <div
                        style="border-top: 1px solid #eee; border-bottom: 1px solid #eee; background: #fafafa; margin: 30px 0; padding: 20px 5px">
                        <div
                           style="padding: 0 7px 0 5px; max-width: 900px; margin: auto">
                           <textarea id="hero-demo"></textarea>
                           <input type="hidden" id="tag" name="tag">
                        </div>
                     </div>
                  </div>

                  <div class="input">
                     <h4>참여인원 및 선정방법 설정</h4>
                     <table class="table-common2">
                        <tbody>
                           <tr>
                              <th>스터디그룹 최대 인원</th>
                              <td><input type="text" name="groupMaxPerson" id="groupMaxPerson" size="4px">명</td>
                           </tr>
                           <tr>
                              <th>스터디그룹 참여자 선정 방법</th>
                              <td>
                                 <select id="groupConfirmType" name="groupConfirmType">
                                    <option value="선착순">선착순</option>
                                    <option value="개설자 선정">개설자 선정</option>
                                 </select>
                              </td>
                           </tr>
                        </tbody>
                     </table>
                  </div>
                  <div class="btn-area">
                     <button type="button" class="prevStep_Thrid commonBtn">이전 단계</button> 
                     <button type="button" class="create_Group commonBtn">작성 완료</button>
                  </div>
               </div>

               <div class="stepRight">
                  <ul class="advice">
                     <li>스터디그룹 개설자의 <strong>'연락처와</strong><br /><strong>이메일주소'</strong>를 설정해주세요.</li>
                     <li>
                        <ul>
                           <li>해당 스터디그룹의 특성에 맞는<br /><strong>태그</strong>를 입력해주세요.</li>
                           <li>','(따옴표) 단위로 태그를 구분합니다. <br /> 태그는 스터디그룹 검색에 활용됩니다.</li>
                        </ul>
                     </li>
                     <li>
                        <ul>
                           <li>스터디그룹의 <strong>최대 인원과 참여자</strong><br /><strong>선정방법</strong>을 입력해주세요.</li>
                           <li>참여자 선정 방법 :<br />선착순, 개설자 선정</li>
                        </ul>
                     </li>
                  </ul>
               </div>
            </div>
         </div>
      </form>
      </div>
   </main>
   <script   src="${pageContext.request.contextPath}/js/jquery.caret.min.js"></script>
   <script   src="${pageContext.request.contextPath}/js/jquery.tag-editor.js"></script>
   <script   src="${pageContext.request.contextPath}/js/group.make.js"></script>
</body>
</html>