<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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

#orderTable {
	width: 70%;
	border-spacing: 0;
	border: 1px solid lightgray;
}
#orderTable th{
	text-align: center;
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
				<div class="tableWrapper" align="center">
					<h1 style="font-size: 28px">주문 상세</h1>
					<c:set var="time" value="${ o.oTime }"/>
		            <fmt:formatDate var="orderTime" type="date" value="${time}" pattern="yyyy/MM/dd HH:mm:ss"/>
		            <fmt:formatDate var="oTime" type="date" value="${time}" pattern="yyyyMMddHHmmss"/>
					<table id="orderTable">
						<tr>
							<th>주문번호 : ${ oTime }${ o.oNo }</th>
							<th>주문날짜 : ${ orderTime }</th>
								<c:choose>
									<c:when test="${ o.oStatus eq '1' }">
										<th style="text-align:right;">
											<button class="oStatus" style="color:orange"><strong>결제완료</strong></button>
										</th>
									</c:when>
									<c:when test="${ o.oStatus eq '2' }">
										<th style="text-align:right;">
											<button class="oStatus" style="color:darkgreen"><strong>주문확인</strong></button>
										</th>
									</c:when>
									<c:when test="${ o.oStatus eq '3' }">
										<th style="text-align:right;">
											<button class="oStatus" style="color:blue"><strong>기사픽업</strong></button>
										</th>
									</c:when>
									<c:otherwise>
										<th style="text-align:right;">
											<button class="oStatus" style="color:red"><strong>결제취소</strong></button>
										</th>
									</c:otherwise>
								</c:choose>
						</tr>
						<tr>
							<td style="text-align: left; font-size: 14px"><b>${ o.sName }</b></td>
							<td></td>
							<td style="text-align: right; font-size: 14px"><b>${ o.sTel }</b></td>
						</tr>
						<tr>
							<td colspan="3"><hr></td>
						</tr>
						<tr>
							<td colspan="3" style="text-align: left; font-size: 14px"><b>주문내역</b></td>
						</tr>
						<c:set var="total" value ="0" />
						<c:forEach var="d" items="${ o.ODetail }">
							<tr>
								<td style="text-align: left">${ d.mnName } X ${ d.odNum }</td>
								<td></td>
								<td style="text-align: right" id="originalP">
									<fmt:formatNumber type="number" maxFractionDigits="3" value="${ d.price * d.odNum }" />
								</td>
							</tr>
							<c:set var="total" value="${total + d.price * d.odNum}"/>
						</c:forEach>
						<tr>
							<td style="text-align: left; font-size: 14px;"><strong>상품합계</strong></td>
							<td></td>
							<td style="text-align: right; font-size: 14px;" id="sum">
								<strong><fmt:formatNumber type="number" maxFractionDigits="3" value="${ total }" /></strong>
							</td>
						</tr>
						<tr>
							<td></td>
						</tr>
						<tr>
							<td style="text-align: left"><strong>배달요금</strong></td>
							<td></td>
							<td style="text-align: right" id="deliveryP">
								<fmt:formatNumber type="number" maxFractionDigits="3" value="${ o.fee }" />
							</td>
						</tr>
						<tr>
							<td style="text-align: left"><strong>사용포인트</strong></td>
							<td></td>
							<td style="text-align: right; color: rgb(130, 180, 127)" id="discountP">
								-<fmt:formatNumber type="number" maxFractionDigits="3" value="${ o.oPoint }" />
							</td>
						</tr>
						<tr>
							<td style="text-align: left; color: red; font-size: 14px;"><strong>결제금액</strong></td>
							<td></td>
							<td style="text-align: right; color: red; font-size: 14px;" id="price">
								<strong><fmt:formatNumber type="number" maxFractionDigits="3" value="${ o.oPrice }" /></strong>
							</td>
						</tr>
						<tr>
							<td colspan="3"><hr></td>
						</tr>
						<tr>
							<td colspan="3" style="text-align: left; font-size: 14px"><b>주문자정보</b></td>
						</tr>
						<tr>
							<td style="text-align: left">연락처</td>
							<td></td>
							<td style="text-align: right">${ o.oPhone }</td>
						</tr>
						<tr>
							<td style="text-align: left">주소</td>
							<td></td>
							<td style="text-align: right">${ o.oAddress }</td>
						</tr>
						<tr>
							<td style="text-align: left">요청사항</td>
							<td></td>
							<td style="text-align: right">${ o.request }</td>
						</tr>
					</table>
					<br> <br>
					<div align="center">
						<c:url var="olist" value="olist.do">
							<c:param name="mNo" value="${ loginUser.mNo }"/>
							<c:param name="page" value="${ currentPage }"/>
						</c:url>
						<button class="btn-ghost red" id="paymentCancelBtn" onclick="orderCancel();">결제 취소</button>
						<button class="btn-ghost gray" id="listBtn" onclick="location.href='${ olist }'">목록</button>
					</div>
					<script>
						function orderCancel(){
							alert("결제 취소는 매장에 문의해주셔야 합니다. "+ "\n" +
									"요리가 시작되었거나 배달이 시작된 주문은" + "\n" +"취소가 어려울 수 있습니다.");
						}
					</script>
				</div>
			</div>
		</section>

		<c:import url="../common/sidemenu_user.jsp" />
	</div>

	<c:import url="../common/footer.jsp" />
</body>
</html>