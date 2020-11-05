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
        section {
            width: 85%;
            height: 60%;
            float: left;
        }
        
        #urTable {
            border-collapse: collapse;
            background-color: white;
            width: 80%;
            overflow: hidden;
            border-radius: 5px;
            table-layout: fixed;
        }
        
        th, td {
            font-family:'Motnserrat',sans-serif;
            text-align: center;
            font-size: 12px;
            padding: 10px;
            border-bottom: 1px solid rgb(192, 211, 192);
            overflow: hidden;
            white-space: nowrap;
            text-overflow: ellipsis;
        }
        
        th {
            background-color: rgb(192, 211, 192);
            color: white;
        }
        
        #urTable tr:hover {
            cursor: pointer;
            background: rgba(130, 180, 127, 0.1);
        }
        
        .contents {
            margin-top: 1%;
            padding: 3%;
            border: 1px solid lightgray;
            height: 100%;
        }
        
        #asdf{
            width: 100%;
            height: 50px;
            text-align: center;
        }
</style>
</head>
<body>
	<div class="wrapper">
		<c:import url="../common/headerbar.jsp" />

		<section id="section">
			<c:import url="../common/nav_user.jsp" />

			<div class="contents">
				<div id="asdf">
					<h1 style="font-size: 24px">문의사항</h1>
                </div>
				<table id="urTable" align="center">
                    <tr>
                        <th width="10%">NO</th>
                        <th>제목</th>
                        <th width="15%">작성일</th>
                        <th width="15%">답변 상태</th>
                    </tr>
					
					<c:forEach var="relist" items="${ relist }">
						<c:url var="uReqDetail" value="uReqDetail.do">
							<c:param name="reNo" value="${ relist.reNo }"/>
							<c:param name="mNo" value="${ relist.mNo }"/>
							<c:param name="page" value="${ pi.currentPage }"/>
						</c:url>
					
	                    <tr onclick="location.href='${contextPath}/${ uReqDetail }'">
	                        <td>${ relist.reNo }</td>
	                        <td>${ relist.reTitle }</td>
	                        <td>${ relist.reModifyDate }</td>
	                        <td>
	                        <c:if test="${ relist.reAnswer == 'N' }">
	                        	<strong style="color:red">답변대기</strong>
	                        </c:if>
	                        <c:if test="${ relist.reAnswer == 'Y' }">
	                        	<strong style="color:blue">답변완료</strong>
	                        </c:if>
	                        </td>
	                    </tr>
                    </c:forEach>

                </table>
                <br>
                <div align="right" style="margin-right: 10%">
                    <button class="btn-ghost green" align="right"onclick="location.href='reqinsertView.do'" >문의하기</button>
                </div>

                <div class="pagingArea" align="center" style="font-size:14px;">
                	<!-- 검색 후 페이징 처리에 대한 수정 -->
					<!-- 검색한 값이 있는지 없는지 여부에 따라 넘어갈 주소값을 결정함 -->
					<c:if test="${ search.searchValue eq null }">
						<!-- 검색한 값이 없으면 selectList.bo 호출 -->
						<c:set var="loc" value="/uRequireList.do" scope="page"/>
					</c:if>
					<c:if test="${ search.searchValue ne null }">
						<!-- 검색한 값이 있으면 search.bo 호출 -->
						<c:set var="loc" value="/reqSearch.do" scope="page"/>
					</c:if>
					
                    <!-- 페이징 -->
                    <c:if test="${ pi.currentPage <= 1 }">
					[이전]&nbsp;
					</c:if>
					<c:if test="${ pi.currentPage > 1 }">
						<c:url var="before" value="${ loc }">
							<c:if test="${ search.searchValue ne null }">
								<c:param name="searchCondition" value="${ search.searchCondition }"/>
								<c:param name="searchValue" value="${ search.searchValue }"/>
							</c:if>
							<c:param name="mNo" value="${ loginUser.mNo }"/>
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
							<c:url var="pagination" value="${ loc }">
								<c:if test="${ search.searchValue ne null }">
									<c:param name="searchCondition" value="${ search.searchCondition }"/>
									<c:param name="searchValue" value="${ search.searchValue }"/>
								</c:if>
								<c:param name="mNo" value="${ loginUser.mNo }"/>
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
						<c:url var="after" value="${ loc }">
							<c:if test="${ search.searchValue ne null }">
								<c:param name="searchCondition" value="${ search.searchCondition }"/>
								<c:param name="searchValue" value="${ search.searchValue }"/>
							</c:if>
							<c:param name="mNo" value="${ loginUser.mNo }"/>
							<c:param name="page" value="${ pi.currentPage + 1 }"/>
						</c:url>
						<a href="${ after }">[다음]</a>
					</c:if>
                </div>
                <br>

			</div>
			
		</section>

		<c:import url="../common/sidemenu_user.jsp" />

	</div>
	<br>
	<br>
	<c:import url="../common/footer.jsp" />
</body>
</html>