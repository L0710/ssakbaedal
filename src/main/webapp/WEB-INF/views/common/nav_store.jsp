<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<c:set var="contextPath" value="${ pageContext.servletContext.contextPath }" 
scope="application"/>
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
	<c:url var="reviewSetting" value="srlist.do">
		<c:param name="mNo" value="${ loginUser.mNo }" />
		<c:param name="page" value="${ currentPage }" />
	</c:url>
	<nav id="nav">
		<a class="link" href="${contextPath}/goOrderView.do">주문관리</a>
		<a class="link" href="${contextPath}/storeManage.do">매장관리</a>
		<a class="link" href="${contextPath}/statistics.do">매출현황</a>
		<a class="link" href="${reviewSetting}">리뷰관리</a>
    <a class="link" href="${contextPath}/myInfo.do">내정보</a>

	</nav>
	
</body>
</html>