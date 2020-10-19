<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
		<a class="link" href="orderlist.do">주문관리</a>
		<a class="link" href="management.do">매장관리</a>
		<a class="link" href="statistics.do">매출현황</a>
	</nav>
</body>
</html>