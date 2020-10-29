<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
	
	        button {
            cursor: pointer;
            margin: 3px;
            padding: 10px  20px;
        }
        
        .btn-ghost.green {
            background: transparent;
            border: 2px solid rgb(130, 180, 127);
            border-radius: 8px;
            color: rgb(130, 180, 127);
            text-decoration: none;
            -webkit-transition-duration: 0.4s;
            /* Safari */
            transition-duration: 0.4s;
        }

        .btn-ghost.green:hover {
            background-color: rgb(130, 180, 127);
            color: white;
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

        .logoArea {
            margin-top: 1%;
        }

        .sidemenu {
            width: 150px;
            position: fixed;
            top: 200px;
            left: 1150px;
            margin-top: 50px;
            /* border: 1px solid rgb(64, 64, 64);
            border-radius: 20px; */
        }
        
        section {
            width: 85%;
            height: 60%;
            float: left;
        }
</style>
</head>
<body>
	<div class="sidemenu">
	
	<c:url var="goMenuSetting"  value="menuSetting.do"/>
	<c:url var ="goOpenSetting" value="openSetting.do"/>
	<c:url var="goStoreManage" value="storeManage.do"/>
	<c:url var="reviewSetting" value="srlist.do">
		<c:param name="mNo" value="${ loginUser.mNo }" />
		<c:param name="page" value="${ currentPage }" />
	</c:url>
		<button class="btn-ghost green" onclick="loaction.href='${menuSetting}'">메뉴관리</button>
		<button class="btn-ghost green" onclick="location.href='${openSetting}'">영업관리</button>
		<button class="btn-ghost green" onclick="location.href='${storeManage}'">매장관리</button>
		<button class="btn-ghost green" onclick="location.href='${reviewSetting}'">리뷰관리</button>
		<button class="btn-ghost green" >알림</button>
	
	</div>
	
</body>
</html>