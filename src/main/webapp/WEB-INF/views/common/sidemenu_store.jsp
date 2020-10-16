<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<c:set var="contextPath" value="${ pageContext.servletContext.contextPath }" scope="application"/>
<style>
    .sidemenu {
        width: 150px;
        position: fixed;
        top: 200px;
        /*left: 1150px;*/
        margin-left: 1035px;
        margin-top: 100px;
    }
    
    #goEvent, #goRank {
		width: 100%;
	}
</style>
</head>
<body>
	<div class="sidemenu">
	
	<c:if test="">
		<button class="btn-ghost green" id="goRank">랭킹</button>
		<button class="btn-ghost green" id="goRank">랭킹</button>
		<button class="btn-ghost green" id="goRank">랭킹</button>
		<button class="btn-ghost green" id="goRank">랭킹</button>
		<button class="btn-ghost green" id="goRank">랭킹</button>
	</c:if>	
	
	
	</div>
</body>
</html>