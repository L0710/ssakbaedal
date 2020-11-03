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
	width: 85%;
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
				<h1 style="font-size: 28px">회원 관리</h1>
				<br>
				<table id="memberList">
					<tr>
						<th width="10%"><input type="checkbox" name="process"></th>
						<th width="15%">회원번호</th>
						<th width="25%">회원ID</th>
						<th width="25%">회원상태</th>
						<th width="15%">신고횟수</th>
					</tr>
					<c:forEach var="m" items="${ list }">
						<tr>
							<td><input type="checkbox"></td>
							<td>${ m.mNo }</td>
							<td>${fn:substring(m.mId, 0, 1)}***${fn:substring(m.mId, 4, fn:length(m.mId))}</td>
							<td>활동</td>
							<td>0</td>
						</tr>
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
						<c:url var="before" value="memlist.do">
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
							<c:url var="pagination" value="memlist.do">
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
						<c:url var="after" value="memlist.do">
							<c:param name="mNo" value="${ loginUser.mNo }" />
							<c:param name="page" value="${ pi.currentPage + 1 }" />
						</c:url>
						<a href="${ after }">[다음]</a>
					</c:if>
				</div>

				<br>
				<br>
				<div>
					<button class="btn-ghost gray" id="acceptBtn">반영</button>
				</div>

				<script>
					$("th input[type=checkbox]").click(
							function() { // 전체선택
								$("td input[type=checkbox]").prop('checked',
										this.checked);
							});

					$('#acceptBtn')
							.click(
									function() {
										var mNo = new Array;
										var num = 0;
										console
												.log($("td input[type=checkbox]:checked"));
										$("td input[type=checkbox]:checked")
												.each(
														function(index, item) {

															mNo[index] = $(item)
																	.parent()
																	.parent()
																	.children()
																	.eq(1)
																	.text();
															/* console.log(mNo[index]); */

														});

										if (mNo == "") {
											alert("선택된 항목이 없습니다.");
										} else {
											if (confirm("선택한 회원을 로그인 차단하시겠습니까?") == true) {
												location.href = '${contextPath}/memupdate.do?mNo='
														+ mNo;
											}
										}
									});

					// 행 클릭 시 체크박스 클릭
					$(function() {
						$('#memberList tr')
								.click(
										function(event) {
											if (event.target.nodeName
													.toLowerCase() == 'td') {
												var checkbox = $(this)
														.find(
																'td:first-child :checkbox');
												checkbox
														.attr(
																'checked',
																!checkbox
																		.is(':checked'));
											}
										});
					})
				</script>


			</div>
		</section>

		<c:import url="../common/sidemenu_user.jsp" />

	</div>
	<br>
	<br>

	<c:import url="../common/footer.jsp" />
</body>
</html>