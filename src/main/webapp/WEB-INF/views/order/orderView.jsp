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
#infoArea {
	width: 400px;
	height: 70vh;
	padding: 2%;
	float: left;
	margin-left: 10%;
}

#orderArea {
	width: 400px;
	height: 100%;
	padding: 2%;
	display: inline-block;
	margin-left: 20px;
}

#priceArea {
	width: 400px;
}

#priceArea tr {
	padding-bottom: 0;
}

#paymentBtn {
	text-align: right;
}

#usePoint {
	width: 200px;
}

.input {
	margin: 1%;
	width: 300px;
}

.btn {
	border: 1px solid lightgray;
	background-color: white;
	width: 50px;
	font-size: 10px;
	padding: 0.5em;
}

input[type="number"]::-webkit-outer-spin-button, input[type="number"]::-webkit-inner-spin-button
	{
	-webkit-appearance: none;
	margin: 0;
}
</style>
</head>
<body>
	<div class="wrapper">
		<c:import url="../common/headerbar.jsp" />
		
		<section>
			<c:import url="../common/nav_category.jsp" />
			
			<div class="contents">
				<h1
					style="font-size: 34px; text-align: left; margin-left: 10%; margin-bottom: 0;">
					<b>주문서</b>
				</h1>
				<div id="infoArea">
				<form action="orderInsert.do" method="post" onsubmit="return orderCheck();">
					<table>
						<tr>
							<td>
								<h4 style="font-size: 18px; display: inline-block">주소</h4>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								<button id="postcodify_search_button" class="btn" type="button">검색</button>
								<br> <input type="text" name="address1"
								class="postcodify_address input" placeholder="도로명주소" /><br>
								<input type="text" name="address2"
								class="postcodify_details input" placeholder="상세주소" /><br>
								<input type="text" class="input" placeholder="연락처" name="oPhone"
								value="${ member.mPhone }"> <br> <br> <br>

								<hr>
							</td>
						</tr>
						<tr>
							<td><br> <label style="font-size: 18px"><b>요청사항</b></label><br>
								<br> <input type="text" class="input" name="request"
								placeholder="요청사항을 적어주세요."> <br> <br> <br>
								<hr></td>
						</tr>
						<tr>
							<td><br> <label style="font-size: 18px"><b>포인트</b></label><br>
								<input type="number" id="usePoint"
								value="${ member.point }" max="${ member.point }">
								<button id="usePointBtn" type="button" class="btn">사용</button> <br>
								<p style="color: #aaa; font-size: 10px; text-align: right;">
									1000 포인트 이상부터 사용 가능</p></td>
						</tr>
					</table>
					<br> <br>
				</div>
				<div id="orderArea">
					<h2>주문표</h2>
					<hr>
					<table id="priceArea">
						<c:set var="i" value="0"/>
						<c:forEach var="mn" items="${ mList }">
							<tr>
								<td style="font-size: 12px;">${ mn.mnName } * ${ mn.odNum }</td>
								<td id="originalP" style="text-align: right; font-size: 12px;">
									<label class="price">${ mn.price * mn.odNum }</label></td>
								<div style="display:none;">
									<input name="mnList[${ i }].mnNo" value="${ mn.mnNo }" />	
									<input name="mnList[${ i }].mnName" value="${ mn.mnName }" />
									<input name="mnList[${ i }].odNum" value="${ mn.odNum }" />
									<input name="mnList[${ i }].price" value="${ mn.price }"/>
								<br>
								</div>
								<c:set var="i" value="${ i+1 }"/>
							</tr>
						</c:forEach>
								<div style="display:none;">
									<input name="deliveryCharge" value="${ order.deliveryCharge }"/>
									<input type="number" id="oPrice" name="oPrice"/>
									<input type="number" id="oPoint" name="usedPoint"/>
									<input name="mNo" value="${ loginUser.mNo }"/>
									<input name="smNo" value="${ order.smNo }"/>
								</div>
						<tr>
							<td style="font-size: 12px"><h4>배달요금</h4></td>
							<td id="deliveryP" style="text-align: right"><label>${ order.deliveryCharge }</label></td>
						</tr>
						<tr>
							<td style="font-size: 12px"><strong>포인트</strong></td>
							<td id="discountP"
								style="text-align: right; color: rgb(130, 180, 127)"><br>
								<label>-0</label></td>
						</tr>
						<tr>
							<td colspan="2"><hr> <br></td>
						</tr>
						<tr>
							<td style="font-size: 18px"><b>최종 결제 금액</b></td>
							<td id="total" style="color: red; text-align: right"><h2>#####</h2></td>
						</tr>
					</table>
					
					
					<br>
					<button class="btn-ghost red" id="paymentBtn" style="float: right" >결제</button>
				</div>
				</form>
				
				
				
				
				
				
					<!-- postcodify -->
					<script src="//d1p7wdleee1q2z.cloudfront.net/post/search.min.js"></script>
					<script>
						$(function() {
							$("#postcodify_search_button").postcodifyPopUp();
						});
					</script>
				
				
				
				
				<!-- 포인트 사용 및 결제 금액 계산 -->
				<script>
					<!-- 포인트 사용 체크 : 1000 포인트 이상 -->
					$(function(){
						calPrice();

						$("#usePointBtn").on("click", function() {
							var point = $("#usePoint").val();
							// console.log(point);
							if (point < 1000) {
								alert("1000 포인트 이상부터 사용 가능합니다.");
								$("#usePoint").val(${ member.point });
								
							}else{
								var discount = $("#discountP").html(-point);
							}
							usePoint(discount);
							$("#usePointBtn").attr('disabled', true);
						});
					});
					
					price = 0;
					sum = 0;
					function calPrice() {
						$('.price').each(function(index){
							/* console.log("index : " + index); */
							
							var p = parseInt($('.price')[index].outerText);
							/* console.log("price:"+p); */
							/* console.log(price);
							console.log(mPrice); */
							price += p;
						})
						var delivery = parseInt($("#deliveryP").text() || 0);
						var point = parseInt($("#discountP").text() || 0);
						/* console.log("price:"+price);
						console.log("delivery:"+delivery);
						console.log("point:"+point); */
						
						sum = price + delivery - point;
						/* console.log("sum:"+sum); */
						$("#oPrice").val(sum);
						/* console.log($("#oPrice").val()); */
						$("#total").html(sum).css({
							'font-size' : '20px',
							'margin' : '10px'
						});
					}
					
					function usePoint(discount){
						var total = parseInt($("#total").html());
						/* console.log("tottal:"+total); */
						var discount = parseInt(($("#discountP").html()).replace("-",""));
						console.log("discount:"+discount);
						/* console.log("discountp.html:"+($("#discountP").html()).replace("-","")); */
						var paymentTotal = total - discount;
						/* console.log("payment:"+paymentTotal); */
						
						$("#total").html(paymentTotal).css({
							'font-size' : '20px',
							'margin' : '10px'
						});
						
						$("#oPrice").val(paymentTotal);
						$("#oPoint").val(discount);
						/* console.log($("#oPrice").val());
						console.log($("#oPoint").val()); */
					}
						
					$("#discountP").on("click", function(){
						$("#usePointBtn").attr('disabled', false);
					});
					
				</script>
				
				<!-- 결제 function -->
				<script>
					$("#paymentBtn").on("click", function orderCheck() {
						
						var total = $("#total").text();
						
						if(confirm("결제하시겠습니까? \n\n결제 금액 " + total + "원") == true){
							return true;
							/* $("#orderForm").attr({action:'orderInsert.do', method:'POST'}).submit(); */
						} else {
							return false;
						}

					});
				</script>
				
			</div>
			
		</section>
		<br> <br>
		
	</div>

	<c:import url="../common/footer.jsp" />

</body>
</html>