<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ssakbaedal</title>
<style>
	#section {
		width: 85%;
		height: 60%;
		float: left;
	}
	
	#eventList {
		width: 80%;
	}
</style>
</head>
<body>
	<div class="wrapper">
        <c:import url="../common/headerbar.jsp"/>
    
        <section id="section">
        	<!-- 로그인했을시 유저 내비 보여주기 -->
        	<c:if test="${ !empty loginUser }">
            <c:import url="../common/nav_user.jsp"/>
			</c:if>
			<!-- 얘는 나중에 지우기 -->
			<c:import url="../common/nav_user.jsp"/>
            <div class="contents">
            	<h1 align="center">이벤트</h1>
            	<br><br>
                <table align="center" id="eventList">
                    <tr>
                        <th width="7%">NO</th>
                        <th width="8%">진행</th>
                        <th>제목</th>
                        <th width="25%">기간</th>
                        <th width="12%">작성자</th>
                    </tr>
                    <c:forEach var="e" items="${ list }">
                    	<c:set var="today" value="<%= new java.util.Date() %>"/>
                    	<fmt:formatDate var="now" type="date" value="${today}" pattern="yyyy-MM-dd"/>
                    	<tr align="center">
                    		<td>${ e.eNo }</td>
                    	<c:if test="${ now ge e.eStartDate && now le e.eEndDate}">
                    		<td>진행</td>
                    	</c:if>
                    	<c:if test="${ now lt e.eStartDate}">
                    		<td>예정</td>
                    	</c:if>
	                    <c:if test="${ now gt e.eEndDate }">
	                    	<td>종료</td>
	                    </c:if>
                    		<td>
                    		<%-- 로그인 되면 ~~
                     			<c:if test="${ !empty loginUser }">
									<c:url var="edetail" value="edetail.do">
										<c:param name="eNo" value="${ e.eNo }"/>
										<c:param name="page" value="${ pi.currentPage }"/>
									</c:url>
									<a href="${ edetail }">${ e.eTitle }</a>
								</c:if>
								<c:if test="${ empty loginUser }">
								${ e.eTitle }
								</c:if> --%>
									<c:url var="edetail" value="edetail.do">
										<c:param name="eNo" value="${ e.eNo }"/>
										<c:param name="page" value="${ pi.currentPage }"/>
									</c:url>
									<a href="${ edetail }">${ e.eTitle }</a>
							</td>
							<td>${ e.eStartDate } ~ ${ e.eEndDate }</td>
							<td>${ fn:toLowerCase(e.eWriter) }
                    	</tr>
                    </c:forEach>
                </table>
                <br>
                <div align="right" style="margin-right: 10%">
                    <button class="btn-ghost green" id="insertBtn" align="right" onclick="location.href='einsertView.do'">작성</button>
                </div>
                <br><br>

                <div class="pagingArea" align="center" style="font-size:14px;">
                    <c:if test="${ pi.currentPage <= 1 }">
					[이전]&nbsp;
					</c:if>
					<c:if test="${ pi.currentPage > 1 }">
						<c:url var="before" value="elist.do">
							<c:param name="page" value="${ pi.currentPage - 1 }"/>
						</c:url>
						<a href="${ before }">[이전]</a>&nbsp;
					</c:if>
					<!-- 페이지 숫자 -->
					<c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
						<c:if test="${ p eq pi.currentPage }">
							<font color="red" size="3">[ ${ p } ]</font>
						</c:if>
						<c:if test="${ p ne pi.currentPage }">
							<c:url var="pagination" value="elist.do">
								<c:param name="page" value="${ p }"/>
							</c:url>
							<a href="${ pagination }">${ p }</a> &nbsp;
						</c:if>
					</c:forEach>
					<!-- [다음] -->
					<c:if test="${ pi.currentPage >= pi.maxPage }">
						[다음]
					</c:if>
					<c:if test="${ pi.currentPage < pi.maxPage }">
						<c:url var="after" value="elist.do">
							<c:param name="page" value="${ pi.currentPage + 1 }"/>
						</c:url>
						<a href="${ after }">[다음]</a>
					</c:if>
                </div>
                <br>

                <div id="searchArea" align="center">
                    <select id="searchCondition" name="searchCondition" style="width:50px;">
                        <option>-----</option>
                        <option value="title">제목</option>
                        <option value="content">내용</option>
                    </select>
                    <input id="searchValue" type="search" value="" style="width:300px;">
                    <button class="btn-ghost gray" id="searchBtn" onclick="searchEvent();">검색</button>
                </div>

                <script>
                    // 상세보기
                    $(function(){
                        $("#eventList td").mouseenter(function(){
                            $(this).parent().css({"background":"lightgrey", "cursor":"pointer"});
                        }).mouseout(function(){
                            $(this).parent().css({"background":"white"});
                        }).click(function(){
                            var rId = $(this).parent().children().eq(0).text();
                        });
                    })
                    
                </script>
            </div>
        </section>

        <script>
            function searchEvent() {
                var searchCondition = $("#searchCondition").val();
                var searchValue = $("#searchValue").val();
                location.href = "search.bo?searchCondition=" + searchCondition + "&searchValue=" + searchValue;
            }
        </script>
        <c:import url="../common/sidemenu_user.jsp"/>

    </div>


    <c:import url="../common/footer.jsp"/>
</body>
</html>