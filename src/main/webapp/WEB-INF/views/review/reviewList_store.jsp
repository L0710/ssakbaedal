<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ssakbaedal</title>
<style>
#section {
	width: 100%;
	height: 60%;
	float: left;
}
#reviewList {
	width: 80%;
}
#reviewList td{
	text-align: center;
}
#reviewList tr:hover {
	cursor: pointer;
	background: rgba(130, 180, 127, 0.1);
}
.reply {
	border: 1px solid lightgray;
	background-color: white;
	width: 50px;
	font-size: 10px;
	padding: 0.5em;
	text-decoration: none;
}
</style>
</head>
<body>
	<div class="wrapper">
        <c:import url="../common/headerbar.jsp" />

        <section id="section">
            <c:import url="../common/nav_store.jsp" />


            <div class="contents" align="center">
                <h1 style="font-size:28px">리뷰 관리</h1>

                <div class="tableWrapper" align="center">
                    <table id="reviewList">
                        <tr>
                            <th width="10%">주문번호</th>
                            <th width="40%"></th>
                            <th width="8%">별점</th>
                            <th width="10%">주문일자</th>
                            <th width="8%"></th>
                        </tr>
                        <c:forEach var="r" items="${ list }">
	                        <tr>
	                        	<c:set var="time" value="${ r.oTime }" />
	                        	<fmt:formatDate var="orderTime" type="date" value="${time}" pattern="yyyy/MM/dd HH:mm" />
	                        	<fmt:formatDate var="oTime" type="date" value="${time}" pattern="yyyyMMddHHmmss" />
	                        	<td>${ oTime }${ r.oNo }</td>
	                        	<td>
	                        		<c:url var="reviewDetailView" value="reviewDetailView.do">
										<c:param name="oNo" value="${ r.oNo }" />
										<c:param name="mNo" value="${ loginUser.mNo }" />
										<c:param name="page" value="${ pi.currentPage }" />
									</c:url>
									
									<c:choose>
										<c:when test="${fn:length(r.rContent) > 14}">
											<a href="${ reviewDetailView }">
												<c:out value="${fn:substring(r.rContent, 0, 13)}"/>....
											</a>
										</c:when>
										<c:otherwise>
											<a href="${ reviewDetailView }">
												<c:out value="${ r.rContent }"/>
											</a>
										</c:otherwise> 
									</c:choose>
	                        	</td>
	                        	<td style="color:rgb(255,194,0);">
	                        		<strong>
	                        		<c:if test="${ r.rStar eq '1'}">
	                        		★☆☆☆☆
	                        		</c:if>
	                        		<c:if test="${ r.rStar eq '2'}">
	                        		★★☆☆☆
	                        		</c:if>
	                        		<c:if test="${ r.rStar eq '3'}">
	                        		★★★☆☆
	                        		</c:if>
	                        		<c:if test="${ r.rStar eq '4'}">
	                        		★★★★☆
	                        		</c:if>
	                        		<c:if test="${ r.rStar eq '5'}">
	                        		★★★★★
	                        		</c:if>
	                        		</strong>
	                        	</td>
	                        	<td>
	                        	${ orderTime }
	                        	</td>
	                        	
	                        	<c:forEach var="re" items="${ r.reply }">
		                        	<c:if test="${ re.rContent eq null }">
		                        		<td>
		                        			<c:url var="s_rinsertView" value="s_rinsertView.do">
												<c:param name="oNo" value="${ r.oNo }" />
												<c:param name="mNo" value="${ loginUser.mNo }" />
												<c:param name="page" value="${ pi.currentPage }" />
											</c:url>
		                        			<a class="reply" id="insertReplyBtn${ r.oNo }" href="${ s_rinsertView }">답글작성</a>
		                        		</td>
		                        	</c:if>
		                        	<c:if test="${ re.rContent ne null }">
		                        		<td>
		                        			<a class="reply" href="${ reviewDetailView }">작성완료</a>
		                        		</td>
		                        	</c:if>
	                        	</c:forEach>
	                        </tr>
                        </c:forEach>
                    </table>
                    
                    <br><br><br><br>
                    
                    <div class="pagingArea" align="center" style="font-size: 14px;">
						<!-- 페이징 -->
						<c:if test="${ pi.currentPage <= 1 }">
						[이전]&nbsp;
						</c:if>
						<c:if test="${ pi.currentPage > 1 }">
							<c:url var="before" value="srlist.do">
								<c:param name="mNo" value="${ loginUser.mNo }" />
								<c:param name="page" value="${ pi.currentPage - 1 }" />
							</c:url>
							<a href="${ before }">[이전]</a>&nbsp;
					</c:if>

						<!-- 페이지 숫자 -->
						<c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
							<c:if test="${ p eq pi.currentPage }">
								<font color="red" size="3">[ ${ p } ]</font>
							</c:if>
							<c:if test="${ p ne pi.currentPage }">
								<c:url var="pagination" value="srlist.do">
									<c:param name="mNo" value="${ loginUser.mNo }" />
									<c:param name="page" value="${ p }" />
								</c:url>
								<a href="${ pagination }">${ p }</a> &nbsp;
						</c:if>
						</c:forEach>

						<!-- [다음] -->
						<c:if test="${ pi.currentPage >= pi.maxPage }">
						[다음]
					</c:if>
						<c:if test="${ pi.currentPage < pi.maxPage }">
							<c:url var="after" value="srlist.do">
								<c:param name="mNo" value="${ loginUser.mNo }" />
								<c:param name="page" value="${ pi.currentPage + 1 }" />
							</c:url>
							<a href="${ after }">[다음]</a>
						</c:if>
					</div>
                </div>
            </div>
	</section>
	
    
    </div>
	<br><br>

    <c:import url="../common/footer.jsp" />


</body>
</html>