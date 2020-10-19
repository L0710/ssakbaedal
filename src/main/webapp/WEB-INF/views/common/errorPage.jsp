<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    #error-container{
        border: 2px solid  rgb(130, 180, 127);
        padding: 10px;
        margin: auto;
        min-width: 400px;
        width: 50%;
        height: 50%;
        text-align: center;
    }
    </style>
</head>
<body>
	<jsp:include page="../common/headerbar.jsp" />
	<div id="error-container" style="text-align:center;">
		<h1>시스템 오류</h1>
		<h2 style="color:red;">
		${ msg }<br><%= request.getAttribute("javax.servlet.error.message") %>
		</h2>
		<a href="home.do">시작페이지로 돌아가기</a>
	</div>
	<jsp:include page="../common/footer.jsp" />
</body>
</html>