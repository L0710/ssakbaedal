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
	width: 80%;
}
#imgArea{

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
						<tr>
							<th rowspan="3"><div id="imgArea">매장이미지</div></th>
							<th>${ r.sName }(${ r.sTel })</th>
						</tr>
						<tr>
							<c:set var="time" value="${ r.oTime }" />
							<fmt:formatDate var="orderTime" type="date" value="${time}" pattern="yyyy/MM/dd HH:mm:ss" />
							<th>주문날짜 : ${ orderTime }</th>
						</tr>
						<tr>
							<th>내가 준 별점 : ${ r.rStar }</th>
						</tr>
						<tr>
							<td colspan="2" style="color: rgb(102, 102, 102); text-align: left;">
							내가 주문한 메뉴 : 
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
							<td colspan="2">
								<div class="imgArea" align="center">
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
							<td colspan="2" style="background-color: rgb(226, 226, 226); text-align: left;">
							사장님 작성 내용
							</td>
						</tr>
						<tr>
							<td colspan="2" style="text-align: right">
								<button id="deleteBtn" onclick="deleteCfm();">삭제</button>
							</td>
						</tr>
						<tr>
							<td></td>
						</tr>
					</c:forEach>
					</table>
					<script>
                        function deleteCfm(){
                            var flag = confirm("삭제하시겠습니까?");
                            console.log("flag:"+flag);

                            if(flag == true){
                                // 확인 시 삭제 수행
                            }
                        }
                    </script>
					<br>
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