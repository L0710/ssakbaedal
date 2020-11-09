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
        margin: 0 7px;
    }

    .link:hover {
        border-top: 4px solid #ffffff;
        border-bottom: 4px solid #ffffff;
        padding: 6px 0;
    }
</style>

</head>
<body>
	<!-- 전체보기 -->
    <c:url var="tslist" value="tslist.do">
		<c:param name="addr" value="${ sAddr }"/>
		<c:param name="address1" value="${ sAddress1 }"/>
    </c:url>
	<c:url var="kslist" value="kslist.do"/>
	<c:url var="cslist" value="cslist.do"/>
	<c:url var="jslist" value="jslist.do"/>
	<c:url var="sslist" value="sslist.do"/>
	<c:url var="chislist" value="chislist.do"/>
	<c:url var="pslist" value="pslist.do"/>
	<c:url var="fslist" value="fslist.do"/>
	<c:url var="aslist" value="aslist.do"/>
	<c:url var="joslist" value="joslist.do"/>
	<c:url var="yaslist" value="yaslist.do"/>
	<c:url var="jjslist" value="jjslist.do"/>
	<c:url var="doslist" value="doslist.do"/>
	<c:url var="cdslist" value="cdslist.do"/>
	<nav id="nav">
		<a class="link" href="${ tslist }">전체보기</a>
		<a class="link" href="${ kslist }">한식</a>
		<a class="link" href="${ cslist }">중국집</a>
		<a class="link" href="${ jslist }">돈까스,회,일식</a>
		<a class="link" href="${ sslist }">분식</a>
		<a class="link" href="${ chislist }">치킨</a>
		<a class="link" href="${ pslist }">피자</a>
		<a class="link" href="${ fslist }">패스트푸드</a>
		<a class="link" href="${ aslist }">아시안,양식</a>
		<a class="link" href="${ joslist }">족발,보쌈</a>
		<a class="link" href="${ yaslist }">야식</a>
		<a class="link" href="${ jjslist }">찜,탕</a>
		<a class="link" href="${ doslist }">도시락</a>
		<a class="link" href="${ cdslist }">카페,디저트</a>
	</nav>
</body>
</html>