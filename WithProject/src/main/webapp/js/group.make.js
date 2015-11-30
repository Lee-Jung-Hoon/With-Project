//jQuery UI autocomplete extension - suggest labels may contain HTML tags
//github.com/scottgonzalez/jquery-ui-extensions/blob/master/src/autocomplete/jquery.ui.autocomplete.html.js
(function($) {
  var d = new Date();
  var strDate = d.getFullYear() + "-" + (d.getMonth()+1) + "-" + d.getDate();
  $("#groupRecruitStartDate").val(strDate);
  $("#groupRecruitEndDate").val(strDate);
  $("#groupRecruitEndDate").val(strDate);
  $("#groupStartDate").val(strDate);
  $("#groupEndDate").val(strDate);
  $("#groupStartTime").val("12:00:00");
  $("#groupEndTime").val("12:00:00");

  var proto = $.ui.autocomplete.prototype, initSource = proto._initSource;
  function filter(array, term) {
    var matcher = new RegExp($.ui.autocomplete.escapeRegex(term), "i");
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
 
 $('#WriteForm input[name=photo]').MultiFile({
   max: 3, //업로드 최대 파일 갯수 (지정하지 않으면 무한대)
   accept: 'jpg|png|gif', //허용할 확장자(지정하지 않으면 모든 확장자 허용)
   maxfile: 1024, //각 파일 최대 업로드 크기
   maxsize: 3024,  //전체 파일 최대 업로드 크기
   STRING: { //Multi-lingual support : 메시지 수정 가능
       remove : "제거", //추가한 파일 제거 문구, 이미태그를 사용하면 이미지사용가능
       duplicate : "$file 은 이미 선택된 파일입니다.", 
       denied : "$ext 는(은) 업로드 할수 없는 파일확장자입니다.",
       selected:'$file 을 선택했습니다.', 
       toomuch: "업로드할 수 있는 최대크기를 초과하였습니다.($size)", 
       toomany: "업로드할 수 있는 최대 갯수는 $max개 입니다.",
       toobig: "$file 은 크기가 매우 큽니다. (max $size)"
  },
  list:"#aflie3-list"
 });
})(jQuery);

var cache = {};
function googleSuggest(request, response) {
 var term = request.term;
 if (term in cache) {
  response(cache[term]);
  return;
 }
 $.ajax({
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

//                  $('#demo1').tagEditor({
//                    initialTags : [ 'Hello', 'World', 'Example', 'Tags' ],
//                    delimiter : ', ',
//                    placeholder : 'Enter tags ...'
//                  }).css('display', 'block').attr('readonly', true);

//                  $('#demo2').tagEditor(
//                      {
//                        autocomplete : {
//                          delay : 0,
//                          position : {
//                            collision : 'flip'
//                          },
//                          source : [ 'ActionScript', 'AppleScript', 'Asp',
//                              'BASIC', 'C', 'C++', 'CSS', 'Clojure', 'COBOL',
//                              'ColdFusion', 'Erlang', 'Fortran', 'Groovy',
//                              'Haskell', 'HTML', 'Java', 'JavaScript', 'Lisp',
//                              'Perl', 'PHP', 'Python', 'Ruby', 'Scala',
//                              'Scheme' ]
//                        },
//                        forceLowercase : false,
//                        placeholder : 'Programming languages ...'
//                      });

//                  $('#demo3').tagEditor({
//                    initialTags : [ 'Hello', 'World' ],
//                    placeholder : 'Enter tags ...'
//                  });
//                  $('#remove_all_tags').click(function() {
//                    var tags = $('#demo3').tagEditor('getTags')[0].tags;
//                    for (i = 0; i < tags.length; i++) {
//                      $('#demo3').tagEditor('removeTag', tags[i]);
//                    }
//                  });

//                  $('#demo4')
//                      .tagEditor(
//                          {
//                            initialTags : [ 'Hello', 'World' ],
//                            placeholder : 'Enter tags ...',
//                            onChange : function(field, editor, tags) {
//                              $('#response')
//                                  .prepend(
//                                      'Tags changed to: <i>'
//                                          + (tags.length ? tags.join(', ')
//                                              : '----') + '</i><hr>');
//                            },
//                            beforeTagSave : function(field, editor, tags, tag,
//                                val) {
//                              $('#response').prepend(
//                                  'Tag <i>' + val + '</i> saved'
//                                      + (tag ? ' over <i>' + tag + '</i>' : '')
//                                      + '.<hr>');
//                            },
//                            beforeTagDelete : function(field, editor, tags, val) {
//                              var q = confirm('Remove tag "' + val + '"?');
//                              if (q)
//                                $('#response').prepend(
//                                    'Tag <i>' + val + '</i> deleted.<hr>');
//                              else
//                                $('#response').prepend(
//                                    'Removal of <i>' + val
//                                        + '</i> discarded.<hr>');
//                              return q;
//                            }
//                          });

//                  $('#demo5').tagEditor(
//                      {
//                        clickDelete : true,
//                        initialTags : [ 'custom style', 'dark tags',
//                            'delete on click', 'no delete icon', 'hello',
//                            'world' ],
//                        placeholder : 'Enter tags ...'
//                      });

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
//                  $('#demo6').tagEditor(
//                      {
//                        initialTags : [ 'custom', 'class', 'red', 'green',
//                            'demo' ],
//                        onChange : tag_classes
//                      });
//                  tag_classes(null, $('#demo6').tagEditor('getTags')[0].editor); // or editor == $('#demo6').next()
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
    .html('\
<iframe style="float:left;margin-right:15px" src="//ghbtns.com/github-btn.html?user=Pixabay&repo=jQuery-tagEditor&type=watch&count=true" allowtransparency="true" frameborder="0" scrolling="0" width="110" height="20"></iframe>\
<iframe style="float:left;margin-right:15px" src="//ghbtns.com/github-btn.html?user=Pixabay&repo=jQuery-tagEditor&type=fork&count=true" allowtransparency="true" frameborder="0" scrolling="0" width="110" height="20"></iframe>\
');
}
$.uploadPreview({
 input_field : "#image-upload", // Default: .image-upload
 preview_box : "#image-preview", // Default: .image-preview
 label_field : "#image-label", // Default: .image-label
 label_default : "Choose File", // Default: Choose File
 label_selected : "Change File", // Default: Change File
 no_label : false
//Default: false
});

var oEditors = [];

//현재 위치를 얻어올 수 있는 경우
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
//현재 위치를 얻어오지 못하는 경우
else {
 alert("현재 위치 정보를 얻어오지 못했습니다.");
}
setTimeout(function(){
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
 
},1000);


//               google.maps.event.trigger(map,'resize');

//첫번째 다음 스텝 버튼이 눌러졌을 경우
$(".nextStep_First").on('click', function() {
 $(".secondStep").removeClass('blind').siblings('div').addClass('blind');
 $(window).scrollTop(0);
});

//두번째 다음 스텝 버튼이 눌러졌을 경우
$(".nextStep_Second").on('click', function() {
 //$(".secondStep").hide();
 $(".thirdStep").removeClass('blind').siblings('div').addClass('blind');
 $(window).scrollTop(0);
});

$(".prevStep_Second").on('click', function() {
 //$(".secondStep").hide();
 $(".firstStep").removeClass('blind').siblings('div').addClass('blind');
 $(window).scrollTop(0);
});

$(".prevStep_Thrid").on('click', function() {
 //$(".thirdStep").hide();
 $(".secondStep").removeClass('blind').siblings('div').addClass('blind');
 $(window).scrollTop(0);
});

$(".create_Group").click( function() {
    oEditors.getById["groupDetail"].exec("UPDATE_CONTENTS_FIELD", []);
    $("#groupTel").val($("#firstTel").val() + $("#secondTel").val() + $("#thirdTel").val());
    $("#groupEmail").val($("#email").val() + "@" + $("#domain").val());
    $("#tag").val($("#hero-demo").val());
    $("#WriteForm").submit();
});