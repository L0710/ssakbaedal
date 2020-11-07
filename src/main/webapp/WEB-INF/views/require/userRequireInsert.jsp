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
        
        .inTabel {
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
        
        #btnArea{
        	margin-right: 15.5%;
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
				<form action="reqInsert.do" method="POST" enctype="multipart/form-data">
                    <input type="hidden" name="mNo" value="${ loginUser.mNo }">
                    
                    <table id="inTabel" align="center">
                        <tr>
                            <th width="20%">제목</th>
                            <td>
                                <input type="text" name="reTitle" size="80">
                            </td>
                        </tr>
                        <tr>
                            <th>작성자</th>
                            <td>
                                <input type="text" name="reWriter" value="${ loginUser.mId }" size="80" readonly>
                            </td>
                        </tr>
                        <tr>
                            <th>답변내용</th>
                            <td>
                                <textarea cols="80" rows="7" name="reContent"></textarea>
                            </td>
                        </tr>
                        <tr>
                            <th>첨부파일</th>
                            <td>
                                <input type="file" id="uploadFile" name="uploadFile">
                            </td>
                        </tr>
                    </table>

                    <div id="btnArea" align="right">
                        <button type="submit" class="btn-ghost green">작성</button>
                        <button type="button" class="btn-ghost gray" onclick="history.go(-1)">취소</button>
                    </div>
                    
                </form>

			</div>
			
		</section>

		<c:import url="../common/sidemenu_user.jsp" />

	</div>
	<br>
	<br>
	<c:import url="../common/footer.jsp" />
	
</body>
</html>