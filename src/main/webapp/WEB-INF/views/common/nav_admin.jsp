<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ssakbaedal</title>
<style>
	nav {
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

	<c:url var="areqList" value="areqList.do">
		<c:param name="mNo" value="${ loginUser.mNo }"/>
	</c:url>

	<nav id="nav">
		<a class="link" href="memlist.do">회원관리</a>
		<a class="link" href="#">업체승인</a>
		<a class="link" href="elist.do">이벤트</a>
		<a class="link" href="${ areqList }">문의사항</a>
		<a class="link" href="nlist.do">공지사항</a>
		<a class="link" href="${contextPath}/myInfo.do">내정보</a>

	</nav>
</body>
</html>