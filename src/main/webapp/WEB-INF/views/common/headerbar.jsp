<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic&display=swap" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
<title>ssakbaedal</title>
<c:set var="contextPath" value="${ pageContext.servletContext.contextPath }" scope="application"/>
<style>
	/* 공통 css */
    * {
        font-family: 'Nanum Gothic', sans-serif;
    }

    header, section, aside, footer{
        box-sizing: border-box;
        display: block;
    }

    body{
        width: 1200px;
        margin: auto;
    }

    #header {
        width: 100%;
        height: auto;
    }

    nav {
        padding: 24px;
        text-align: center;
        background: rgb(64, 64, 64);
    }

    table {
        border-collapse: collapse;
        background-color: white;
        width: 60%;
        overflow: hidden;
        border-radius: 5px;
    }

    th, td {
        font-family:'Motnserrat',sans-serif;
        font-size: 12px;
        padding: 10px;
    }

    th {
        background-color: rgb(192, 211, 192);
        color: white;
    }

    button {
        cursor: pointer;
        margin: 3px;
        padding: 10px 20px;
    }

    .btn-ghost.gray {
        background: transparent;
        border: 2px solid rgb(64, 64, 64);
        border-radius: 8px;
        color: rgb(64, 64, 64);
        text-decoration: none;
        -webkit-transition-duration: 0.4s;
        /* Safari */
        transition-duration: 0.4s;
    }

    .btn-ghost.gray:hover {
        background-color: rgb(64, 64, 64);
        color: white;
    }

    .btn-ghost.green {
        background: transparent;
        border: 2px solid rgb(130, 180, 127);
        border-radius: 8px;
        color: rgb(130, 180, 127);
        text-decoration: none;
        -webkit-transition-duration: 0.4s;
        /* Safari */
        transition-duration: 0.4s;
    }

    .btn-ghost.green:hover {
        background-color: rgb(130, 180, 127);
        color: white;
    }
    
	.btn-ghost.red {
		background: transparent;
		border: 2px solid  rgba(250, 61, 27, 0.836);
		border-radius: 8px;
		color:  rgba(250, 61, 27, 0.836);
		text-decoration: none;
		-webkit-transition-duration: 0.4s;
		/* Safari */
		transition-duration: 0.4s;
	}

	.btn-ghost.red:hover {
		background-color:  rgba(250, 61, 27, 0.836);
		color: white;
	}

    .link {
        transition: 0.3s ease;
        background: rgb(64, 64, 64);
        color: #ffffff;
        font-size: 15px;
        text-decoration: none;
        border-top: 4px solid rgb(64, 64, 64);
        border-bottom: 4px solid rgb(64, 64, 64);
        padding: 20px 0;
        margin: 0 20px;
    }

    .link:hover {
        border-top: 4px solid #ffffff;
        border-bottom: 4px solid #ffffff;
        padding: 6px 0;
    }

    .logoArea {
        margin-top: 1%;
        cursor: pointer;
    }

    .wrapper {
    	overflow:hidden;
    	height: auto;
    }

    .contents {
    	position: relative;
        padding: 2em;
        overflow:hidden;
        height:auto;
    }


    .btnGroup {
        margin-top: 1%;
    }        

    #logo {
        width: 100%;
        height: 200px;
    }

    #addtxt {
        height: 25px;
        background-color: white;
        font-size: 15px;
        text-align: center;
    }

    #mypageBtn,
    #logoutBtn {
        margin-top: 0;
        margin-bottom: 0;
    }

     /* #address {
        float: left;
    } */
</style>
</head>
<body>
	<!-- msg 전달 받은 내용이 있으면 alert창에 출력 후 해당 값 지우기 -->
	<c:if test="${ !empty msg }">
		<script>alert('${msg}');</script>
		<c:remove var="msg"/>
	</c:if>

	<div id="header">
	<%-- <c:if test="${ loginUser.mType != 3 }">
		<div id="address" align="left">
			<button class="btn-ghost gray" id="mypageBtn">현재주소</button>
			<input id="addtxt" type="text" placeholder="주소입력">
		</div>
	</c:if> --%>
	<c:if test="${ loginUser.mType == 3 }"></c:if>
			<c:if test="${ empty sessionScope.loginUser }">
				<div class="btnGroup" align="right">
					<c:url var="login" value="login.do" />
					<button class="btn-ghost green" id="mypageBtn"
						onclick="location.href='${login}'">로그인/회원가입</button>
				</div>
			</c:if>
			<c:if test="${ !empty sessionScope.loginUser }">
				<div class="btnGroup" align="right">
					<c:url var="logout" value="logout.do" />
					<c:url var="mypage_admin" value="memlist.do" />

					<!-- 문의사항 구현을 위해 임시로 작성한 것 -->
					<%-- <c:url var="uRequireList" value="uRequireList.do">
						<c:param name="mNo" value="${ loginUser.mNo }"/>
					</c:url> --%>
					<c:url var="mypage_user" value="olist.do">
						<c:param name="mNo" value="${ loginUser.mNo }"/>
					</c:url>
					<c:url var="mypage_store" value="mypage_store.do" />
					<label><c:out value="${ loginUser.mName } 님 환영합니다!"></c:out></label>

					<!-- 회원 타입에 따라 마이페이지 다르게 출력 -->
					<button class="btn-ghost green" id="mypageBtn"
						<c:if test="${ loginUser.mType == 1 }">onclick="location.href='${ mypage_admin }'"</c:if>
						<%-- 문의사항 구현을 위해 임시로 작성한 것 --%>
						<%-- <c:if test="${ loginUser.mType == 2 }">onclick="location.href='${ uRequireList }'"</c:if> --%>
						<c:if test="${ loginUser.mType == 2 }">onclick="location.href='${ mypage_user }'"</c:if>
						<c:if test="${ loginUser.mType == 3 }">onclick="location.href='${ mypage_store }'"</c:if>
					>MYPAGE</button>
					
					<button class="btn-ghost green" id="logoutBtn"
						onclick="location.href='${logout}'">로그아웃</button>
				</div>
			</c:if>
		<div class="logoArea">
			<img src="./resources/img/logo.png" id="logo" onclick="location.href='${contextPath}/home.do'">
		</div>
	</div>
		
</body>
</html>