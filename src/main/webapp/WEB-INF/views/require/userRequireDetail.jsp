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
            width: 85%;
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
			<c:import url="../common/nav_user.jsp" />

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
                
                <c:url var="uRequireList" value="uRequireList.do">
                    <c:param name="page" value="${ currentPage }"/>
                    <c:param name="mNo" value="${ mNo }"/>
                </c:url>
                
                <c:url var="ureqDelete" value="ureqDelete.do">
                	<c:param name="reNo" value="${ require.reNo }"/>
                	<c:param name="mNo" value="${ mNo }"/>
                </c:url>
                
                <c:url var="ureqUpView" value="ureqUpView.do">
                	<c:param name="reNo" value="${ require.reNo }"/>
                	<c:param name="mNo" value="${ mNo }"/>
                	<c:param name="page" value="${ currentPage }"/>
                </c:url>
                
				<div id="btn_area" align="right">
                    <button class="btn-ghost gray" align="right" onclick="location.href='${ uRequireList }'">목록</button>
                    <button class="btn-ghost green" align="right" onclick="location.href='${ ureqUpView }'">수정</button>
                    <button class="btn-ghost red" align="right" onclick="uRequireDelete();">삭제</button>
                </div>
                <br>
                <!-- 답변을 했을 경우 생성 -->
                <hr>
				
				<br>
				<c:if test="${ require.reAnswer == 'Y' }">
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

			</div>
			
		</section>

		<c:import url="../common/sidemenu_user.jsp" />

	</div>
	<br>
	<br>
	<c:import url="../common/footer.jsp" />
	
	<script>
    	function uRequireDelete(){
    		var result = confirm("정말 삭제하시겠습니까?");
    		
    		if(result == true){
    			location.href='${ ureqDelete }';
    		}
    	}
    </script>
</body>
</html>