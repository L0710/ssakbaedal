<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- <script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
<script src="https://apis.google.com/js/platform.js" async defer></script>
<meta name="google-signin-client_id" content="1080594680359-76pin2bglpice9fuk3lc4396l20rlkuu.apps.googleusercontent.com">
 -->
<meta name="google-signin-scope" content="profile email"> 
<meta name="google-signin-client_id" content="My API KeyNumber.apps.googleusercontent.com"> 
<!-- KaKao Login Js --> 
<script type="text/javascript" src="https://developers.kakao.com/sdk/js/kakao.js"></script> 
<!-- Google Login Js --> 
<script src="https://apis.google.com/js/platform.js?onload=onLoad" async defer></script> <script src="https://apis.google.com/js/platform.js?onload=triggerGoogleLoaded"></script> 
<script src="https://apis.google.com/js/platform.js?onload=init" async defer></script> <script src="http://localhost:8800/ssakbaedal/signUp.do/platform.js" async defer></script> 
<!-- Naver Login Js --> 
<script type="text/javascript" src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.0.js" charset="utf-8"></script>

<!DOCTYPE html>
<html> 
<head> 
<meta charset="UTF-8">
<title>signUp</title>
    <style>
    /* 공통 css */ 

    *:focus{
        outline: none;
    }

    /* 공통,색별 버튼 css*/
    button {
        cursor: pointer;
        margin: 3px;
        padding: 10px 20px;
    }

    /* div별 css */
	section{
	 background-color: rgb(130, 180, 127, 0.7);
	 background-image: url( "resources/img/background.png" );
	 background-size: 100% 100%;
	 margin: 1% auto 1%;
	 padding: 5%;
	}

    #sing_up_div{
    	background-color: rgb(246, 246, 246, 0.7);
    	border-radius: 50px;
        padding: 10px;
        margin: 1% auto 1%;
        min-width: 400px;
        width: 50%;
        height: 50%;
        text-align: center;
        
    }
    /* #sing_up_div 버튼공통 css */
    #sing_up_div button:hover{
        background-color: rgb(64, 64, 64);
    }
    #sing_up_div button{
        display: block;
        border: none;
        border-radius: 10px;
        width: 300px;
        height: 65px;
        margin: 20px auto ;
        letter-spacing: 10px;
        color: white;
        font-size: 20px;
        
    }
    /* 버튼별 css */
    .sing_up{
        background-color: rgb(64, 64, 64, 0.7);
    }
    #kakao{
        margin: 5px;
    }
    #google{
        width: 68px;
        height: 69px;
        border-radius: 10px;
        margin: 5px;
    }


    </style>
</head>
<body>
<jsp:include page="../common/headerbar.jsp" />
        <section>
            <div id="sing_up_div">
                <h2>회원가입</h2>
                <P>아래의 회원가입 유형을 선택해 주세요.</P>
                <c:url var="mSignUp" value="mSignUp.do"/>
                <c:url var="sSignUp" value="sSignUp.do"/>
                <button id="sign_up_m" class="sing_up" onclick="location.href='${mSignUp}'">일반회원</button>
                <button id="sign_up_s" class="sing_up" onclick="location.href='${sSignUp}'">매장회원</button>
                <hr style="width: 85%;">
                <h3>SNS 회원가입</h3>
                <c:url var="sns" value="snsSignUp.do" />
                <!-- <img src="https://developers.kakao.com/assets/img/about/logos/kakaolink/kakaolink_btn_medium.png" id="kakao" onclick="snskakao();"/>				
                <input type="image" id="google" name="button" src="resources/img/google.png" onclick="Google();"/>				
				<div class="g-signin2" data-onsuccess="onSignIn" id="hidenn_google" ></div> -->
				<!-- Google Login Btn --> 
				<div class="g-signin2" style="max-width:400px;max-height:60px" data-onsuccess="onSignIn" data-theme="dark" data-width="auto" data-height="60"></div> 
				<!-- Naver Login Btn --> 
				<div id="naverIdLogin" > 
				<a id="naverIdLogin_loginButton"> 
				<img src="https://static.nid.naver.com/oauth/big_g.PNG?version=js-2.0.0" width="100%" height="auto" style="max-width:400px;max-height:60px"/> 
				</a> 
				</div> 
				<!-- KaKao Login Btn --> 
				<a id="login-form-btn" href="javascript:loginFormWithKakao()"> 
				<img src="//k.kakaocdn.net/14/dn/btqCn0WEmI3/nijroPfbpCa4at5EIsjyf0/o.jpg" width="100%" height="auto" style="max-width:400px;max-height:60px"/> 
				</a>

				
				
				
				
				
				
				
            </div>
        </section>
        <script langqwuage="javascript">
/*         // SDK를 초기화 합니다. 사용할 앱의 JavaScript 키를 설정해 주세요.
        Kakao.init('54a0daec21ba792b78efb112d8522735');
        // SDK 초기화 여부를 판단합니다.
        console.log(Kakao.isInitialized());
        var url = "";
        var gender = "";
        var email = "";
        var name = "";
		function snskakao() {
	            Kakao.Auth.login({
	            	success: function(authObj) {
	            	      Kakao.API.request({
	            	        url: '/v2/user/me',
	            	        success: function(res) {
	            	        	email = res.kakao_account.email;
	            	        	if(res.kakao_account.gender = "female"){
	            	        		gender="F";
	            	        	}else if(res.kakao_account.gender = "male"){
	            	        		gender="M";
	            	        	}
	            	          url = "email="+ email+"&"+"gender="+ gender +"&";
	            	          
	            	          Kakao.API.request({url: '/v1/user/unlink'});
	            	          location.href = "http://localhost:8800/ssakbaedal/snsSignUp.do?"+url;
	            	        },
	            	        fail: function(error) {
	            	          alert(
	            	            'login success, but failed to request user information: ' +
	            	              JSON.stringify(error)
	            	          )
	            	        },
	            	      })
	            	    },
	            	    fail: function(err) {
	            	      alert('failed to login: ' + JSON.stringify(err))
	            	    },
	            })
		}
		function onSignIn(googleUser) {
			  var profile = googleUser.getBasicProfile();
			  console.log('Name: ' + profile.getName());
			  console.log('Email: ' + profile.getEmail()); 
			  email = profile.getEmail();
			  name = profile.getName();
			}
		var google = document.getElementById("hidenn_google");
		function Google() {
			google.onclick();
		  url = "email="+ email+"&"+"name="+ name +"&";
		  console.log(email,name);
		  location.href = "http://localhost:8800/ssakbaedal/snsSignUp.do?"+url;
		} */

        var url = "";
        var gender = "";
        var email = "";
        var name = "";
		
		var naverLogin = new naver.LoginWithNaverId({ 
			clientId: "clientId", 
			callbackUrl: "callbackUrl", 
			isPopup: false, 
			/* callback 페이지가 분리되었을 경우에 callback 페이지에서는 callback처리를 해줄수 있도록 설정합니다. */ 
			}); 
		/* (3) 네아로 로그인 정보를 초기화하기 위하여 init을 호출 */ 
		naverLogin.init(); 
		/* (4) Callback의 처리. 정상적으로 Callback 처리가 완료될 경우 main page로 redirect(또는 Popup close) */ 
		window.addEventListener('load', function () { 
			naverLogin.getLoginStatus(function (status) { 
				if (status) { 
					/* (5) 필수적으로 받아야하는 프로필 정보가 있다면 callback처리 시점에 체크 */ 
					console.log(naverLogin.accessToken.accessToken) 
					var email = naverLogin.user.getEmail(); 
					var profileImage = naverLogin.user.getProfileImage(); 
					var name = naverLogin.user.getName(); 
					var uniqId = naverLogin.user.getId(); 
					if( email == undefined || email == null) { alert("이메일은 필수정보입니다. 정보제공을 동의해주세요."); 
					/* (5-1) 사용자 정보 재동의를 위하여 다시 네아로 동의페이지로 이동함 */ 
					naverLogin.reprompt(); 
					return; 
					}else if( name == undefined || name == null){ 
						alert("회원이름은 필수정보입니다. 정보제공을 동의해주세요."); 
						naverLogin.reprompt(); 
						return; 
						}else{ 
							// 성공 
							} 
					} else {
						console.log("callback 처리에 실패하였습니다."); 
						} 
				}); 
			}); 
		Kakao.init('54a0daec21ba792b78efb112d8522735'); 
		function loginFormWithKakao() { 
			Kakao.Auth.loginForm({ 
				success: function(authObj) { 
					Kakao.API.request({ 
						url: '/v2/user/me', 
						success: function(res) { 
            	        	email = res.kakao_account.email;
            	        	if(res.kakao_account.gender = "female"){
            	        		gender="F";
            	        	}else if(res.kakao_account.gender = "male"){
            	        		gender="M";
            	        	}
            	          url = "email="+ email+"&"+"gender="+ gender +"&";
            	          
            	          Kakao.API.request({url: '/v1/user/unlink'});
            	          location.href = "http://localhost:8800/ssakbaedal/snsSignUp.do?"+url;
							} 
					}) 
					}, 
					fail: function(err) { 
						alert(JSON.stringify(err)) 
						}, 
						}) 
						} 
		$(document).ready(function(){ 
			
		}) 
		$(function(){ 
			$('#login').on("click",function(){ 
				js_login(); 
				}) 
				$('#naverIdLogin_loginButton').on("click",function(){ 
					var email = $('#naver_email').val(); 
					var password = $('#naver_password').val(); 
					$('.email').val(email); 
					$('.password').val(password); 
					}); 
			}); 
		function googleSign(){ 
			
		} 
		function onSignIn(googleUser) { 
			var profile = googleUser.getBasicProfile(); 
			// console.log("ID: " + profile.getId()); 
			// console.log('Full Name: ' + profile.getName()); 
			// console.log('Given Name: ' + profile.getGivenName()); 
			// console.log('Family Name: ' + profile.getFamilyName()); 
			// console.log("Image URL: " + profile.getImageUrl()); 
			// console.log("Email: " + profile.getEmail()); 
			}

		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		</script>
	</script>
<jsp:include page="../common/footer.jsp" />
</body>
</html>