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
<c:set var="contextPath" value="${ pageContext.servletContext.contextPath }" 
scope="application"/>
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

    section {
        width: 100%;
        height: 60%;
        /* float: left; */
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
    }

    .sidemenu {
        width: 150px;
        position: fixed;
        top: 200px;
        left: 1150px;
        margin-top: 100px;
    }
    
    .wrapper {
    	overflow:hidden;
    	height: 160vh;
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

    #address {
        float: left;
    }
</style>
</head>
<body>
	<div id="header">
		<div id="address" align="left">
			<button class="btn-ghost gray" id="mypageBtn">현재주소</button>
			<input id="addtxt" type="text" placeholder="주소입력">
		</div>
		<c:if test="${ empty sessionScope.loginUser }">
			<div class="btnGroup" align="right">
				<c:url var="login" value="login.do" />
				<button class="btn-ghost green" id="mypageBtn"
					onclick="location.href='${login}'"> 로그인/회원가입 </button>
			</div>
		</c:if>
		<c:if test="${ !empty sessionScope.loginUser }">
			<div class="btnGroup" align="right">
				<c:url var="logout" value="logout.do" />
				<button class="btn-ghost green" id="mypageBtn"
					onclick="location.href='${logout}'"> 로그아웃 </button>
			</div>
		</c:if>
		<div class="logoArea">
			<img src="./resources/img/logo.png" id="logo">
		</div>
	</div>
		
</body>
</html>