<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ssakbaedal</title>
<style>
/* 공통,div css */
* {
	font-family: 'Nanum Gothic', sans-serif;
}

*:focus {
	outline: none;
}

#contents {
	border: 2px solid rgb(130, 180, 127);
	padding: 10px;
	margin: auto;
	min-width: 500px;
	width: 50%;
	height: 50%;
	text-align: center;
}

/* 버튼 css */
#close:hover {
	background-color: rgb(64, 64, 64);
}

#close {
	display: block;
	border: none;
	border-radius: 5px;
	width: 60px;
	height: 35px;
	margin: 20px auto;
	background-color: rgb(130, 180, 127, 0.7);
	color: white;
}

#memDetailTable {
	margin: auto;
	border-collapse: collapse;
	background-color: white;
	width: 80%;
	overflow: hidden;
	border-radius: 5px;
}

#memDetailTable th, td {
	font-family: 'Motnserrat', sans-serif;
	text-align: center;
	font-size: 12px;
	padding: 10px;
	border-bottom: 1px solid rgb(167, 166, 166);
}

#memDetailTable th {
	background-color: rgb(192, 211, 192);
	color: white;
}
</style>
</head>
<body>
	<div id="contents">
		<h1>회원 상세</h1>
		<br>

		<table id="memDetailTable">
			<tr>
                <th>회원번호</th>
                <td>${ mem.mNo }</td>
            </tr>
            <tr>
                <th width="15%">회원 ID</th>
                <td>${ mem.mId }</td>
            </tr>
            <tr>
                <th width="25%">EMAIL</th>
                <td>${ mem.mEmail }</td>
            </tr>
            <tr>
                <th>회원등급</th>
                <td>${ mem.mGrade }</td>
            </tr>
            <tr>
                <th>회원가입일</th>
                <td>${ mem.mEnrollDate }</td>
            </tr>
            <tr>
                <th>주문누적금액</th>
                <td>${ mem.priceSum }</td>
            </tr>
		</table>

		<br>
		<br>
		<button id="close" onClick='window.close()'>닫기</button>

	</div>
</body>
</html>