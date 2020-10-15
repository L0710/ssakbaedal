<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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

    #sing_up_div{
        border: 2px solid  rgb(130, 180, 127);
        padding: 10px;
        margin: auto;
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
        height: 75px;
        margin: 20px auto ;
        letter-spacing: 10px;
        color: white;
        font-size: 20px;
        
    }
    /* 버튼별 css */
    .sing_up{
        background-color: rgb(130, 180, 127, 0.7);
    }
    #kakao{
        background-color: rgb(241, 196, 15, 0.7);
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
                <button id="kakao">카카오</button>
            </div>
        </section>
<jsp:include page="../common/footer.jsp" />
</body>
</html>