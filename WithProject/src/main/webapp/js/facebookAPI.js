     
      // 페이스북에서 불러올수 있는 API Key값과 실행문
     window.fbAsyncInit = function() {
      FB.init({
        appId      : '913474612022887', // 앱 ID
        status     : true,          // 로그인 상태를 확인
        cookie     : false,          // 쿠키허용
        xfbml      : true           // parse XFBML
      });
      
      FB.getLoginStatus(function(response) {
        statusChangeCallback(response);
      });
      
     FB.Event.subscribe('auth.login', function(response) {
        location.reload();
      
      });
     
      FB.Event.subscribe('auth.logout', function(response) {
        location.reload();
      
      });
    };
  
    function statusChangeCallback(response) {
      console.log('statusChangeCallback');
      
      console.log(response);
      if (response.status === 'connected') {
        inputData(response);
        
      } else if (response.status === 'not_authorized') {
        console.log("Please log into this app");
      } else {
        console.log("Please log into Facebook.");
      }
    }

      // 페이스북 로그인 버튼 
    (function(d){
      var js, id = 'facebook-jssdk', ref = d.getElementsByTagName('script')[0];
      if (d.getElementById(id)) {
        return;
        }
      js = d.createElement('script'); js.id = id; 
      js.async = true;
      js.src = "//connect.facebook.net/ko_KR/all.js";
      ref.parentNode.insertBefore(js, ref);
    }(document));
  
  
  //ajax로 페이스북 정보 DB 저장
  function inputData(response) {
    FB.api('/me?fields=name, email, picture, age_range, gender', function (response) {
      $.post("/WithProject/member/fbookLogin.do", 
        {
           memberName : response.name,
           id : response.email,
           memberImg : response.picture.data.url,
           memberGender : response.gender,
           memberAge : response.age_range.min
          }
      );
    });
  };
  
