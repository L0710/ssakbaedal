<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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

#memberList {
	width: 80%;
	margin: auto;
	text-align: center;
}

#memberList tr:hover {
	cursor: pointer;
	background: rgba(130, 180, 127, 0.1);
}

#acceptBtn {
	width: 60px;
	padding: 0.5em;
	font-size: 12px;
}
</style>
</head>
<body>
	<div class="wrapper">
		<c:import url="../common/headerbar.jsp" />

		<section id="section">
			<c:import url="../common/nav_admin.jsp" />
			<div class="contents" align="center">
				<h1 style="font-size: 28px">업체 승인</h1>
				<br>
				<table id="memberList">
					<tr>
						<th width="10%">업체번호</th>
						<th width="40%">업체 명</th>
						<th width="25%">사업자등록번호</th>
						<th width="25%">연락처</th>
					</tr>
					<c:forEach var="salist" items="${ salist }">
						<c:if test="${ salist.sAccept == 'N' }">
							<c:url var="saDetail" value="saDetail.do">
								<c:param name="mNo" value="${ salist.mNo }"/>
								<c:param name="page" value="${ pi.currentPage }"/>
							</c:url>
							<tr onclick="location.href='${contextPath}/${ saDetail }'">
								<td>${ salist.mNo }</td>
								<td>${ salist.sName }</td>
								<td>${ salist.sNo }</td>
								<td>${ salist.sTel }</td>
							</tr>
						</c:if>
					</c:forEach>
				</table>

				<br>
				<br>
				<br>

				<div class="pagingArea" align="center" style="font-size: 14px;">
					<!-- 페이징 -->
					<c:if test="${ pi.currentPage <= 1 }">
					[이전]&nbsp;
					</c:if>
					<c:if test="${ pi.currentPage > 1 }">
						<c:url var="before" value="sApproveList.do">
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
							<c:url var="pagination" value="sApproveList.do">
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
						<c:url var="after" value="sApproveList.do">
							<c:param name="page" value="${ pi.currentPage + 1 }" />
						</c:url>
						<a href="${ after }">[다음]</a>
					</c:if>
				</div>

				<br>
				<br>
				


			</div>
		</section>

	</div>
	<br>
	<br>

	<c:import url="../common/footer.jsp" />
</body>
</html>