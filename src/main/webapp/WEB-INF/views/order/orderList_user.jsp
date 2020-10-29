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
	width: 85%;
	height: 60%;
	float: left;
}

#orderList {
	width: 80%;
}

#orderList th {
	padding: 0.2em;
}

.writeBtn {
	background-color: transparent;
	border: 0;
	outline: 0;
	font-size: 11px;
}
.oStatus {
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
		<c:import url="../common/headerbar.jsp" />

		<section id="section">
			<c:import url="../common/nav_user.jsp" />

			<div class="contents">
				<div class="table-wrapper" align="center">
					<h1 style="font-size: 24px">주문내역</h1>
					<br>
					<table id="orderList">
						<c:forEach var="o" items="${ list }">
							<tr>
								<c:set var="time" value="${ o.oTime }" />
								<fmt:formatDate var="orderTime" type="date" value="${time}"
									pattern="yyyy/MM/dd HH:mm:ss" />
								<fmt:formatDate var="oTime" type="date" value="${time}"
									pattern="yyyyMMddHHmmss" />
								<th>주문번호 : ${ oTime }${ o.oNo }</th>
								<th>주문날짜 : ${ orderTime }</th>
									<c:choose>
										<c:when test="${ o.oStatus eq '1' }">
											<th>
												<button class="oStatus" style="color:orange"><strong>결제완료</strong></button>
											</th>
										</c:when>
										<c:when test="${ o.oStatus eq '2' }">
											<th style="color: darkgreen">
												<button class="oStatus" style="color:darkgreen"><strong>주문확인</strong></button>
											</th>
										</c:when>
										<c:when test="${ o.oStatus eq '3' }">
											<th style="color: cornflowerblue">
												<button class="oStatus" style="color:blue"><strong>기사픽업</strong></button>
											</th>
										</c:when>
										<c:otherwise>
											<th>
												<button class="oStatus" style="color:red"><strong>결제취소</strong></button>
											</th>
										</c:otherwise>
									</c:choose>
							</tr>
							<tr>
								<td rowspan="3"><div id="imgArea">매장이미지</div></td>
								<td colspan="2">${ o.sName }(${ o.sTel })</td>
							</tr>
							<tr>
								<td>
								<c:set var="comma" value="," />
								<c:forEach var="d" items="${ o.ODetail }" varStatus="status">
									<c:if test="${ !status.last }">
	                        			${ d.mnName }*${ d.odNum }${ comma } 
	                        		</c:if>
									<c:if test="${ status.last }">
	                        			${ d.mnName }*${ d.odNum }
	                        		</c:if>
								</c:forEach>
								</td>
							</tr>
							<tr>
								<td style="text-align:center;">
									<c:url var="odetail" value="odetail.do">
										<c:param name="oNo" value="${ o.oNo }" />
										<c:param name="page" value="${ pi.currentPage }" />
									</c:url>
									<c:url var="rinsertView" value="rinsertView.do"/>
									<a href="${ odetail }">주문상세</a> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									<button class="writeBtn" id="writeReviewBtn${ o.oNo }" onclick="check(${ o.oNo })">리뷰쓰기</button>
								</td>
							</tr>
						</c:forEach>
					</table>
					<script>
						function check(num){
							$(function() {
								var oNo = num;
								/* console.log("oNo:" + oNo); */
								
								$.ajax({
									url:"selectReview.do",
									data: {oNo:oNo},
									type: "post",
									success : function(data){
										console.log(data);
										
										if(data == "matched"){
											insertDenied();
										} else {
											insertReview(oNo);
										}
									},
									error : function(e){
										console.log(e);
									}
								});
							})
	
							function insertDenied() {
								$("#writeReviewBtn").attr("disabled", "disabled");
								alert("작성 리뷰 내역이 존재합니다.");
							}
	
							function insertReview(oNo) {
								location.href = "${ rinsertView }?oNo="+oNo;
							}
						}
					</script>
				</div>
				<br>
				<br>
				<div class="pagingArea" align="center" style="font-size: 14px;">
					<!-- 페이징 -->
					<c:if test="${ pi.currentPage <= 1 }">
					[이전]&nbsp;
					</c:if>
					<c:if test="${ pi.currentPage > 1 }">
						<c:url var="before" value="olist.do">
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
							<c:url var="pagination" value="olist.do">
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
						<c:url var="after" value="olist.do">
							<c:param name="mNo" value="${ loginUser.mNo }" />
							<c:param name="page" value="${ pi.currentPage + 1 }" />
						</c:url>
						<a href="${ after }">[다음]</a>
					</c:if>
				</div>
			</div>
		</section>

		<c:import url="../common/sidemenu_user.jsp" />

	</div>
	<br>
	<br>
	<c:import url="../common/footer.jsp" />
</body>
</html>