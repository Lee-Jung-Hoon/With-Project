$(document).ready(function() {
  var startPage = 1;
  var endPage = 20;
  MainList(startPage, endPage);
  
  // 즐겨찾기 드랍존 관련 부분
  $( ".bookmarkZone" ).droppable({
    drop: function( event, ui ) {
      var id = ($(ui.draggable).attr("id"));
      console.log(id);
      // 즐겨찾기 성공
      $.ajax({
        url: "/WithProject/studygroup/groupBookmark.json?groupNo="+id
      })
      .done(function(msg) {
        alert(msg);
      })
    }
  });

  $("#crateGroup").on('click', function() {
    location.href = '/WithProject/main/createGroup.do';
  });

  $(document).scroll(function() {
    var documentHeight = $(document).height();
    var scrollBottom = $(window).scrollTop() + $(window).height();
    //console.log(documentHeight);
    //console.log(scrollBottom);
    if (documentHeight < scrollBottom + 100) {
      startPage = startPage + 20;
      endPage = endPage + 20;
      MainList(startPage, endPage);
    }
  });
/*
  $('.show-login').on('click', function() {
    $(this).next().fadeIn('fast');
  });

  $('.close-login').on('click', function() {
    $(this).parent().fadeOut('fast');
  });
*/
});

function MainList(startPage, endPage) {
  // ajax 리스트 호출
  $.ajax(
      {
        url : "/WithProject/studygroup/groupList.json?startPage=" + startPage
            + "&endPage=" + endPage,
        dataType : "json"
      }).done(function(response) {
    ListCallback(response, startPage);
  });
}
function ListCallback(response, startPage) {
  var data = JSON.stringify(response);
  $.each(response, function(index, value) {
    var divHTML = "";
    divHTML = '<div id="'+response[index].groupNo+'" class="img-wrap">' + ' <div class="img-content">'
        + '<div class="img-inner">'
        + '<span class="img"><img src="' + response[index].groupRepImagePath + '" alt="" /></span>'
        + '<span class="txt">' + response[index].groupName + '<br /></span>'
        + '</div>'
        + '<div class="spine spine-left"><button type="button" data-num='+response[index].groupNo+'>왼쪽</button></div>'
        + '<div class="spine spine-right"><button type="button">오른쪽</button></div>'
        + '</div></div>';
    $("#container").append(divHTML);
  });
  if (startPage == 1)
    showLetter();
  setTimeout(function() {
    $('#container').pinto({
      itemWidth : 180,
      gapX : 10,
      gapY : 10,
      onItemLayout : function($item, column, position) {
      }
    });
  }, 500);
  ready();
};

function generateRandom() {
  var num = Math.floor(Math.random() * 1000);
  return num;

}
function showLetter() {
  $(".img-wrap").first().siblings().each(function() {
    var left = generateRandom();
    var top = generateRandom();
    $(this).css({
      "top" : top + "px",
      "left" : left + "px"
    });
  });
}

function ready() {

  var top, left, temp, drop, tempIndex, dropIndex;
  isDrop = false;
  $('.img-wrap:not(:eq(0))').draggable({
    'start' : function(event, ui) {
      top = ui.position.top;
      left = ui.position.left;
      temp = $(this);
      tempIndex = temp.index();
    },
    'drag' : function(event, ui) {
      $(this).addClass('z-index');
    },
    'stop' : function(event, ui) {
      if (isDrop == false) {
        $(this).animate({
          'top' : top,
          'left' : left
        }, 'slow', function() {
          $(this).removeClass('z-index');
        });
      } else {
        $(this).removeClass('z-index');
      }
    }
  }).droppable({
    'drag' : function(event, ui) {

    },
    'drop' : function(event, ui) {
      isDrop = true;
      dropIndex = $(this).index();
      num = tempIndex - dropIndex;
      if (dropIndex == 0) {
        isDrop = false;
      } else if (num == -1) {
        $(this).after(temp);
      } else {
        $(this).before(temp);
      }
      $('#container').pinto();
    }
  });
  var isClick = false;
  
  
  
  $('.img-wrap').on('mousemove', function(event) {

    var position = $(this).offset();
    var spot = event.pageX - position.left;

    var standard = 91;
    var rest = 10;
    if (spot < standard - rest) {
      $(this).removeClass('position-right').addClass('position-left');
    } else if (spot > standard + rest) {
      $(this).removeClass('position-left').addClass('position-right');
    } else {
      $(this).removeClass('position-right').removeClass('position-left');
    }
  }).on('mouseleave', function() {
    if (isClick == false) {
      $(this).removeClass('position-right').removeClass('position-left');
    }
  });

  
  // 상세 정보 출력
  $('.img-wrap button').on('click', function() {
    var no = $(this).attr('data-num');
    $.ajax({
          url : "/WithProject/studygroup/groupDetail.json?groupNo="+no,
          dataType : "json"
        }).done(function(response) {
    var HTML = "";
    HTML += "<div class='roll-btn-wrap'>";
    HTML += "<button type='button' class='roll-btn roll-btn-left'>";
    HTML += "<span class='left'></span>";
    HTML += "</button>";
    HTML += "</div>";
    HTML += "<div class='roll-btn-wrap'>";
    HTML += "<button type='button' class='roll-btn roll-btn-right'>";
    HTML += "<span class='right'></span>";
    HTML += "</button>";
    HTML += "</div>";
    HTML += "<div class='img-rolling'>";
    HTML += "<ul>";
    HTML += "<li><img src='/WithProject/images/sample.jpg' alt='' /></li>";
    HTML += "<li><img src='/WithProject/images/sample1.jpg' alt='' /></li>";
    HTML += "<li><img src='/WithProject/images/sample2.jpg' alt='' /></li>";
    HTML += "<li><img src='/WithProject/images/sample3.jpg' alt='' /></li>";
    HTML += "<li><img src='/WithProject/images/sample4.jpg' alt='' /></li>";
    HTML += "<li><img src='/WithProject/images/sample5.jpg' alt='' /></li>";
    HTML += "</ul>";
    HTML += "</div>";
    HTML += "<div class='img-rolling-s'>";
    HTML += "<span class='current'></span>";
    HTML += "<ul>";
    HTML += "<li><a href='#'><img src='/WithProject/images/sample.jpg' alt='' /></a></li>";
    HTML += " <li><a href='#'><img src='/WithProject/images/sample1.jpg'alt='' /></a></li>";
    HTML += "<li><a href='#'><img src='/WithProject/images/sample2.jpg'alt='' /></a></li>";
    HTML += " <li><a href='#'><img src='/WithProject/images/sample3.jpg'alt='' /></a></li>";
    HTML += " <li><a href='#'><img src='/WithProject/images/sample4.jpg'alt='' /></a></li>";
    HTML += " <li><a href='#'><img src='/WithProject/images/sample5.jpg'alt='' /></a></li>";
    HTML += "</ul>";
    HTML += "</div>";
    HTML += "<div class='list-txt'>";
    HTML += " <div>";
    HTML += "  <div class='list-studygroupName'>"+response.groupName+"</div>";
    HTML += "  <div class='list-studygroupInfo'>";
    HTML += " <div>";
    HTML += "<label class='list-infoLabel'>스터디그룹 정보</label>";
    HTML += "</div>";
    HTML += "<div class='list-infoDIV'>";
    HTML += "<div class='list-infoImgDIV'>";
    HTML += "<img class='list-infoImg' src='/WithProject/images/"+response.groupRepImagePath+"' alt=''>";
    HTML += "</div>";
    HTML += "<div class='list-infoUl'>";
    HTML += "<ul>";
    HTML += "<li style='padding-bottom: 10px;'>그룹 활동 기간 : </li>";
    HTML += "<li style='padding-bottom: 10px;'>그룹원 모집 기간 : " + response.groupRecruitStartDate + " ~ " + response.groupRecruitEndDate + "</li>";
    HTML += "<li style='padding-bottom: 10px;'>주 모임 장소 : " + response.groupActivePlace + "</li>";
    HTML += "</ul>";
    HTML += "</div>";
    HTML += "<div class='list-BtnDIV'>";
    HTML += "<input class='enterBtn' type='button' value='참가 신청'> <input class='cancleBtn' type='button' value='참가 수정 및 취소'>";
    HTML += "</div>";
    HTML += "</div>";
    HTML += "<div class='list-studygroupMap'>";
    HTML += "<div id='map' style='width: 800px; height: 350px;'>";
    HTML +="</div>";
    HTML += "</div>";
    HTML += "</div>";
    HTML += "</div>";
    HTML += "<div style='margin-top: 20px;'>";
    HTML += "<label class='list-infoLabel'>스터디그룹 회원 분포</label>";
    HTML += " <div id='dashboard' style='text-align: center;'>";
    HTML += " <script>";
    HTML += "  var freqData=[{State:'10대',freq:{male:1319, female:249}}";
    HTML += " ,{State:'20대',freq:{male:412, female:674}}";
    HTML += "    ,{State:'30대',freq:{male:2149, female:418}}";
    HTML += "   ,{State:'40대',freq:{male:1152, female:1862}}";
    HTML += "    ,{State:'50대',freq:{male:1152, female:1862}}";
    HTML += "    ];";
    HTML += "   dashboard('#dashboard',freqData);";
    HTML += " </script>";
    HTML += " </div>";
    HTML += " </div>";
    HTML += " <div class='list-openDIV'>";
    HTML += "  <div style='margin-bottom: 20px;'>";
    HTML += "  <label class='list-infoLabel'>스터디그룹 개설자 정보</label>";
    HTML += " <label>              *본 모임의 개설자로 문의사항은 전화 또는 메일로 문의해 주세요.</label>";
    HTML += " </div>";
    HTML += " <div class='list-openImgDIV'>";
    HTML += " <img class='list-openImg' src='/WithProject/images/sample.jpg'>";
    HTML += "</div>";
    HTML += "<div class='list-openUl'>";
    HTML += "  <ul style='padding-top: 50px;'>";
    HTML += "   <li style='padding-bottom: 20px;'>이름</li>";
    HTML += "  <li style='padding-bottom: 20px;'>"+response.groupEmail+" - "+response.groupTel+"</li>";
    HTML += " </ul>";
    HTML += " </div>";
    HTML += " </div>";
    HTML += "</div>";

    $(".list-content").html('').append(HTML);
    
    var mapContainer = document.getElementById('map'),
    mapOption = {
      center : new daum.maps.LatLng(response.groupActiveLatitude, response.groupActiveLongitude),
      level : 3
    }

    var map = new daum.maps.Map(mapContainer, mapOption);

    var markerPosition = new daum.maps.LatLng(response.groupActiveLatitude, response.groupActiveLongitude);

    var marker = new daum.maps.Marker({
                    position : markerPosition});

    marker.setMap(map);

    var iwContent = "<div style='padding:5px;'>주활동 지역<br>";
      iwContent +="<a href='http://map.daum.net/link/map/"+response.groupActivePlace+","+response.groupActiveLatitude+","+response.groupActiveLongitude+"' style='color:blue' target='_blank'>큰지도보기</a>";
      iwContent +="<a href='http://map.daum.net/link/to/"+response.groupActivePlace+","+response.groupActiveLatitude+","+response.groupActiveLongitude+"' style='color:blue' target='_blank'>길찾기</a></div>";
    iwPosition = new daum.maps.LatLng(response.groupActiveLatitude, response.groupActiveLongitude);

 
    
    var infowindow = new daum.maps.InfoWindow({
    position : iwPosition,
    content : iwContent
    });

    infowindow.open(map, marker);
    
    isClick = true;
    $(this).parents('.img-wrap').addClass('on');
    $('body').addClass('view');
    imageEffect();
    var scroll = $(window).scrollTop();
    //var boxTop = parseInt($('.box').css('top'));
    $('.box').addClass('open', callbackOpen).css('top',30 + scroll + 'px');
    return false;
  });

  $('.box .btn-close').on('click', function() {
    $('.box').removeClass('open', callbackClose);
    $('.list-content').removeClass('scroll');
    isClick = false;
  });

  var slide, slideAction, isOver;

  function callbackOpen() {
    setTimeout(function() {
      $('.list-content').addClass('scroll');
    }, 1000);
  }
  function callbackClose() {
    setTimeout(function() {
      $('body').removeClass('view');
      $('.img-wrap').removeClass('on');
    }, 1000);
  }
  });

}

//d3.js 그래프 부분입니다.

function dashboard(id, fData) {
  var barColor = 'steelblue';
  function segColor(c) {
    return {
      male : "#e08214",
      female : "#41ab5d"
    }[c];
  }

  // compute total for each state.
  fData.forEach(function(d) {
    d.total = d.freq.male + d.freq.female;
  });

  // function to handle histogram.
  function histoGram(fD) {
    var hG = {}, hGDim = {
      t : 60,
      r : 0,
      b : 30,
      l : 0
    };
    hGDim.w = 500 - hGDim.l - hGDim.r, hGDim.h = 300 - hGDim.t - hGDim.b;

    //create svg for histogram.
    var hGsvg = d3.select(id).append("svg").attr("width",
        hGDim.w + hGDim.l + hGDim.r)
        .attr("height", hGDim.h + hGDim.t + hGDim.b).append("g").attr(
            "transform", "translate(" + hGDim.l + "," + hGDim.t + ")");

    // create function for x-axis mapping.
    var x = d3.scale.ordinal().rangeRoundBands([ 0, hGDim.w ], 0.1).domain(
        fD.map(function(d) {
          return d[0];
        }));

    // Add x-axis to the histogram svg.
    hGsvg.append("g").attr("class", "x axis").attr("transform",
        "translate(0," + hGDim.h + ")").call(
        d3.svg.axis().scale(x).orient("bottom"));

    // Create function for y-axis map.
    var y = d3.scale.linear().range([ hGDim.h, 0 ]).domain(
        [ 0, d3.max(fD, function(d) {
          return d[1];
        }) ]);

    // Create bars for histogram to contain rectangles and freq labels.
    var bars = hGsvg.selectAll(".bar").data(fD).enter().append("g").attr(
        "class", "bar");

    //create the rectangles.
    bars.append("rect").attr("x", function(d) {
      return x(d[0]);
    }).attr("y", function(d) {
      return y(d[1]);
    }).attr("width", x.rangeBand()).attr("height", function(d) {
      return hGDim.h - y(d[1]);
    }).attr('fill', barColor).on("mouseover", mouseover)// mouseover is defined below.
    .on("mouseout", mouseout);// mouseout is defined below.

    //Create the frequency labels above the rectangles.
    bars.append("text").text(function(d) {
      return d3.format(",")(d[1])
    }).attr("x", function(d) {
      return x(d[0]) + x.rangeBand() / 2;
    }).attr("y", function(d) {
      return y(d[1]) - 5;
    }).attr("text-anchor", "middle");

    function mouseover(d) { // utility function to be called on mouseover.
      // filter for selected state.
      var st = fData.filter(function(s) {
        return s.State == d[0];
      })[0], nD = d3.keys(st.freq).map(function(s) {
        return {
          type : s,
          freq : st.freq[s]
        };
      });

      // call update functions of pie-chart and legend.    
      pC.update(nD);
      leg.update(nD);
    }

    function mouseout(d) { // utility function to be called on mouseout.
      // reset the pie-chart and legend.    
      pC.update(tF);
      leg.update(tF);
    }

    // create function to update the bars. This will be used by pie-chart.
    hG.update = function(nD, color) {
      // update the domain of the y-axis map to reflect change in frequencies.
      y.domain([ 0, d3.max(nD, function(d) {
        return d[1];
      }) ]);

      // Attach the new data to the bars.
      var bars = hGsvg.selectAll(".bar").data(nD);

      // transition the height and color of rectangles.
      bars.select("rect").transition().duration(500).attr("y", function(d) {
        return y(d[1]);
      }).attr("height", function(d) {
        return hGDim.h - y(d[1]);
      }).attr("fill", color);

      // transition the frequency labels location and change value.
      bars.select("text").transition().duration(500).text(function(d) {
        return d3.format(",")(d[1])
      }).attr("y", function(d) {
        return y(d[1]) - 5;
      });
    }
    return hG;
  }

  // function to handle pieChart.
  function pieChart(pD) {
    var pC = {}, pieDim = {
      w : 250,
      h : 250
    };
    pieDim.r = Math.min(pieDim.w, pieDim.h) / 2;

    // create svg for pie chart.
    var piesvg = d3.select(id).append("svg").attr("width", pieDim.w).attr(
        "height", pieDim.h).append("g").attr("transform",
        "translate(" + pieDim.w / 2 + "," + pieDim.h / 2 + ")");

    // create function to draw the arcs of the pie slices.
    var arc = d3.svg.arc().outerRadius(pieDim.r - 10).innerRadius(0);

    // create a function to compute the pie slice angles.
    var pie = d3.layout.pie().sort(null).value(function(d) {
      return d.freq;
    });

    // Draw the pie slices.
    piesvg.selectAll("path").data(pie(pD)).enter().append("path")
        .attr("d", arc).each(function(d) {
          this._current = d;
        }).style("fill", function(d) {
          return segColor(d.data.type);
        }).on("mouseover", mouseover).on("mouseout", mouseout);

    // create function to update pie-chart. This will be used by histogram.
    pC.update = function(nD) {
      piesvg.selectAll("path").data(pie(nD)).transition().duration(500)
          .attrTween("d", arcTween);
    }
    // Utility function to be called on mouseover a pie slice.
    function mouseover(d) {
      // call the update function of histogram with new data.
      hG.update(fData.map(function(v) {
        return [ v.State, v.freq[d.data.type] ];
      }), segColor(d.data.type));
    }
    //Utility function to be called on mouseout a pie slice.
    function mouseout(d) {
      // call the update function of histogram with all data.
      hG.update(fData.map(function(v) {
        return [ v.State, v.total ];
      }), barColor);
    }
    // Animating the pie-slice requiring a custom function which specifies
    // how the intermediate paths should be drawn.
    function arcTween(a) {
      var i = d3.interpolate(this._current, a);
      this._current = i(0);
      return function(t) {
        return arc(i(t));
      };
    }
    return pC;
  }

  // function to handle legend.
  function legend(lD) {
    var leg = {};

    // create table for legend.
    var legend = d3.select(id).append("table").attr('class', 'legend');

    // create one row per segment.
    var tr = legend.append("tbody").selectAll("tr").data(lD).enter().append(
        "tr");

    // create the first column for each segment.
    tr.append("td").append("svg").attr("width", '16').attr("height", '16')
        .append("rect").attr("width", '16').attr("height", '16').attr("fill",
            function(d) {
              return segColor(d.type);
            });

    // create the second column for each segment.
    tr.append("td").text(function(d) {
      return d.type;
    });

    // create the third column for each segment.
    tr.append("td").attr("class", 'legendFreq').text(function(d) {
      return d3.format(",")(d.freq);
    });

    // create the fourth column for each segment.
    tr.append("td").attr("class", 'legendPerc').text(function(d) {
      return getLegend(d, lD);
    });

    // Utility function to be used to update the legend.
    leg.update = function(nD) {
      // update the data attached to the row elements.
      var l = legend.select("tbody").selectAll("tr").data(nD);

      // update the frequencies.
      l.select(".legendFreq").text(function(d) {
        return d3.format(",")(d.freq);
      });

      // update the percentage column.
      l.select(".legendPerc").text(function(d) {
        return getLegend(d, nD);
      });
    }

    function getLegend(d, aD) { // Utility function to compute percentage.
      return d3.format("%")(d.freq / d3.sum(aD.map(function(v) {
        return v.freq;
      })));
    }

    return leg;
  }

  // calculate total frequency by segment for all state.
  var tF = [ 'male', 'female' ].map(function(d) {
    return {
      type : d,
      freq : d3.sum(fData.map(function(t) {
        return t.freq[d];
      }))
    };
  });

  // calculate total frequency by state for all segment.
  var sF = fData.map(function(d) {
    return [ d.State, d.total ];
  });

  var hG = histoGram(sF), // create the histogram.
  pC = pieChart(tF), // create the pie-chart.
  leg = legend(tF); // create the legend.
}

/* 작은 이미지 효과 */
function imageEffect() {
  

var rollBtnS = $('.img-rolling-s > ul > li > a').on('click', function() {
  index = $(this).parent().index();
  cnt = index - 1;
  $('.roll-btn-right').click();
  imageS(current, size, index);
  return false;
});
function imageS(current, size, index) {
  current.stop().css('z-index', 999).animate({
    'top' : size * index + 'px'
  }, 300, function() {
    $(this).css('z-index', 0);
  });
  $('.img-rolling-s').stop().animate({
    scrollTop : index * size
  }, 500);
}

/* 롤링 */

/* 큰 이미지 선언 */
var rLen = $('.img-rolling > ul > li').length;
var W = parseInt($('.img-rolling > ul > li').css('width'));
var rollBtn = $('.roll-btn');
var cnt = 0;

/* 작은 이미지 선언 */
var current = $('.current');
var size = 116;

/* 큰 이미지 효과 */
$('.img-rolling > ul').css('width', W * rLen + 'px');
rollBtn.on('click', function() {
  if ($(this).hasClass('roll-btn-right')) {
    if (cnt == rLen - 1) {
      cnt = 0;
    } else {
      cnt++;
    }
  } else {
    if (cnt == 0) {
      cnt = rLen - 1;
    } else {
      cnt--;
    }
  }
  $('.img-rolling > ul').css('transform', 'translateX(-' + W * cnt + 'px)');
  imageS(current, size, cnt);
});
}