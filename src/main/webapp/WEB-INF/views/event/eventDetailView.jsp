<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
	#section {
		width: 85%;
		height: 60%;
		float: left;
	}
	#eventContent{
		width: 80%;
	}
	#replyTable {
		width: 80%;
	}
	#eventImg {
		width:100%;
		height:100%;
	}
</style>
</head>
<body>
	<div class="wrapper">
		<c:import url="../common/headerbar.jsp"/>

        <section id="section">
            <!-- 로그인했을시 유저에 따른 내비 보여주기 -->
        	<!-- 관리자 -->
        	<c:if test="${ !empty loginUser && loginUser.mId eq 'admin' }">
        		<c:import url="../common/nav_admin.jsp"/>
			</c:if>
			<!-- 일반유저 -->
			<c:if test="${ !empty loginUser && loginUser.mId ne 'admin' }">
				<c:import url="../common/nav_user.jsp"/>
			</c:if>

            <div class="contents">
                <br>
                <table align="center" id="eventContent">
                    <tr>
                        <td>
                            <h1 style="text-align:left">${ e.eTitle }</h1>
                        </td>
                        <td style="text-align:right">작성자 : ${ fn:toLowerCase(e.eWriter) }<br>
                        <c:set var="CreateDate" value="${ e.eCreateDate }"/>
                        <c:set var="ModifyDate" value="${ e.eModifyDate }"/>
                        <c:set var="eStartDate" value="${ e.eStartDate }"/>
                        <c:set var="eEndDate" value="${ e.eEndDate }"/>
                        <fmt:formatDate var="cdate" type="date" value="${CreateDate}" pattern="yyyy년 MM월 dd일"/>
                        <fmt:formatDate var="mdate" type="date" value="${ModifyDate}" pattern="yyyy년 MM월 dd일"/>
                        <fmt:formatDate var="sdate" type="date" value="${eStartDate}" pattern="MM월 dd일"/>
                        <fmt:formatDate var="edate" type="date" value="${eEndDate}" pattern="MM월 dd일"/>
							작성일 : ${ cdate }<br>
							수정일 : ${ mdate }<br>
							이벤트 기간 : ${ sdate } ~ ${ edate }<br>
							조회수 : ${ e.eCount }
                        </td>
                    </tr>
                    <tr><td colspan="2"><hr></td></tr>
                    <tr>
                        <td colspan="2">
                            <div id="imgArea">
	                            <c:if test="${ !empty at.originalFileName }">
	                            	<img id="eventImg" src="${ contextPath }/resources/euploadFiles/${ at.changeFileName }">
	                           	</c:if>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">${fn:replace(e.eContent, enter, br)}</td>
                    </tr>
                </table>
                <br><br><br><br><br><br><br>
                
                <div align="right" style="margin-right:5%;">
	                <c:url var="eupview" value="eupview.do">
						<c:param name="eNo" value="${ e.eNo }"/>
						<c:param name="page" value="${ currentPage }"/>
					</c:url>
					<c:url var="edelete" value="edelete.do">
						<c:param name="eNo" value="${ e.eNo }"/>
					</c:url>
					<c:url var="elist" value="elist.do">
						<c:param name="page" value="${ currentPage }"/>
					</c:url>
					<button class="btn-ghost gray" onclick="location.href='${ elist }'">목록</button>
					<c:if test="${ loginUser.mId eq e.eWriter }">
	                	<button class="btn-ghost green" onclick="location.href='${ eupview }'">수정</button>
	                	<button class="btn-ghost red" onclick="deleteEvent();">삭제</button>
                	</c:if>
                </div>
                <script>
                	function deleteEvent(){
                		if(confirm("삭제하시겠습니까?") == true){
                			location.href='${ edelete }';
                		}
                	}
                </script>
                <hr>
                
                <br><br>
                
                <div align="center">
                	<c:url var="pupdate" value="pupdate.do">
                		<c:param name="eNo" value="${ e.eNo }"/>
						<c:param name="ePoint" value="${ e.ePoint }"/>
						<c:param name="mNo" value="${ loginUser.mNo }"/>
					</c:url>
					<c:if test="${ loginUser.mType eq '2'}">
                    	<button class="btn-ghost green" id="pointBtn">포인트 받기</button>
                    </c:if>
                </div>
                
                <!-- 포인트 지급 내역 확인 후 지급내역 없을 경우 포인트 지급 -->
                <script>
                	$(function(){
                		$("#pointBtn").on("click", function(){
                			var eNo = ${ e.eNo };
                			var mNo = ${ loginUser.mNo };
                			
                			$.ajax({
                				url:"selectphsty.do",
                				data: {eNo:eNo, mNo:mNo},
                				type: "post",
                				success : function(data){
                					console.log(data);
                					
                					if(data == "matched"){
                						warningAlert();
                					} else {
                						getPoint();
                					}
                				},
                				error : function(e){
            						console.log(e);
            					}
                			});
                		});
                	})
                	
                	function warningAlert(){
                		alert("이미 포인트를 지급받았습니다.");
                	}
                	
                	function getPoint(){
                		location.href="${ pupdate }";
                	}
                </script>
                
                <br><br>

                <div id="replyArea" align="center">
                    <input id="reply" placeholder="내용을 입력하세요" style="width:60%;">
                    <button class="btn-ghost green" id="insertReplyBtn">입력</button>
                    <table id="replyTable">
                        <tr>
                            <td colspan="4" style="text-align:left"><b id="rCount">댓글(n)</b></td>
                        </tr>
                        <tr>
                            <th width="15%">작성자</th>
                            <th></th>
                            <th width="13%">작성일</th>
                            <th width="10%"></th>
                        </tr>
                        <tr>
                            <td>user01</td>
                            <td>가나다라마바사~~~</td>
                            <td>2020-09-24</td>
                            <td>
                                <a href="#">수정</a> &nbsp;
                                <a href="#">X</a>
                            </td>
                        </tr>
                        <tr>
                            <td>user01</td>
                            <td>가나다라마바사~~~</td>
                            <td>2020-09-24</td>
                            <td>
                                <a href="#">수정</a> &nbsp;
                                <a href="#">X</a>
                            </td>
                        </tr>
                        <tr>
                            <td>user01</td>
                            <td>가나다라마바사~~~</td>
                            <td>2020-09-24</td>
                            <td>
                                <a href="#">수정</a> &nbsp;
                                <a href="#">X</a>
                            </td>
                        </tr>
                        <tr>
                            <td>user01</td>
                            <td>가나다라마바사~~~</td>
                            <td>2020-09-24</td>
                            <td>
                                <a href="#">수정</a> &nbsp;
                                <a href="#">X</a>
                            </td>
                        </tr>
                    </table>
                </div>
            </div>
        </section>

		<c:import url="../common/sidemenu_user.jsp"/>

    </div>
    
    <c:import url="../common/footer.jsp"/>
</body>
</html>