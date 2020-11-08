<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic&display=swap" rel="stylesheet">
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
	border: 1px solid lightgray;
	width: 80%;
	overflow: hidden;
	border-radius: 5px;
}

#memDetailTable th, td {
	font-family: 'Motnserrat', sans-serif;
	text-align: center;
	font-size: 12px;
	padding: 10px;
}

#memDetailTable th {
	background-color: rgb(192, 211, 192);
	color: white;
}

#deliveryImg {
        width: 80px;
        border-radius: 10px;
    }
	.close {
		border: 1px solid lightgray;
		background-color: white;
		width: 50px;
		font-size: 10px;
		padding: 0.5em;
	}
	
</style>
</head>
<body>
	<div id="contents">
	<br>
		<img src="./resources/img/delivery.png" id="deliveryImg"/>
		<h2 id="detailTitle">회원 상세</h2>
		<table id="memDetailTable">
			<tr>
                <th>회원번호</th>
                <td>${ mem.mNo }</td>
            </tr>
            <tr>
                <th width="15%">회원 ID</th>
                <td>
                	${fn:substring(mem.mId, 0, 2)}**${fn:substring(mem.mId, 4, fn:length(mem.mId))}
                </td>
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
                <td>
                	<fmt:formatNumber value="${ mem.priceSum }" pattern="#,###" />
                </td>
            </tr>
		</table>
		<br>
		<button class="close" onClick='window.close()'>닫기</button>
		<br><br>
	</div>
</body>
</html>