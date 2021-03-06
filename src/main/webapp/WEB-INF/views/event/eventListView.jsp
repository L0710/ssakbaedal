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
		margin: auto;
	}
	
	#eventList tr:hover {
		cursor: pointer;
		background: rgba(130, 180, 127, 0.1);
	}
	
	#searchBtn {
		border: 1px solid lightgray;
		background-color: white;
		width: 50px;
		height: auto;
		font-size: 10px;
		padding: 0.5em;
	}
	.btn {
		border: 1px solid lightgray;
		background-color: white;
		width: 50px;
		font-size: 10px;
		padding: 0.5em;
	}
</style>
</head>
<body>
	<div class="wrapper">
        <c:import url="../common/headerbar.jsp"/>
    
        <section id="section">
        	<!-- 로그인했을시 유저에 따른 내비 보여주기 -->
        	<!-- 관리자 -->
        	<c:if test="${ !empty loginUser && loginUser.mId eq 'admin' }">
        		<c:import url="../common/nav_admin.jsp"/>
			</c:if>
			<!-- 일반유저 -->
			<c:if test="${ !empty loginUser && loginUser.mId ne 'admin' }">
				<c:import url="../common/nav_user.jsp"/>
			</c:if>
			
            <div class="contents">
            	<h1 align="center">이벤트</h1>
            	<br>
                <table id="eventList">
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
                     			<c:if test="${ !empty loginUser }">
									<c:url var="edetail" value="edetail.do">
										<c:param name="eNo" value="${ e.eNo }"/>
										<c:param name="page" value="${ pi.currentPage }"/>
									</c:url>
									<a href="${ edetail }">${ e.eTitle }</a>
								</c:if>
								<c:if test="${ empty loginUser }">
									${ e.eTitle }
								</c:if>
							</td>
							<td>${ e.eStartDate } ~ ${ e.eEndDate }</td>
							<td>${ e.eWriter }
                    	</tr>
                    </c:forEach>
                </table>
                <br>
                <c:if test="${ !empty loginUser && loginUser.mId == 'admin' }">
	                <div align="right" style="margin-right: 10%">
	                    <button class="btn" id="insertBtn" align="right" onclick="location.href='einsertView.do'">작성</button>
	                </div>
                </c:if>
                <br><br>

                <div class="pagingArea" align="center" style="font-size:14px;">
                
                	<!-- 페이징 -->
                	<!-- 이전 -->
                    <c:if test="${ pi.currentPage <= 1 }">
					[이전]&nbsp;
					</c:if>
					<c:if test="${ pi.currentPage > 1 }">
						<c:if test="${ search == null }">
		                  <c:url var="before" value="elist.do">
		                     <c:param name="page" value="${ pi.currentPage - 1 }"/>
		                  </c:url>
		                  <a href="${ before }">[이전]</a> &nbsp;
		               </c:if>
		               <c:if test="${ search != null }">
		                  <c:url var="before" value="esearch.do">
		                     <c:param name="page" value="${ pi.currentPage - 1 }"/>
		                     <c:param name="searchValue" value="${ search.searchValue }"/>
		                     <c:param name="searchCondition" value="${ search.searchCondition }"/>
		                  </c:url>
		                  <a href="${ before }">[이전]</a> &nbsp;
		               </c:if>
					
					</c:if>
					
					<!-- 페이지 숫자 -->
					<c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
						<c:if test="${ p eq pi.currentPage }">
							<font color="red" size="3">[ ${ p } ]</font>
						</c:if>
						<c:if test="${ p ne pi.currentPage }">
							<c:if test="${ search == null }">
		                        <c:url var="pagination" value="elist.do">
		                           <c:param name="page" value="${ p }"/>
		                        </c:url>
		                        <a href="${ pagination }">${ p }</a> &nbsp;
							</c:if>
							<c:if test="${ search != null }">
		                        <c:url var="pagination" value="esearch.do">
		                           <c:param name="page" value="${ p }"/>
		                           <c:param name="searchValue" value="${ search.searchValue }"/>
		                           <c:param name="searchCondition" value="${ search.searchCondition }"/>
		                        </c:url>
		                        <a href="${ pagination }">${ p }</a> &nbsp;
		                     </c:if>
						</c:if>
					</c:forEach>
					
					<!-- [다음] -->
					<c:if test="${ pi.currentPage >= pi.maxPage }">
						[다음]
					</c:if>
					<c:if test="${ pi.currentPage < pi.maxPage }">
						<c:if test="${ search == null }">
		                  <c:url var="after" value="elist.do">
		                     <c:param name="page" value="${ pi.currentPage + 1 }"/>
		                  </c:url>
		                  <a href="${ after }">[다음]</a>
		               </c:if>
		               <c:if test="${ search != null }">
		                  <c:url var="after" value="esearch.do">
		                     <c:param name="page" value="${ pi.currentPage + 1 }"/>
		                     <c:param name="searchValue" value="${ search.searchValue }"/>
		                     <c:param name="searchCondition" value="${ search.searchCondition }"/>
		                  </c:url>
		                  <a href="${ after }">[다음]</a>
		               </c:if>
					</c:if>
                </div>
                <br>

                <div id="searchArea" align="center">
                	<form action="esearch.do" name="searchCondition">
	                    <select id="searchCondition" name="searchCondition" style="width:50px;">
	                        <option value="all"
	                        <c:if test="${search.searchCondition == 'all'}">selected</c:if>>-----</option>
	                        <option value="title"
	                        <c:if test="${search.searchCondition == 'title'}">selected</c:if>>제목</option>
	                        <option value="content"
	                        <c:if test="${search.searchCondition == 'content'}">selected</c:if>>내용</option>
	                    </select>
	                    <input id="searchValue" type="search" name="searchValue" value="${ search.searchValue }" style="width:300px;">
	                    <button class="btn-ghost gray" id="searchBtn" onclick="searchEvent();">검색</button>
                    </form>
                </div>

            </div>
        </section>
        
        <c:import url="../common/sidemenu_user.jsp"/>

    </div>


    <c:import url="../common/footer.jsp"/>
</body>
</html>