<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ssakbaedal</title>
<!-- jQuery UI CSS파일 -->
<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />
<style>
	#updateTable{
		width: 80%;
	}
	
	#updateBtn {
		cursor: pointer;
        margin: 3px;
        padding: 10px 20px;
	}
</style>
</head>
<body>
<div class="wrapper">
        <c:import url="../common/headerbar.jsp"/>
        <!-- jQuery 기본 js파일 -->
        <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
        <!-- jQuery UI 라이브러리 js파일 -->
        <script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
        
        <section>
        	<c:import url="../common/nav_admin.jsp"/>
            <div class="contents" align="center">
            	<!-- 아래 h1은 지우기 ~ -->
                <h1 align="center">${ e.eNo }번 게시글 수정하기</h1>
                <br>
                
                <form action="eupdate.do" method="post" enctype="multipart/form-data">
	                <input type="hidden" name="page" value="${ currentPage }">
					<input type="hidden" name="eNo" value="${ e.eNo }">
					<input type="hidden" name="renameFileName" value="${ at.changeFileName }">
					<input type="hidden" name="originalFileName" value="${ at.originalFileName }">
					<input type="hidden" name="filePath" value="${ at.filePath }">
				
	                <table align="center" id="updateTable">
	                    <tr>
	                        <td>제목</td>
	                        <td style="text-align:left;">
	                        	<input type="text" style="width:80%" name="eTitle" placeholder="제목을 입력해주세요" value="${ e.eTitle }" required>
	                        </td>
	                    </tr>
	                    <tr>
	                        <td>기간</td>
	                        <td style="text-align:left;">
	                            <input type="text" id="startDate" name="eStartDate" placeholder="클릭하여 날짜 설정" value="${ e.eStartDate }" required> 
	                            &nbsp;~&nbsp;
	                            <input type="text" id="endDate" name="eEndDate" placeholder="클릭하여 날짜 설정" value="${ e.eEndDate }" required> 
	                        </td>
	                        <script>
	                            $(function() {
	                                // KR language callendar
	                                $.datepicker.regional['kr'] = {
	                                    closeText: '닫기', // 닫기 버튼 텍스트 변경
	                                    currentText: '오늘', // 오늘 텍스트 변경
	                                    monthNames: ['1 월','2 월','3 월','4 월','5 월','6 월','7 월','8 월','9 월','10 월','11 월','12 월'], // 개월 텍스트 설정
	                                    monthNamesShort: ['1 월','2 월','3 월','4 월','5 월','6 월','7 월','8 월','9 월','10 월','11 월','12 월'], // 개월 텍스트 설정
	                                    dayNames: ['월요일','화요일','수요일','목요일','금요일','토요일','일요일'], // 요일 텍스트 설정
	                                    dayNamesShort: ['월','화','수','목','금','토','일'], // 요일 텍스트 축약 설정   
	                                    dayNamesMin: ['월','화','수','목','금','토','일'], // 요일 최소 축약 텍스트 설정
	                                };
	
	                                // Seeting up default language, Korean
	                                $.datepicker.setDefaults($.datepicker.regional['kr']);
	
	                                $("#startDate").datepicker({
	                                    dateFormat: "yy-mm-dd",
	                                    minDate: 0,
	                                    onClose: function(selectedDate) {    
	                                        $("#endDate").datepicker("option", "minDate", selectedDate);
	                                    }  
	                                });
	
	                                $("#endDate").datepicker({
	                                    dateFormat: "yy-mm-dd",
	                                    minDate: 0,
	                                    onClose: function( selectedDate ) {
	                                        $("#startDate").datepicker( "option", "maxDate", selectedDate );
	                                    }
	                                });
	                            });
	                        </script>
	                    </tr>
	                    <tr>
	                        <td>내용</td>
	                        <td style="text-align:left;">
	                            <textarea name="eContent" style="width:80%; height: 150px; resize:none" placeholder="내용을 입력해주세요" required>${ e.eContent }</textarea>
	                        </td>
	                    </tr>
	                    <tr>
	                        <td>포인트</td>
	                        <td style="text-align:left;"><input type="text" name="ePoint" style="width:200px" placeholder="원 단위로 입력 : ex) 1000" value="${ e.ePoint }" required></td>
	                    </tr>
	                    <tr>
	                        <td>댓글작성가능</td>
	                        <td style="text-align:left;">
	                        	<input type="checkbox" <c:if test="${ e.rAvailable eq 'Y'}">checked</c:if>>
	                        </td>
	                    </tr>
	                    <tr>
	                        <td>첨부파일</td>
	                        <td style="text-align:left;">
	                        	<input type="file" name="reloadFile">
	                        	<c:if test="${ !empty at.originalFileName }">
									<br>현재 업로드한 파일 : 
									<a href="${ contextPath }/resources/euploadFiles/${ at.changeFileName }">${ at.originalFileName }</a>
								</c:if>
	                        </td>
	                    </tr>
							
	                </table>
                
                <br><br>
	                <div align="right" style="margin-right: 20%">
	                    <input class="btn-ghost green" type="submit" id="updateBtn" align="right" value="수정">
	                    <button class="btn-ghost gray" type="button" id="cancelBtn" align="right" onclick="history.go(-1)">취소</button>
	                </div>
                </form>
                <br><br>

            </div>
        </section>
        <br><br>


    </div>
    <br><br>
    
    <c:import url="../common/footer.jsp"/>
</body>
</html>