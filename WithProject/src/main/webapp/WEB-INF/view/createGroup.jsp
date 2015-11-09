<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css"
	href="/WithProject/css/reset.css" />
<link rel="stylesheet" type="text/css"
	href="/WithProject/css/style.css" />
<link rel="stylesheet" type="text/css"
	href="/WithProject/css/create-group.css" />
<link rel="stylesheet" href="/WithProject/css/jquery.tag-editor.css">
<script type="text/javascript"
	src="http://code.jquery.com/jquery-2.0.3.min.js"></script>
<script type="text/javascript"
	src="http://apis.daum.net/maps/maps3.js?apikey=ed9f2771750f83351d39d6973594a653"></script>
<script type="text/javascript"
	src="/WithProject/js/jquery.uploadPreview.js"></script>
<script type="text/javascript"
	src="/WithProject/plugin/SE2/js/HuskyEZCreator.js"
	charset="utf-8"></script>
<script type="text/javascript">
  $(document).ready(function() {
            $.uploadPreview({
              input_field : "#image-upload", // Default: .image-upload
              preview_box : "#image-preview", // Default: .image-preview
              label_field : "#image-label", // Default: .image-label
              label_default : "Choose File", // Default: Choose File
              label_selected : "Change File", // Default: Change File
              no_label : false
            // Default: false
            });

            var oEditors = [];

            // 현재 위치를 얻어올 수 있는 경우
            if (navigator.geolocation) {
              navigator.geolocation.getCurrentPosition(function(position) {
                // 지도의 중심 설정
                var position = new daum.maps.LatLng(position.coords.latitude,
                    position.coords.longitude);
                // position.coords.latitude 현재 사용자의 경도
                // position.coords.longitude 현재 사용자의 위도

                // 지도 표시를 위한 기본 설정
                var map = new daum.maps.Map(document.getElementById('map'), {
                  center : position,
                  level : 5,
                  mapTypeId : daum.maps.MapTypeId.ROADMAP
                });

                // 지도 컨트롤러 표시
                var zoomControl = new daum.maps.ZoomControl();
                map.addControl(zoomControl, daum.maps.ControlPosition.RIGHT);
                var mapTypeControl = new daum.maps.MapTypeControl();
                map.addControl(mapTypeControl,
                    daum.maps.ControlPosition.TOPRIGHT);

                // 지도를 클릭한 위치에 표출할 마커입니다
                var marker = new daum.maps.Marker({
                  // 지도 중심좌표에 마커를 생성합니다 
                  position : position
                });
                // 지도에 마커를 표시합니다
                marker.setMap(map);

                // 지도에 클릭 이벤트를 등록합니다
                // 지도를 클릭하면 마지막 파라미터로 넘어온 함수를 호출합니다
                daum.maps.event.addListener(map, 'click', function(mouseEvent) {
                  // 클릭한 위도, 경도 정보를 가져옵니다 
                  var latlng = mouseEvent.latLng;
                  // 마커 위치를 클릭한 위치로 옮깁니다
                  marker.setPosition(latlng);

                  var message = '클릭한 위치의 위도 : ' + latlng.getLat() + '경도 : '
                      + latlng.getLng();
                  console.log(message);
                  $("#groupActiveLongitude").val(latlng.getLng());
                  $("#groupActiveLatitude").val(latlng.getLat());
                });
              })
            }
            // 현재 위치를 얻어오지 못하는 경우
            else {
              alert("현재 위치 정보를 얻어오지 못했습니다.");
            }

            nhn.husky.EZCreator
                .createInIFrame({
                  oAppRef : oEditors,
                  elPlaceHolder : "groupDetail", //textarea에서 지정한 id와 일치해야 합니다. 
                  //SmartEditor2Skin.html 파일이 존재하는 경로
                  sSkinURI : "/WithProject/plugin/SE2/SmartEditor2Skin.html",
                  htParams : {
                    // 툴바 사용 여부 (true:사용/ false:사용하지 않음)
                    bUseToolbar : true,
                    // 입력창 크기 조절바 사용 여부 (true:사용/ false:사용하지 않음)
                    bUseVerticalResizer : true,
                    // 모드 탭(Editor | HTML | TEXT) 사용 여부 (true:사용/ false:사용하지 않음)
                    bUseModeChanger : true,
                    fOnBeforeUnload : function() {
                    }
                  },
                  fOnAppLoad : function() {
                    //기존 저장된 내용의 text 내용을 에디터상에 뿌려주고자 할때 사용
                    oEditors.getById["groupDetail"].exec("PASTE_HTML", [ "" ]);
                  },
                  fCreator : "createSEditor2"
                });

            // 첫번째 다음 스텝 버튼이 눌러졌을 경우
            $(".nextStep_First").on('click', function() {
              $(".firstStep").hide();
              $(".secondStep").show();
              $(window).scrollTop(0);
            });

            // 두번째 다음 스텝 버튼이 눌러졌을 경우
            $(".nextStep_Second").on('click', function() {
              $(".secondStep").hide();
              $(".thirdStep").show();
              $(window).scrollTop(0);
            });

            $(".prevStep_Second").on('click', function() {
              $(".secondStep").hide();
              $(".firstStep").show();
              $(window).scrollTop(0);
            });

            $(".prevStep_Thrid").on('click', function() {
              $(".thirdStep").hide();
              $(".secondStep").show();
              $(window).scrollTop(0);
            });

            $(".create_Group").click( function() {
                  oEditors.getById["groupDetail"].exec("UPDATE_CONTENTS_FIELD", []);
                  $("#groupTel").val($("#firstTel").val() + $("#secondTel").val() + $("#thirdTel").val());
                  $("#groupEmail").val($("#email").val() + "@" + $("#domain").val());
                  $("#WriteForm").submit();
            });
    });
</script>

</head>
<body>
	<header>
	</header>
	<main>
	<div class="content">
		<form action="${pageContext.request.contextPath}/studygroup/saveGroup.do" method="post" id="WriteForm">
			<h1 class="title">개설하기</h1>
			<div class="registDIV">

				<!-- 첫번째 입력란 -->
				<div style="overflow: hidden; display: block;" class="firstStep">
					<div class="stepLeft">
						<div class="input">
							<h2>스터디 기본 정보 입력</h2>
						</div>
						<div class="input">
							<h2>스터디그룹 이름 입력</h2>
							<input style="height: 30px; width: 95%; background-color: #eee;"
								placeholder="스터디그룹 이름" type="text" name="groupName"
								id="groupName">
						</div>
						<div class="input">
							<h2>대표이미지</h2>
							<div id="image-preview"
								style="border: 1px gray solid; background-image: url('http://images.freeimages.com/static/images/avatardefault.png')">
								<label for="image-upload" id="image-label">사진 변경</label> <input
									type="file" name="image" id="image-upload"
									style="display: none" accept="image/png, image/gif, image/jpeg" />
							</div>
						</div>
						<div class="input">
							<h2>상세내용 입력</h2>
							<textarea rows="10" cols="40" id="groupDetail" name="groupDetail"	style="width: 70%; height: 300px;"></textarea>
						</div>
					</div>

					<div class="stepRight">
						<div class="advice" style="height: 84.4445px;"></div>
						<div class="advice" style="height: 114.444px;">
							<p>
								<strong>'스터디그룹 이름'</strong>을 입력해주세요.<br />
						</div>
						<div class="advice">
							<p>
								스터디그룹 특성에 맞는 <strong>이미지</strong>로 업로드 <br />해주시고 대표 이미지가 없을 경우
								추천하는 이미지를 선택해 사용할 수 있습니다
							</p>
						</div>
						<div class="advice">
							<p>
								개설하는 모임의 <strong>상세내용</strong>을 입력하고<br /> 편집기를 이용해 다양한 형태의 내용을
								<br />입력해 주세요.
							</p>
						</div>
					</div>
					<div
						style="width: 100%; text-align: center; padding-top: 20px; clear: both;">
						<input type="button" class="nextStep_First" value="다음 단계" />
					</div>
				</div>



				<!-- 두번째 입력란 -->
				<div>
					<div style="overflow: hidden; display: none;" class="secondStep">
						<div class="stepLeft">
							<div class="input">
								<h2>일정/장소 정보 입력</h2>
							</div>
							<div class="input">
								<h2>스터디그룹 모집기간 설정</h2>
								<div>
									<input type="datetime-local" name="groupRecruitStartDate"
										id="groupRecruitStartDate"> <strong> ~ </strong> <input
										type="datetime-local" name="groupRecruitEndDate"
										id="groupRecruitEndDate">
								</div>
								<br />
								<h2>스터디그룹 활동기간 설정</h2>
								<div>
									<input type="date" name="groupStartDate" id="groupStartDate">
									<input type="time" name="groupStartTime" id="groupStartTime">
									<strong> ~ </strong> <input type="date" name="groupEndDate"
										id="groupEndDate"> <input type="time"
										name="groupEndTime" id="groupEndTime">
								</div>
							</div>
							<div class="input">
								<h2>모임 장소 설정</h2>
								<input style="height: 30px; width: 95%; background-color: #eee;"
									type="text" name="groupActivePlace" id="groupActivePlace"
									placeholder="모임 장소 입력">
							</div>
							<div class="input">
								<h2>주 활동지역 지도 위치 설정</h2>
								<div id="map"></div>
								<input type="hidden" id="groupActiveLongitude"
									name="groupActiveLongitude" /> <input type="hidden"
									id="groupActiveLatitude" name="groupActiveLatitude" />
							</div>
						</div>

						<div class="stepRight">
							<div class="advice" style="height: 84.4445px;"></div>
							<div class="advice" style="">
								<p>
									개설하려는 스터디그룹의<strong>'기간'</strong>을 설정해주세요.<br /> <br />
								<p>모집기간 : 스터디그룹원들을 모집하는 기한을 설정합니다.</p>
								<br />
								<p>활동기간 : 스터디그룹이 활동할 기한을 설정합니다.</p>
							</div>
							<div class="advice">
								<p>
									스터디그룹 특성에 맞는 <strong>이미지</strong>로 업로드 <br />해주시고 대표 이미지가 없을
									경우 추천하는 이미지를 선택해 사용할 수 있습니다
								</p>
							</div>
							<div class="advice">
								<p>
									참여자들이 <strong>장소</strong>를 명확히 알 수 있도록 <br />장소명을 입력해 주세요.
								</p>
							</div>
							<div class="advice">
								<p>
									<strong>장소</strong>를 지도에 표시하기 위해<br /> 지도 위치 설정을 해 주세요.<br />
									설정은 지역명이나 주요명칭을 기입하여<br /> 지정 할 수 있습니다.<br /> 시, 도, 구, 동 단위로
									설정할 수 있습니다.<br /> 지도를 클릭하고 핀을 이동하여 위치를<br /> 지정할 수도 있습니다.<br />
									<br /> 간혹 주소정보를 불러오지 못해<br /> 지역 범주에 속하지 못할 수 있습니다.
								</p>
							</div>
						</div>
						<div
							style="width: 100%; text-align: center; padding-top: 20px; clear: both;">
							<input type="button" class="prevStep_Second" value="이전 단계" /> <input
								type="button" class="nextStep_Second" value="다음 단계" />
						</div>
					</div>

				</div>


				<!-- 세번째 입력란 -->
				<div style="overflow: hidden; display: none;" class="thirdStep">
					<div class="stepLeft">
						<div class="input">
							<h2>부가 정보 입력</h2>
						</div>
						<div class="input">
							<h2>연락처 및 이메일 설정</h2>
							<div>
								<table>
									<tr>
										<th>개설자 전화번호 설정</th>
										<td><input type="hidden" name="groupTel" id="groupTel" />
											<select id="firstTel" name="firstTel">
												<option value="010" selected="selected">010</option>
												<option value="011">011</option>
												<option value="018">018</option>
										</select> - <input type="text" id="secondTel" name="secondTel">
											- <input type="text" name="thirdTel" id="thirdTel"></td>
									</tr>
									<tr>
										<th>개설자 이메일주소 설정</th>
										<td><input type="hidden" name="groupEmail"
											id="groupEmail" /> <input type="text" name="email" id="email">@
											<select id="domain" name="domain">
												<option value="naver.com">naver.com</option>
												<option value="gmail.com">gmail.com</option>
												<option value="daum.net">daum.net</option>
										</select></td>
									</tr>
								</table>
							</div>
						</div>

						<div class="input">
							<h2>태그 입력 및 설정</h2>
							<div
								style="border-top: 1px solid #eee; border-bottom: 1px solid #eee; background: #fafafa; margin: 30px 0; padding: 20px 5px">
								<div
									style="padding: 0 7px 0 5px; max-width: 900px; margin: auto">
									<textarea id="hero-demo"></textarea>
								</div>
							</div>
							<script src="https://code.jquery.com/ui/1.10.2/jquery-ui.min.js"></script>
							<script
								src="/WithProject/js/jquery.caret.min.js"></script>
							<script
								src="/WithProject/js/jquery.tag-editor.js"></script>
							<script>
                // jQuery UI autocomplete extension - suggest labels may contain HTML tags
                // github.com/scottgonzalez/jquery-ui-extensions/blob/master/src/autocomplete/jquery.ui.autocomplete.html.js
                (function($) {
                  var proto = $.ui.autocomplete.prototype, initSource = proto._initSource;
                  function filter(array, term) {
                    var matcher = new RegExp($.ui.autocomplete
                        .escapeRegex(term), "i");
                    return $.grep(array, function(value) {
                      return matcher.test($("<div>").html(
                          value.label || value.value || value).text());
                    });
                  }
                  $.extend(proto, {
                    _initSource : function() {
                      if (this.options.html && $.isArray(this.options.source)) {
                        this.source = function(request, response) {
                          response(filter(this.options.source, request.term));
                        };
                      } else {
                        initSource.call(this);
                      }
                    },
                    _renderItem : function(ul, item) {
                      return $("<li></li>").data("item.autocomplete", item)
                          .append(
                              $("<a></a>")[this.options.html ? "html" : "text"]
                                  (item.label)).appendTo(ul);
                    }
                  });
                })(jQuery);

                var cache = {};
                function googleSuggest(request, response) {
                  var term = request.term;
                  if (term in cache) {
                    response(cache[term]);
                    return;
                  }
                  $
                      .ajax({
                        url : 'https://query.yahooapis.com/v1/public/yql',
                        dataType : 'JSONP',
                        data : {
                          format : 'json',
                          q : 'select * from xml where url="http://google.com/complete/search?output=toolbar&q='
                              + term + '"'
                        },
                        success : function(data) {
                          var suggestions = [];
                          try {
                            var results = data.query.results.toplevel.CompleteSuggestion;
                          } catch (e) {
                            var results = [];
                          }
                          $.each(results, function() {
                            try {
                              var s = this.suggestion.data.toLowerCase();
                              suggestions.push({
                                label : s.replace(term, '<b>' + term + '</b>'),
                                value : s
                              });
                            } catch (e) {
                            }
                          });
                          cache[term] = suggestions;
                          response(suggestions);
                        }
                      });
                }

                $(function() {
                  $('#hero-demo').tagEditor({
                    placeholder : 'Enter tags ...',
                    autocomplete : {
                      source : googleSuggest,
                      minLength : 3,
                      delay : 250,
                      html : true,
                      position : {
                        collision : 'flip'
                      }
                    }
                  });

//                   $('#demo1').tagEditor({
//                     initialTags : [ 'Hello', 'World', 'Example', 'Tags' ],
//                     delimiter : ', ',
//                     placeholder : 'Enter tags ...'
//                   }).css('display', 'block').attr('readonly', true);

//                   $('#demo2').tagEditor(
//                       {
//                         autocomplete : {
//                           delay : 0,
//                           position : {
//                             collision : 'flip'
//                           },
//                           source : [ 'ActionScript', 'AppleScript', 'Asp',
//                               'BASIC', 'C', 'C++', 'CSS', 'Clojure', 'COBOL',
//                               'ColdFusion', 'Erlang', 'Fortran', 'Groovy',
//                               'Haskell', 'HTML', 'Java', 'JavaScript', 'Lisp',
//                               'Perl', 'PHP', 'Python', 'Ruby', 'Scala',
//                               'Scheme' ]
//                         },
//                         forceLowercase : false,
//                         placeholder : 'Programming languages ...'
//                       });

//                   $('#demo3').tagEditor({
//                     initialTags : [ 'Hello', 'World' ],
//                     placeholder : 'Enter tags ...'
//                   });
//                   $('#remove_all_tags').click(function() {
//                     var tags = $('#demo3').tagEditor('getTags')[0].tags;
//                     for (i = 0; i < tags.length; i++) {
//                       $('#demo3').tagEditor('removeTag', tags[i]);
//                     }
//                   });

//                   $('#demo4')
//                       .tagEditor(
//                           {
//                             initialTags : [ 'Hello', 'World' ],
//                             placeholder : 'Enter tags ...',
//                             onChange : function(field, editor, tags) {
//                               $('#response')
//                                   .prepend(
//                                       'Tags changed to: <i>'
//                                           + (tags.length ? tags.join(', ')
//                                               : '----') + '</i><hr>');
//                             },
//                             beforeTagSave : function(field, editor, tags, tag,
//                                 val) {
//                               $('#response').prepend(
//                                   'Tag <i>' + val + '</i> saved'
//                                       + (tag ? ' over <i>' + tag + '</i>' : '')
//                                       + '.<hr>');
//                             },
//                             beforeTagDelete : function(field, editor, tags, val) {
//                               var q = confirm('Remove tag "' + val + '"?');
//                               if (q)
//                                 $('#response').prepend(
//                                     'Tag <i>' + val + '</i> deleted.<hr>');
//                               else
//                                 $('#response').prepend(
//                                     'Removal of <i>' + val
//                                         + '</i> discarded.<hr>');
//                               return q;
//                             }
//                           });

//                   $('#demo5').tagEditor(
//                       {
//                         clickDelete : true,
//                         initialTags : [ 'custom style', 'dark tags',
//                             'delete on click', 'no delete icon', 'hello',
//                             'world' ],
//                         placeholder : 'Enter tags ...'
//                       });

                  function tag_classes(field, editor, tags) {
                    $('li', editor).each(function() {
                      var li = $(this);
                      if (li.find('.tag-editor-tag').html() == 'red')
                        li.addClass('red-tag');
                      else if (li.find('.tag-editor-tag').html() == 'green')
                        li.addClass('green-tag')
                      else
                        li.removeClass('red-tag green-tag');
                    });
                  }
//                   $('#demo6').tagEditor(
//                       {
//                         initialTags : [ 'custom', 'class', 'red', 'green',
//                             'demo' ],
//                         onChange : tag_classes
//                       });
//                   tag_classes(null, $('#demo6').tagEditor('getTags')[0].editor); // or editor == $('#demo6').next()
                });

                if (~window.location.href.indexOf('http')) {
                  (function() {
                    var po = document.createElement('script');
                    po.type = 'text/javascript';
                    po.async = true;
                    po.src = 'https://apis.google.com/js/plusone.js';
                    var s = document.getElementsByTagName('script')[0];
                    s.parentNode.insertBefore(po, s);
                  })();
             
                  $('#github_social')
                      .html(
                          '\
                <iframe style="float:left;margin-right:15px" src="//ghbtns.com/github-btn.html?user=Pixabay&repo=jQuery-tagEditor&type=watch&count=true" allowtransparency="true" frameborder="0" scrolling="0" width="110" height="20"></iframe>\
                <iframe style="float:left;margin-right:15px" src="//ghbtns.com/github-btn.html?user=Pixabay&repo=jQuery-tagEditor&type=fork&count=true" allowtransparency="true" frameborder="0" scrolling="0" width="110" height="20"></iframe>\
            ');
                }
              </script>
						</div>

						<div class="input">
							<h2>참여인원 및 선정방법 설정</h2>

							<table>
								<tr>
									<th>스터디그룹 최대 인원</th>
									<td><input type="text" name="groupMaxPerson"
										id="groupMaxPerson" size="4px">명</td>
								</tr>

								<tr>
									<th>스터디그룹 참여자 선정 방법</th>
									<td><select id="groupConfirmType" name="groupConfirmType">
											<option value="선착순">선착순</option>
											<option value="개설자 선정">개설자 선정</option>
									</select></td>
								</tr>
							</table>
						</div>
					</div>

					<div class="stepRight">
						<div class="advice" style="height: 84.4445px;"></div>
						<div class="advice" style="">
							<p>
								스터디그룹 개설자의 <br />
								<strong>'연락처와 이메일주소'</strong>를 설정해주세요.<br />
							</p>
						</div>
						<div class="advice">
							<p>
								해당 스터디그룹의 특성에 맞는 <strong>태그</strong>를<br /> 입력해주세요. <br /> <br />
								','(따옴표) 단위로 태그를 구분합니다. <br /> 태그는 스터디그룹 검색에 활용됩니다.
							</p>
						</div>
						<div class="advice">
							<p>
								스터디그룹의 <strong>최대 인원과<br /> 참여자 선정방법
								</strong>을 입력해주세요. <br /> <br /> 참여자 선정 방법 : 선착순, 개설자 선정
							</p>
						</div>
					</div>
					<div
						style="width: 100%; text-align: center; padding-top: 20px; clear: both;">
						<input type="button" class="prevStep_Thrid" value="이전 단계" /> <input
							type="button" class="create_Group" value="작성 완료" />
					</div>
			</div>
			</div>
		</form>
		</div>
	</main>
</body>
</html>