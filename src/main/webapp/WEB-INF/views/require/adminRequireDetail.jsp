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
        section {
            width: 100%;
            height: 60%;
            float: left;
        }
        
        .reqdTable {
            border-collapse: collapse;
            background-color: white;
            width: 80%;
            overflow: hidden;
            border-radius: 5px;
            table-layout: fixed;
        }
        
        th, td {
            font-family:'Motnserrat',sans-serif;
            text-align: center;
            font-size: 12px;
            padding: 10px;
            border-top: 1px solid rgb(192, 211, 192);
            border-bottom: 1px solid rgb(192, 211, 192);
            overflow: hidden;
            white-space: nowrap;
            text-overflow: ellipsis;
        }
        
        th {
            background-color: rgb(192, 211, 192);
            color: white;
        }
        
        .content_td {
            border-right: 1px solid rgb(130, 180, 127);
        }

        #td_button {
            border: 1px solid white;
        }

        #td_title {
            border-right: 1px solid rgb(130, 180, 127);
        }
        
        .td_writer{
        	border-right: 1px solid rgb(130, 180, 127);
        }

        #answer_title {
            
            width: 100%;
            height: 50px;
        }
        
        .contents {
            margin-top: 1%;
            padding: 3%;
            border: 1px solid rgb(130, 180, 127);
            height: 100%;
        }
        
        #asdf{
            width: 100%;
            height: 50px;
            text-align: center;
        }
        
        #btn_area{
        	margin-right: 10%;
        	margin-top: 30px;
        }
</style>
</head>
<body>
	<div class="wrapper">
		<c:import url="../common/headerbar.jsp" />

		<section id="section">
			<c:import url="../common/nav_admin.jsp" />

			<div class="contents">
				<div id="asdf">
					<h1 style="font-size: 24px">문의사항</h1>
                </div>
				<table class="reqdTable" align="center">
                    <tr>
                        <td id="td_title" width="60%"><strong>${ require.reTitle }</strong></td>
                        <td class="td_writer" width="20%">${ require.reWriter }</td>
                        <td width="20%">${ require.reModifyDate }</td>
                    </tr>
                </table>

                <table class="reqdTable" align="center">
                    <tr>
                        <td class="content_td" width="20%" height="200px">문의내용</td>
                        <td>
							${ require.reContent }
                        </td>
                    </tr>
                    <tr>
                        <td class="content_td">
							첨부파일
                        </td>
                        <td>
                        	<c:if test="${ !empty at.originalFileName }">
                            	<a href="${ contextPath }/resources/reuploadFiles/${ at.changeFileName }" download="${ at.originalFileName }">${ at.originalFileName }</a>
                            </c:if>
                        </td>
                    </tr>
                </table>
                <br>
                <br>
                <br>
                <c:if test="${ require.reAnswer == 'Y' }">
	                <hr>
					
					<br>
					
	                <div id="answer_title" align="center">
	                    <h3>답변</h3>
	                </div>
	                <table class="reqdTable" align="center">
	                    <tr>
	                        <td class="td_writer" width="50%">${ reply.rWriter }</td>
	                        <td width="50%">${ reply.rModifyDate }</td>
	                    </tr>
	                </table>
	
	                <table class="reqdTable" align="center">
	                    <tr>
	                        <td class="content_td" width="20%" height="200px">답변내용</td>
	                        <td>
								${ reply.rContent }
	                        </td>
	                    </tr>
	                    
	                </table>
                
                </c:if>
                
                <c:url var="areqList" value="areqList.do">
                    <c:param name="page" value="${ currentPage }"/>
                </c:url>
                
                <c:url var="aReaAnswerView" value="aReaAnswerView.do">
                	<c:param name="page" value="${ currentPage }"/>
                	<c:param name="reNo" value="${ require.reNo }"/>
                </c:url>
                
                <c:url var="areqDelete" value="areqDelete.do">
                	<c:param name="reNo" value="${ require.reNo }"/>
                	<c:param name="page" value="${ currentPage }"/>
                </c:url>
                
                <c:url var="areqUpView" value="areqUpView.do">
                	<c:param name="reNo" value="${ require.reNo }"/>
                	<c:param name="page" value="${ currentPage }"/>
                	<c:param name="rNo" value="${ reply.rNo }"/>
                </c:url>
                
				<div id="btn_area" align="right">
                    <button class="btn-ghost gray" align="right" onclick="location.href='${ areqList }'">목록</button>
                    <c:if test="${ require.reAnswer == 'N' }">
                    	<button class="btn-ghost green" align="right" onclick="location.href='${ aReaAnswerView }'">답변</button>
                    </c:if>
                    <!-- 수정, 삭제 버튼의 경우 관리자가 문의사항에 답변을 했을 떄 화면에 보이게 해야함. -->
                    <c:if test="${ require.reAnswer == 'Y' }">
	                    <button class="btn-ghost green" align="right" onclick="location.href='${ areqUpView }'">수정</button>
	                    <button class="btn-ghost red" align="right" onclick="aRequireDelete();">삭제</button>
                    </c:if>
                </div>
                <br>

			</div>
			
		</section>

	</div>
	<br>
	<br>
	<c:import url="../common/footer.jsp" />
	
	<script>
    	function aRequireDelete(){
    		var result = confirm("정말 삭제하시겠습니까?");
    		
    		if(result == true){
    			location.href='${ areqDelete }';
    		}
    	}
    </script>
</body>
</html>