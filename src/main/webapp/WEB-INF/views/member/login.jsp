<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html> 
<html> 
<head>
<meta charset="UTF-8">
<title>ssakbaedal</title>
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
    #login_div{
        
        background-color: rgb(246, 246, 246, 0.7);
        border-radius: 30px;
        padding: 10px;
        margin: 5% auto 5%;
        min-width: 400px;
        width: 50%;
        height: 50%;
        text-align: center;
    }
    #sign_up_div{
        margin: 5% auto 3%;
        text-align: center;
    }
    #find_div{
        display: inline-block;
        width: 300px;
        height: 15px;
        text-align: right;

    }
    /* 아이디/비밀번호 찾기 css */
    span{
        color: rgb(64, 64, 64);
        font-size: 13px;
    }
    span:hover{
        color: rgb(130, 180, 127);
    }
    /* 버튼 css */
    #login_div button:hover{
        background-color: rgb(64, 64, 64);
    }
    .body_btn{
        display: block;
        border: none;
        border-radius: 10px;
        width: 300px;
        height: 40px;
        margin: 20px auto 10px;
        letter-spacing: 10px;
        background-color: rgba(130, 180, 127, 0.7);
        color: white;
        font-size: 20px;
        
    }
    /* 카카오 버튼 */
    #kakao{
        background-color: rgb(241, 196, 15, 0.7);
        color: white;
        font-size: 20px;
    }
    /* 로그인div input css */
    #login_div input{
        display: block;
        width: 300px;
        height: 35px;
        margin: 10px auto ;
        border-radius: 5px;
        border: 1px solid  lightgray;
    }


    </style>
</head>
<body>
	<jsp:include page="../common/headerbar.jsp" />
	<section>
		<div id="login_div">
			<h1>로그인</h1>
			<form action="login.do" method="post">
				<input type="text" name="mId" placeholder="아이디를 입력해 주세요."> <input
					type="password" name="mPwd" placeholder="비밀번호를 입력해 주세요.">
				<button id="login" class="body_btn">로그인</button>
			</form>
			<div id="find_div">
				<c:url var="findId" value="findId.do" />
				<c:url var="findPwd" value="findPwd.do" />
				<span onclick="id_find();">아이디 찾기</span> / <span onclick="pass_find();">비밀번호 찾기</span>
			</div>
			<div id="sign_up_div">
				<h3>아직 싹배달의 회원이 아니신가요?</h3>
				<p>회원가입을 하시면 더 다양한 혜택을 받으실수 있습니다.</p>
				<c:url var="signUp" value="signUp.do"/>
				<button id="sign_up" class="body_btn"
					onclick="location.href='${signUp}'">회원가입</button>
			</div>
		</div>
	</section>
	<script langqwuage="javascript">
		function id_find() {
			var win = window.open('${findId}',"아이디찾기",
					"width=450,height=350,left=500px,top=300px");
		}
		function pass_find() {
			var win = window.open('${findPwd}', "비밀번호 찾기",
					"width=450,height=400,left=500px,top=300px");
		}
	</script>
	<jsp:include page="../common/footer.jsp" />
</body>
</html>