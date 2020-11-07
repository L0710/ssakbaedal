<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
nav {
	width: auto;
	padding: 24px;
	text-align: center;
	background: rgb(64, 64, 64);
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
</style>
</head>
<body>
	<nav id="nav">
		<c:url var="olist" value="olist.do">
			<c:param name="mNo" value="${ loginUser.mNo }" />
			<c:param name="page" value="${ currentPage }" />
		</c:url>
		<c:url var="rlist" value="rlist.do">
			<c:param name="mNo" value="${ loginUser.mNo }" />
			<c:param name="page" value="${ currentPage }" />
		</c:url>
		
		
		<a class="link" href="${ olist }">주문내역</a>
		<a class="link" href="${ rlist }">리뷰</a>
		<a class="link" href="${contextPath}/pointView.do">포인트</a>
		<a class="link" href="#">문의</a>
		<a class="link" href="${contextPath}/myInfo.do">내정보</a>
		<a class="link" href="#">회원탈퇴</a>
	</nav>
</body>
</html>