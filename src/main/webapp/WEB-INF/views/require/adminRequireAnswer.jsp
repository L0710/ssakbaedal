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
        
        #in_table {
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
            border-bottom: 1px solid rgb(192, 211, 192);
            overflow: hidden;
            white-space: nowrap;
            text-overflow: ellipsis;
        }
        
        th {
            background-color: rgb(192, 211, 192);
            color: white;
        }
        
        #urTable tr:hover {
            cursor: pointer;
            background: rgba(130, 180, 127, 0.1);
        }
        
        .contents {
            margin-top: 1%;
            padding: 3%;
            border: 1px solid lightgray;
            height: 100%;
        }
        
        #asdf{
            width: 100%;
            height: 50px;
            text-align: center;
        }
        
        #btnArea {
            margin-top: 35px;
            margin-left: 860px;
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
					<h1 style="font-size: 24px">문의사항 답변</h1>
                </div>
				<form action="aReaAnswerInsert.do" method="POST" enctype="multipart/form-data">
					<input type="hidden" name="reNo" value="${ reNo }">
					<input type="hidden" name="page" value="${ page }">
					
                    <table align="center">
                        <tr>
                            <th>작성자</th>
                            <td>
                                <input type="text" name="rWriter" value="${ loginUser.mId }" size="80" readonly>
                            </td>
                        </tr>
                        <tr>
                            <th>답변내용</th>
                            <td>
                                <textarea cols="80" rows="7" name="rContent"></textarea>
                            </td>
                        </tr>
                    </table>
                    
                    <div id="btnArea">
                        <button type="submit" class="btn-ghost green">답변</button>
                        <button type="button" id="cancelBtn" class="btn-ghost gray" onclick="history.go(-1)">취소</button>
                    </div>
                    
                </form>

			</div>
			
		</section>

	</div>
	<br>
	<br>
	<c:import url="../common/footer.jsp" />
</body>
</html>