<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
		<button class="btn-ghost green" id="goEvent" onclick="location.href='${contextPath}/elist.do'">이벤트</button>
		<button class="btn-ghost green" id="goRank">랭킹</button>
	</div>
</body>
</html>