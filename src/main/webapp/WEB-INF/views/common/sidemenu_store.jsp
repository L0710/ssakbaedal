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
    
    #goMenuSet, #goOpenSet,
    #goStoreMa, #goStoreRe,
    #goStoreNo {
		width: 100%;
	}
        
</style>
</head>
<body>
	<div class="sidemenu">
	
	  <c:url var="goMenuSetting"  value="menuSetting.do"/>
	  <c:url var ="goOpenSetting" value="openSetting.do"/>
	  <c:url var="goStoreManage" value="storeManage.do"/>
    <c:url var="goStoreNotice" value="snlist.do"/>
    
	  <c:url var="reviewSetting" value="srlist.do">
		  <c:param name="mNo" value="${ loginUser.mNo }" />
		  <c:param name="page" value="${ currentPage }" />
	  </c:url>
	  
		  <button class="btn-ghost green" onclick="loaction.href='${menuSetting}'">메뉴관리</button>
		  <button class="btn-ghost green" onclick="location.href='${openSetting}'">영업관리</button>
		  <button class="btn-ghost green" onclick="location.href='${storeManage}'">매장관리</button>
		  <button class="btn-ghost green" onclick="location.href='${reviewSetting}'">리뷰관리</button>
		  <button class="btn-ghost green" onclick="location.href='${goStoreNotice}'">공지</button>
	
	</div>
	
</body>
</html>