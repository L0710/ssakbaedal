<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ssakbaedal</title>
<style>
section {
	width: 100%;
	height: 60%;
	float: left;
}

.contents {
	margin-top: 1%;
	padding: 3%;
	height: 100%;
	display: inline-block;
}

.sinfoTable {
	border-collapse: collapse;
	background-color: #F2F2F2;
	width: 70%;
	overflow: hidden;
	border-radius: 5px;
}

#storeArea {
	width: 650px;
	float: left;
	margin-bottom: 1%;
	background-color: #F2F2F2;
	padding: 0.5em;
}

#menuArea {
	width: 650px;
	float: left;
}

#basketArea {
	width: 400px;
	display: inline-block;
	margin-left: 5%;
}

#basketList {
	margin: 0;
	width: 100%;
	border: 1px solid lightgray;
}

/* 탭 */
.tabs {
	display: flex;
	flex-wrap: wrap;
	width: 100%;
}

.tabs label {
	width: 33%;
	order: 1;
	display: block;
	padding: 10px 0px;
	text-align: center;
	cursor: pointer;
	background: lightgray;
	font-weight: bold;
	border-radius: 3px;
	transition: background ease 0.2s;
}

/*박스배경*/
.tabs .tab {
	order: 99;
	flex-grow: 1;
	width: 100%;
	display: none;
	padding: 1rem;
	background: #F2F2F2;
	border-radius: 3px;
}

.tabs input[type="radio"] {
	display: none;
}

/*탭 눌렀을때 컬러*/
.tabs input[type="radio"]:checked+label {
	background: rgb(64, 64, 64);
	color: white;
}

.tabs input[type="radio"]:checked+label+.tab {
	display: block;
}

#writeReviewBtn {
	background-color: rgb(64, 64, 64);
	color: white;
	padding: 0;
	font-size: 10px;
	width: 60px;
	height: 30px;
}

#reportBtn {
	background-color: rgb(64, 64, 64);
	color: white;
	padding: 0;
	font-size: 10px;
	width: 40px;
	height: 30px;
}

#deleteBtn {
	padding: 0;
	font-size: 10px;
	width: 30px;
	height: 20px;
}

/* 수량 */
.value-button {
	display: inline-block;
	border: 1px solid #ddd;
	margin: 0px;
	width: 10px;
	height: 10px;
	text-align: center;
	vertical-align: middle;
	padding: 5px 0;
	background: #eee;
	-webkit-touch-callout: none;
	-webkit-user-select: none;
	-khtml-user-select: none;
	-moz-user-select: none;
	-ms-user-select: none;
	user-select: none;
}

.value-button:hover {
	cursor: pointer;
}

.qty {
	text-align: center;
	border: none;
	margin: 0px;
	width: 20px;
	height: 20px;
}

input[type=number]::-webkit-inner-spin-button, input[type=number]::-webkit-outer-spin-button
	{
	-webkit-appearance: none;
	margin: 0;
}

#storeImgArea {
	width: 100px;
	height: 100px;
	border: 1px solid black;
}

#imgArea {
	width: 100px;
	height: 100px;
	border: 1px solid black;
	margin: auto;
}

#menuTable {
	width: 100%;
	margin: auto;
}

#menuTable tr{
	border-bottom: 1px solid lightgray;
}

#menuImg {
	width: 60px;
	height: 60px;
	border: 1px solid black;
	margin: auto;
}

#addCartBtn {
	padding: 0;
	width: 20px;
	height: 20px;
	border-radius: 5px;
}

.btn {
	border: 1px solid lightgray;
	background-color: white;
	width: 50px;
	font-size: 10px;
	padding: 0.5em;
}

.Cartbtn {
	border: 1px solid lightgray;
	background-color: white;
	width: 50px;
	font-size: 10px;
	padding: 0.5em;
}
#contentImg {
	margin:0.5px;
}
#rplyWriter {
	background-color:transparent;
	text-align:left;
}

/* #reviewTable td {
	padding-top: 0;
} */

/* #reviewTable .rContents {
	padding-top: 0;
} */

/* table td {
	padding-top: 0;
} */

/* th, td {
	padding-top: -10px;
} */
</style>
</head>
<body>
	<div class="wrapper">
		<c:import url="../common/headerbar.jsp" />

		<section>
			<c:import url="../common/nav_category.jsp" />
			<div class="contents">

				<div id="storeArea">
					<table class="sinfoTable">
						<tr>
							<td rowspan="5" style="width: 25%">
								<div id="storeImgArea">
									<img id="storeImg" width="100px" height="100px"
										src="${ contextPath }/resources/muploadFiles/logo/${atLogo.changeFileName}">
								</div>
							</td>
							<td width="25%" style="font-size: 14px"><b>${store.sName}</b></td>
							<td style="font-size: 14px"><b>${ store.sTel }</b></td>
						</tr>
						<tr>
							<c:set var="st" value="${ rStar div reviewCount }"/>
							<fmt:formatNumber var="star" value="${ st }" pattern=".0"/>

							<td>별점 ${ star }</td>
							<td>리뷰 ${ reviewCount }개</td>
						</tr>
						<tr>
							<td>최소주문금액</td>
							<td>${ store.minPrice }원</td>
						</tr>
						<tr>
							<td>배달 요금</td>
							<td>${ store.deliveryCharge }원</td>
						</tr>
						<tr>
							<td>카테고리</td>
							<td>${ store.sCategory }</td>
						</tr>
					</table>
				</div>

				<div id="menuArea">
					<div class="tabs">
						<input type="radio" name="tabs" id="tab1" checked="checked">
						<label for="tab1">메뉴</label>
						<div class="tab">
							<c:forEach var="menuList" items="${ menuList }" varStatus="vs">
								<table id="menuTable" class="sinfoTable">
									<tr>
										<td>
											<input type="hidden" name="mnNo" id="mnNo" value="${ menuList.mnNo }">
										</td>
										<td width="50%" id="mnName">${ menuList.mnName }</td>
										<td width="20%" id="mnPrice" style="text-align: right;">${ menuList.mnPrice }</td>
										<!-- 주문표로 옮기기 위해 mnNo 세팅 -->
										<td>
											<div id="menuImg">
												<img width="60px" height="60px"
													src="${ contextPath }/resources/mUploadFiles/menu/${atMenuList[vs.index].changeFileName}">
											</div>
										</td>
										<td width="5%">
											<button id="addCartBtn" class="Cartbtn">+</button>
										</td>
									</tr>
								</table>
							</c:forEach>
						</div>
						
						<input type="radio" name="tabs" id="tab2"> <label
							for="tab2">매장정보</label>
						<div class="tab">
							<h3>사장님 알림</h3>
							<hr>
							<p style="font-size: 12px;">${ store.sInfo }</p>
							<br>
							<br>
							<br>

							<h3>업체정보</h3>
							<hr>
							<table class="sinfoTable">
								<tr>
									<td>영업시간</td>
									<td>${ store.openTime }</td>
								</tr>
								<tr>
									<td>전화번호</td>
									<td>${ store.sTel }</td>
								</tr>
								<tr>
									<td>주소</td>
									<td>${ store.sAddress }</td>
								</tr>
							</table>
							<br>
							<br>
							<br>

							<h3>사업자정보</h3>
							<hr>
							<table class="sinfoTable">
								<tr>
									<td>상호명</td>
									<td>${ store.sName }</td>
								</tr>
								<tr>
									<td>사업자등록번호</td>
									<td>${ store.sNo }</td>
								</tr>
							</table>
							<!-- <br><br><br>

                                <h3>원산지정보</h3>
                                <hr>
                                <p style="font-size:12px;">밀가루(국내산).....</p> -->
						</div>

						<input type="radio" name="tabs" id="tab3"> <label
							for="tab3">리뷰</label>
						<div class="tab">
							<h1 style="text-align: center;">
								총 <span style="color: rgb(130, 180, 127)">${ reviewCount }</span>개의 리뷰가
								작성되었습니다.
							</h1>
							<hr>
							<table id="reviewTable" class="sinfoTable" style="width: 100%">
								<c:forEach var="r" items="${ rlist }">
									<tr>
										<td style="width: 60%">
										${fn:substring(r.rWriter, 0, 2)}**${fn:substring(r.rWriter, 4, fn:length(r.rWriter))}님
										</td>
										<td style="text-align:right;">
											<c:if test="${ r.rStar eq '1'}">
				                        		<p style="color:rgb(255, 194, 0);"><strong>★☆☆☆☆</strong></p>
				                        	</c:if>
				                        	<c:if test="${ r.rStar eq '2'}">
				                        		<p style="color:rgb(255, 194, 0);"><strong>★★☆☆☆</strong></p>
				                        	</c:if>
				                        	<c:if test="${ r.rStar eq '3'}">
				                        		<p style="color:rgb(255, 194, 0);"><strong>★★★☆☆</strong></p>
				                        	</c:if>
				                        	<c:if test="${ r.rStar eq '4'}">
				                        		<p style="color:rgb(255, 194, 0);"><strong>★★★★☆</strong></p>
				                        	</c:if>
				                        	<c:if test="${ r.rStar eq '5'}">
				                        		<p style="color:rgb(255, 194, 0);"><strong>★★★★★</strong></p>
				                        	</c:if>
										</td>
										<td style="width: 20%; text-align:right;">2020-10-27</td>
									</tr>
									<tr>
										<td colspan="2" class="rContents" >
											<span>${ r.rContent }</span>
										</td>
										<td colspan="2">
											<div class="imgArea">
												<c:forEach var="at" items="${ r.alist }">
													<c:if test="${ !empty at.originalFileName  }">
														<div id="contentImgArea" style="float: left;">
															<img id="contentImg" width="50" height="50" src="${ contextPath }/resources/ruploadFiles/${ at.changeFileName }">
														</div>
													</c:if>
												</c:forEach>
											</div>
										</td>
									</tr>
										<c:forEach var="rply" items="${ r.reply }">
											<c:if test="${ rply.rContent ne null }">
									<tr>
										<td colspan="3">
											<label id="rplyWriter" style="border-bottom:black;"><strong>사장님</strong></label>
										</td>
                                    </tr>
                                    <tr>
                                    	<td>
                                    		${ rply.rContent }
                                    	</td>
                                    </tr>
											</c:if>
										</c:forEach>
                                    <tr>
                                    	<td colspan="3"><hr style="border:0.3px solid lightgray"></td>
                                    </tr>
								</c:forEach>
							</table>
						</div>
					</div>
				</div>
				
			<form action="oinsertView.do" method="post" onsubmit="return confirm();">
				<input type="hidden" name="deliveryCharge" value="${ store.deliveryCharge }">
				<input type="hidden" name="mNo" value="${ loginUser.mNo }">
				<input type="hidden" name="sNo" value="${ store.mNo }">
				<%-- <input type="hidden" name="mnNo" value="${ menuList.mnNo }"> --%>
				<div id="basketArea">
					<table id="basketList">
						<thead>
							<tr>
								<td colspan="2"
									style="text-align: center; background-color: rgb(192, 211, 192);">
									<h1 style="margin: 0.3em; color: rgb(64, 64, 64)">주문표</h1>
								</td>
							</tr>
						</thead>
						<tbody>
							<!-- 여기에 +로 넣은 항목들 추가 -->
						</tbody>
						<tr>
							<td colspan="2" style="text-align: right;"><br>
							<br>
								<h1 style="color: red" id="priceSum">합계 : <label id="total">0</label>원</h1></td>
						</tr>
						<tr>
							<td colspan="2" style="text-align: center;"><br>
								<c:if test="${ loginUser.mType eq 2 }">
									<button class="btn-ghost red" type="submit" >주문</button>
								</c:if>
								<c:if test="${ loginUser.mType ne 2 }">
									<button class="btn-ghost red" type="button" onclick="warning()">주문</button>
								</c:if>
							</td>
						</tr>
					</table>
					<script>
						function warning(){
							alert("일반 회원만 주문 가능합니다.");
							$(this).attr("disabled", true);
						}
					</script>
						<!-- + 버튼 클릭 시 메뉴, 수량, 가격 주문표에 추가 -->
						<script>
							$(function(){
								var i = 0;
		                        $(".Cartbtn").click(function(){
		                        	var checkBtn = $(this);
		                        	
		                        	var tr = checkBtn.parent().parent();
		                			var td = tr.children();
		                        	
		                            var mnNo = td.eq(0).children().val();
		                            var mnName = td.eq(1).text();
		                            var mnPrice = td.eq(2).text();
		                            
		                            /* console.log("메뉴명:" + mnName + "/가격:" + mnPrice + "/메뉴넘버:" + mnNo); */
	                                
	                                var $tbody = $("#basketList tbody:first");
	                        	    var $tr = $("<tr>");
	                        	    var $td1 = $("<td>");
	                        	    
	                        	    
	                        	    $td1.append($('<input type="text" name="mnList[' + i + '].mnName" readonly style="border:none; width:auto;" value="'+ mnName +'">'))
	                        	    var $td2 = $("<td style='text-align: right;font-weight:bold;'>");
	                        	    $td2.append($('<input type="text" class="mPrice" name="mnList[' + i + '].price" readonly style="border:none; width:auto; text-align:right;" value="' + mnPrice +'">' + '<br><div class="value-button" id="decrease" onclick="decreaseValue(this)" value="Decrease Value">-</div>'))
	                        	    .append($('<input type="number" name="mnList[' + i + '].odNum" class="qty" value="1" min="1" max="99"/>'))
	                        	    .append($('<div class="value-button" id="increase" onclick="increaseValue(this)" value="Increase Value">+</div>'))
	                        	    .append($('<button onclick="deleteLine(this);" class="btn" id="deleteBtn">삭제</button>'))
	                        	    .append($('<input type="hidden" name="mnList[' + i + '].mnNo" value="'+mnNo+'">'));
	                        	    $tr.append($td1).append($td2);
	                        	    $tbody.append($tr);
	                        	    sum();
	                        	    
	                        	    i++;
	                        	    /* console.log("i:"+i); */
		                        });
		                    })
		                    
                        </script>
					
					<!-- 삭제 버튼 클릭 시 한 행 삭제-->
					<script>
                        function deleteLine(obj) {
                            var tr = $(obj).parent().parent();
                         
                            // 라인 삭제
                            tr.remove();
                            sum();
                        }
                    </script>
				</div>
				
				<!-- input qty 증감 -->
				<script>
                    function increaseValue(el) {
                    	// console.log(el);
                    	// console.log(el.previousElementSibling.value);
                        var value = parseInt(el.previousElementSibling.value, 10);
                        value = isNaN(value) ? 0 : value;
                        value++;
                        el.previousElementSibling.value = value;
                        sum();
                    }

                    function decreaseValue(el) {
                    	// console.log(el);
                    	// console.log("before:"+el.nextElementSibling.value);
                        var value = parseInt(el.nextElementSibling.value, 10);
                        /* if(value < 1){
                        	$(.qty).disabled("disabled");
                        } */
                        value = isNaN(value) ? 0 : value;
                        value < 1 ? value = 1 : '';
                        value--;
                        el.nextElementSibling.value = value;
                        sum();
                    }
                </script>
				
				<!-- 합계 계산 -->
				<script>
					total = 0;
					function sum(){
						total = 0;	
						$('.qty').each(function(index, value){
							var qty = $(this).val();
							var mPrice = parseInt($('.mPrice')[index].value);
							
							total += qty * mPrice;
						})
						$("#total").html(total.toLocaleString());
					}
					
					<%-- 주문금액 확인, 주소 입력 뷰로 이동 --%>
					function confirm(){
						if(total < ${ store.minPrice }){
							alert("최소주문금액 이하로 주문 불가합니다.")
							return false;
						} else {
							return true;
						}
					}
                </script>
			</form>
			</div>

		</section>

	</div>

	<c:import url="../common/footer.jsp" />
</body>
</html>
