<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
    #footer {
        width: 100%;
        height: 20%;
        border-top: 3px solid rgb(192, 211, 192);
        margin: auto;
        margin-top: 1em;
        margin-bottom: 1%;
        padding-top: 2%;
        padding-bottom: 1%;
        text-align: center;
        font-size: 12px;
        /* float: left; */
    }
</style>
</head>
<body>
	<div id="footer">
		<c:url var="terms" value="terms.do"/>
		<c:url var="privacy" value="privacy.do"/>
		<c:url var="service" value="service.do"/>
        <a href="${ terms }">이용약관</a> &nbsp;&nbsp;&nbsp;
        <a href="${ privacy }">개인정보처리방침</a> &nbsp;&nbsp;&nbsp;
        <a href="${ service }">고객센터</a>
        <br><br>
        <p>
	            싹배달 | 대표자 : 이승근/임한나/이소현/안수연 공동<br><br>
	            사업자 주소 : 서울특별시 강남구 테헤란로 10길 9 그랑프리 빌딩 4F, 5F, 7F<br><br>
           Copyright © 2020- SSAKBAEDAL All Rights Reserved
        </p>
	</div>
</body>
</html>