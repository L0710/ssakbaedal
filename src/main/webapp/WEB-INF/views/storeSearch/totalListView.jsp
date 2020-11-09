<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ssakbaedal</title>

<style>
        * {
                font-family: 'Nanum Gothic', sans-serif;
            }
        
        header, section, aside, footer{
            box-sizing: border-box;
            display: block;
        }
        
        body{
            width: 1200px;
            height: 800px;
            margin: auto;
        }
        
        header {
            width: 100%;
            height: 20%;
        }
        
        section {
            width: 85%;
            height: 60%;
            float: left;
        }
        
        aside {
            width: 15%;
            height: 60%;
            float: left;
        }
        
        footer {
            width: 100%;
            height: 20%;
            border-top: 3px solid rgb(192, 211, 192);
            margin: auto;
            margin-top: 1%;
            margin-bottom: 1%;
            padding-top: 2%;
            padding-bottom: 1%;
            text-align: center;
            font-size: 12px;
            float: left;
        }

        footer a {
            text-decoration : none;
            color: rgb(0, 0, 238);
        }
        
        nav {
            padding: 24px;
            text-align: center;
            background: rgb(64, 64, 64);
        }
        
        button {
            cursor: pointer;
            margin: 3px;
            padding: 10px 20px;
        }
        
        .btn-ghost.gray {
            background: transparent;
            border: 2px solid rgb(64, 64, 64);
            border-radius: 8px;
            color: rgb(64, 64, 64);
            text-decoration: none;
            -webkit-transition-duration: 0.4s;
            /* Safari */
            transition-duration: 0.4s;
        }
        
        .btn-ghost.gray:hover {
            background-color: rgb(64, 64, 64);
            color: white;
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
            margin: 0 10px;
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
            margin-left: 1035px;
            margin-top: 100px;
        }
        
        .contents {
            margin-top: 1%;
            padding: 3%;
            border: 1px solid lightgray;
            height: 100%;
        }
        
        .btnGroup {
            margin-top: 1%;
        }        
        
        #logo {
            width: 100%;
            height: 200px;
        }
        
        #addtxt {
            height: 25px;
            background-color: white;
            font-size: 15px;
            text-align: center;
        }
        
        #mypageBtn,
        #logoutBtn {
            margin-top: 0;
            margin-bottom: 0;
        }
        
        #address {
            float: left;
        }
        
        #goEvent, #goRank {
            width: 100%;
        }

        #search_area {
            height: 50px;
        }

        #searchValue {
            height: 40px;
            width: 280px;
            background-color: white;
            font-size: 15px;
            margin-top: 10px;
            margin-left: 35.5%;
        }

        #sort_area{
            margin-left: 40px;
        }

        .store_area {
            width: 100%;
        }
        
        .store_item {
            display: inline-block;
            border-radius: 8px;
            border: 2px solid rgb(64, 64, 64);
            width: 440px;
            height: 120px;
            margin-top: 10px;
            margin-left: 24px;
            margin-bottom: 10px;
            transition-duration: 0.3s;
        }

        .store_item:hover {
            opacity: 0.5;
            cursor: pointer;
        }

        .store_img_area{
            float: left;
            width: 120px;
            height: 100px;
            margin-left: 10px;
            margin-top: 8.5px;
        }

        #pagingArea {
            margin-top: 20px;
            font-size: 14px;
        }

        .store_info{
            float: left;
            width: 286px;
            height: 100px;
            margin-top: 26px;
            margin-left: 15px;
        }

        .store_info span{
            color: #ffA800;
        }
        
</style>

</head>
<body>
	
	<div class="wrapper">
		<c:import url="../common/headerbar.jsp"/>
	
		<section>
			<jsp:include page="../common/nav_category.jsp" />
			
			<div class="contents">
	
	                <!-- 상단 메뉴바에서 전체보기 및 한식 중 식 선택 시 텍스트도 동일하게 변경됨. -->
	                <h1 align="center">전체보기</h1>
					
		                <div class="store_area">
		                <c:forEach var="to" items="${toList}">
		                	<c:url var="sinfoDetail" value="sinfoDetail.do">
		                		<c:param name="mNo" value="${ to.mNo }"/>
		                		<c:param name="page" value="${ pi.currentPage }"/>
		                		
		                	</c:url>
		                    <div class="store_item" id="storeItem" onclick="location.href='${contextPath}/${sinfoDetail}'">
		                        <div class="store_img_area"> <!-- 사진 파일 저장되면 불러올 예정. -->
			                        <c:forEach var="atList" items="${ atList }">
				                        <c:if test="${ to.mNo == atList.refId }">
				                            <img src="${ contextPath }/resources/muploadFiles/logo/${ atList.changeFileName }" width="120px" height="100px">
				                        </c:if>
				                    </c:forEach>
		                        </div>
		                        <div class="store_info">
		                            <p>
		                            	<strong>${ to.sName }</strong><br>
		                            	${ to.sTel }
		                            </p>
		                        </div>
		                    </div>
		                </c:forEach>
		                </div>
	                
	
	                <div class="pagingArea" align="center" style="font-size:14px;">
                    <c:if test="${ pi.currentPage <= 1 }">
					[이전]&nbsp;
					</c:if>
					<c:if test="${ pi.currentPage > 1 }">
						<c:url var="before" value="tslist.do">
							<c:param name="page" value="${ pi.currentPage - 1 }"/>
							<c:param name="addr" value="${ addr }"/>
                			<c:param name="address1" value="${ address1 }"/>
						</c:url>
						<a href="${ before }">[이전]</a>&nbsp;
					</c:if>
					<!-- 페이지 숫자 -->
					<c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
						<c:if test="${ p eq pi.currentPage }">
							<font color="red" size="3">[ ${ p } ]</font>
						</c:if>
						<c:if test="${ p ne pi.currentPage }">
							<c:url var="pagination" value="tslist.do">
								<c:param name="page" value="${ p }"/>
								<c:param name="addr" value="${ addr }"/>
                				<c:param name="address1" value="${ address1 }"/>
							</c:url>
							<a href="${ pagination }">${ p }</a> &nbsp;
						</c:if>
					</c:forEach>
					<!-- [다음] -->
					<c:if test="${ pi.currentPage >= pi.maxPage }">
						[다음]
					</c:if>
					<c:if test="${ pi.currentPage < pi.maxPage }">
						<c:url var="after" value="tslist.do">
							<c:param name="page" value="${ pi.currentPage + 1 }"/>
							<c:param name="addr" value="${ addr }"/>
                			<c:param name="address1" value="${ address1 }"/>
						</c:url>
						<a href="${ after }">[다음]</a>
					</c:if>
                </div>
	
	
	            </div>
			
		</section>
		<c:import url="../common/sidemenu_user.jsp"/>
		
	</div>
	
	<c:import url="../common/footer.jsp"/>

</body>
</html>