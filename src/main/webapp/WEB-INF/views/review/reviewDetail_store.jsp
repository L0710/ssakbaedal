<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%
    pageContext.setAttribute("enter", "\n"); //Enter
    pageContext.setAttribute("br", "<br/>"); //br 태그
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ssakbaedal</title>
<style>
#rContent {
	border: 1px solid rgb(192, 211, 192);
	/* border: 0; */
	padding: 2em;
}

#reviewTable {
	margin: auto;
	width: 80%;
}

#reply {
	padding: 1em;
}

#countingArea {
	text-align: right;
	margin-right: 15%;
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
	background-color: rgba(0, 0, 0, 0.9);
}

#img-modal>img {
	margin: auto;
	display: block;
	width: auto;
	height: 100%;
	margin-bottom: 120px;
}

#img-modal>span {
	position: absolute;
	top: 15px;
	right: 35px;
	color: #f1f1f1;
	font-size: 40px;
	font-weight: bold;
}

#img-modal>span:hover {
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

		<section>
			<c:import url="../common/nav_store.jsp" />

			<div class="contents">
				<br>
				<br>
				<div class="info-wrapper">
					<table id="reviewTable">
						<tr>
							<td rowspan="4">
								<div class="imgArea">
									<c:forEach var="at" items="${ r.attachment }">
										<c:if test="${ !empty at.originalFileName  }">
											<div class="img" id="contentImgArea" style="float: left;">
												<img id="contentImg" width="100" height="100"
													src="${ contextPath }/resources/ruploadFiles/${ at.changeFileName }">
											</div>
										</c:if>
									</c:forEach>
								</div>
							</td>
						</tr>
						<tr>
							<td>주문 메뉴 : <c:set var="comma" value="," /> <c:forEach
									var="d" items="${ r.oDetail }" varStatus="status">
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
							<td>작성자 : ${fn:substring(r.rWriter, 0, 1)}***${fn:substring(r.rWriter, 4, fn:length(r.rWriter))}
							</td>
						</tr>
						<tr>
							<td>손님 별점 : <label style="color: rgb(255, 194, 0);">
									<strong> <c:if test="${ r.rStar eq '1'}">
	                        	★☆☆☆☆
	                        	</c:if> <c:if test="${ r.rStar eq '2'}">
	                       		★★☆☆☆
	                       		</c:if> <c:if test="${ r.rStar eq '3'}">
	                       		★★★☆☆
	                       		</c:if> <c:if test="${ r.rStar eq '4'}">
	                       		★★★★☆
	                       		</c:if> <c:if test="${ r.rStar eq '5'}">
	                       		★★★★★
	                       		</c:if>
								</strong>
							</label>
							</td>
						</tr>

					</table>

					<div class="review-wrapper" align="center">
						<br>
						<br>

						<textarea id="rContent" cols="100" rows="6" style="resize: none"
							placeholder="손님 리뷰" readonly>${fn:replace(r.rContent, enter, br)}</textarea>

						<br>
						<br>

						
						<c:forEach var="rply" items="${ r.reply }">
							<c:if test="${ rply.rContent ne null }">
								<h3 style="text-align: left; margin-left: 14%">답글</h3>
								<textarea id="reply" name="rContent" cols="100" rows="6"
									style="resize: none" placeholder="사장님답글내용" readonly>${ rply.rContent }</textarea>
							</c:if>
							<c:if test="${ rply.rContent eq null }">
								<h3 style="color:rgb(192, 211, 192)">아직 답글을 작성하지 않았습니다.</h3>
							</c:if>
						</c:forEach>
						
						<br>
						<br>

						<div align="right" style="margin-right: 10%;">
							<button type="button" class="btn-ghost green"
								onclick="javascript:history.back()">목록</button>
						</div>

					</div>
				</div>
				<br>

				<div id="img-modal" onclick="imgModalClose();">
					<span onclick="imgModalClose();">X</span> <img
						id="img-modal-content">
				</div>

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

			</div>
		</section>

		<c:import url="../common/sidemenu_store.jsp" />

	</div>
	<br>
	<br>

	<c:import url="../common/footer.jsp" />
</body>
</html>