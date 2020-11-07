<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
#reviewList {
	width: 85%;
}

/* #reviewList thead {
	border-bottom: 3px solid rgb(192, 211, 192, 0.2);
} */

#reviewList tbody {
	border-bottom: 3px solid rgb(192, 211, 192, 0.2);
}

#reviewList th {
	background-color: transparent;
	color:black;
}
.imgArea{
display:inline-block
}
.dBtn {
	border: 1px solid lightgray;
	background-color: white;
	width: 50px;
	font-size: 10px;
	padding: 0.5em;
}

#img-modal {
	display: none; 
	position: fixed; 
	z-index: 20; 
	padding-top: 60px;
	left: 0;
	top: 0;
	width: 100%; 
	height: 100%; 
	overflow: auto; 
	background-color: rgba(0,0,0,0.9);
}
   
#img-modal > img {
	margin: auto;
	display: block;
	width: auto;
	height: 100%;
	margin-bottom: 120px;
}
   
#img-modal > span {
	position: absolute;
	top: 15px;
	right: 35px;
	color: #f1f1f1;
	font-size: 40px;
	font-weight: bold;
}
   
#img-modal > span:hover {
	color: #bbb;
	text-decoration: none;
	cursor: pointer;
}
    
img:hover {
	cursor: pointer;
}
</style>
</head>
<body>
	<div class="wrapper">
		<c:import url="../common/headerbar.jsp" />

		<section id="section">
			<c:import url="../common/nav_user.jsp" />

			<div class="contents">
				<h1 align="center" style="font-size: 24px">작성 리뷰</h1>

				<div class="table-wrapper" align="center">
					<br>
					<table id="reviewList">
					<c:forEach var="r" items="${ list }">
					<thead>
						<tr>
							<th rowspan="3">
								<c:forEach var="sat" items="${ r.sAttachment }">
									<c:if test="${ !empty sat.originalFileName  }">
										<div id="imgArea">
											<img width="100" height="100"
												src="${ contextPath }/resources/muploadFiles/logo/${ sat.changeFileName }">
										</div>
									</c:if>
								</c:forEach>
							</th>
							<th>${ r.sName }(${ r.sTel })</th>
						</tr>
						<tr>
							<c:set var="time" value="${ r.oTime }" />
							<fmt:formatDate var="orderTime" type="date" value="${time}" pattern="yyyy/MM/dd HH:mm:ss" />
							<th>주문날짜 : ${ orderTime }</th>
						</tr>
						<tr>
							<th>내가 준 별점 : 
								<c:if test="${ r.rStar eq '1'}">
	                        		<label style="color:rgb(255, 194, 0);">★☆☆☆☆</label>
	                        	</c:if>
	                        	<c:if test="${ r.rStar eq '2'}">
	                        		<label style="color:rgb(255, 194, 0);">★★☆☆☆</label>
	                        	</c:if>
	                        	<c:if test="${ r.rStar eq '3'}">
	                        		<label style="color:rgb(255, 194, 0);">★★★☆☆</label>
	                        	</c:if>
	                        	<c:if test="${ r.rStar eq '4'}">
	                        		<label style="color:rgb(255, 194, 0);">★★★★☆</label>
	                        	</c:if>
	                        	<c:if test="${ r.rStar eq '5'}">
	                        		<label style="color:rgb(255, 194, 0);">★★★★★</label>
	                        	</c:if>
							</th>
						</tr>
						</thead>
						<tbody>
						<tr>
							<td colspan="2" style="color: rgb(102, 102, 102); text-align: left;">
							주문 메뉴 : 
							<c:set var="comma" value="," />
								<c:forEach var="d" items="${ r.oDetail }" varStatus="status">
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
							<td colspan="2" style="text-align:center;">
								<div class="imgArea img">
									<c:forEach var="at" items="${ r.attachment }">
										<c:if test="${ !empty at.originalFileName  }">
											<div id="contentImgArea" style="float: left;">
												<img id="contentImg" width="100" height="100" src="${ contextPath }/resources/ruploadFiles/${ at.changeFileName }">
											</div>
										</c:if>
									</c:forEach>
								</div>
							</td>
						</tr>
						<tr>
							<td colspan="2" style="text-align: left;">${ r.rContent }</td>
						</tr>
						<tr>
						<c:forEach var="rply" items="${ r.reply }">
							<c:if test="${ rply.rContent ne null }">
								<td colspan="2" style="background-color: rgb(226, 226, 226); text-align: left;">
									<h4>
										<strong>사장님 &nbsp;&nbsp;&nbsp; 
										<fmt:formatDate var="rplyDate" type="date" value="${ rply.rCreateDate }" pattern="yyyy/MM/dd HH:mm" />${ rplyDate }</strong>
									</h4>
									${ rply.rContent }
								</td>
							</c:if>
						</c:forEach>
						</tr>
						<tr>
							<td colspan="2" style="text-align: right">
								<c:url var="rdelete" value="rdelete.do">
									<c:param name="oNo" value="${ r.oNo }"/>
									<c:param name="mNo" value="${ loginUser.mNo }" />
								</c:url>
								<button class="dBtn" id="deleteBtn${ r.oNo }" onclick="deleteCfm();">삭제</button>
							</td>
						</tr>
						<tr>
							<td colspan="2"></td>
						</tr>
						</tbody>
					</c:forEach>
					</table>
					<script>
                        function deleteCfm(){
                            var flag = confirm("삭제 후 해당 주문에 대한 리뷰는 재작성 할 수 없습니다. \n삭제하시겠습니까?");
                            /* console.log("flag:"+flag); */

                            if(flag == true){
                            	location.href='${ rdelete }';
                            }
                        }
                    </script>
					<br>
					
					
					<div id="img-modal" onclick="imgModalClose();">
				    	<span onclick="imgModalClose();">X</span>
				    	<img id="img-modal-content">
					</div>
					
					<!-- 이미지 확대 -->
					<script>
						 /* 이미지 클릭 시 */
						 var imageTagList = document.querySelectorAll('img');
						    
						 for(var i=0;i<imageTagList.length;i++){
						     imageTagList[i].addEventListener('click',function(){
						         var modal = document.getElementById('img-modal');
						         var content = document.getElementById('img-modal-content');
						         modal.style.display='block';
						         content.src = this.src;
						     });
						 }
						    
						 /* close 버튼 클릭시*/
						 function imgModalClose(){
						     var modal = document.getElementById('img-modal');
						     var content = document.getElementById('img-modal-content');
						     modal.style.display="none";
						     content.src = '';
						 }
					</script>
					
					
					<div class="pagingArea" align="center" style="font-size: 14px;">
						<!-- 페이징 -->
						<c:if test="${ pi.currentPage <= 1 }">
					[이전]&nbsp;
					</c:if>
						<c:if test="${ pi.currentPage > 1 }">
							<c:url var="before" value="rlist.do">
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
								<c:url var="pagination" value="rlist.do">
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
							<c:url var="after" value="rlist.do">
								<c:param name="mNo" value="${ loginUser.mNo }" />
								<c:param name="page" value="${ pi.currentPage + 1 }" />
							</c:url>
							<a href="${ after }">[다음]</a>
						</c:if>
					</div>
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