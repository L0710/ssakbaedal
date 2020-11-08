<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
        
        #up_table{
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
        
        button {
            cursor: pointer;
            margin: 3px;
            padding: 10px 20px;
        }
        
        .btn-ghost.gray {
            background: transparent;
            border: 2px solid rgb(64, 64, 64);
            border-radius: 8px;
            color: rgb(64, 64, 64);
            text-decoration: none;
            -webkit-transition-duration: 0.4s;
            /* Safari */
            transition-duration: 0.4s;
        }
        
        .btn-ghost.gray:hover {
            background-color: rgb(64, 64, 64);
            color: white;
        }
        
        .btn-ghost.green {
            background: transparent;
            border: 2px solid rgb(130, 180, 127);
            border-radius: 8px;
            color: rgb(130, 180, 127);
            text-decoration: none;
            -webkit-transition-duration: 0.4s;
            /* Safari */
            transition-duration: 0.4s;
        }
        
        .btn-ghost.green:hover {
            background-color: rgb(130, 180, 127);
            color: white;
        }
        
        .logoArea {
            margin-top: 1%;
        }
        
        .sidemenu {
            width: 150px;
            position: fixed;
            top: 200px;
            /*left: 1290px;*/
            margin-left: 1035px;
            margin-top: 100px;
        }
        
        .contents {
            margin-top: 1%;
            padding: 3%;
            border: 1px solid lightgray;
            height: 100%;
        }
        
        .btnGroup {
            margin-top: 1%;
        }        
        
        #logo {
            width: 100%;
            height: 200px;
        }
        
        #addtxt {
            height: 25px;
            background-color: white;
            font-size: 15px;
            text-align: center;
        }
        
        #mypageBtn,
        #logoutBtn {
            margin-top: 0;
            margin-bottom: 0;
        }
        
        #address {
            float: left;
        }
        
        #goEvent, #goRank {
            width: 100%;
        }
        
        #insertReplyBtn {
            width: 60px;
            height: 30px;
            padding: 0;
        }
        
        #notice_table tr:hover {
            cursor: pointer;
            background: rgba(130, 180, 127, 0.1);
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
        
        #asdf{
            width: 100%;
            height: 50px;
            text-align: center;
        }

</style>


</head>
<body>
	<div class="wrapper">
        <c:import url="../common/headerbar.jsp"/>
        
        <section >
            <c:import url="../common/nav_admin.jsp"/>
            
            <div class="contents">
            
            	<div id="asdf">
                    <h1>공지사항 수정</h1>
                </div>
            	<br>
                <br>
            	<form action="nUpdate.do" method="POST" enctype="multipart/form-data">
            		<input type="hidden" name="page" value="${ currentPage }">
                    <input type="hidden" name="nId" value="${ notice.nId }">
                    <table id="up_table" align="center">
                        <tr>
                            <th width="20%">제목</th>
                            <td>
                                <input type="text" name="nTitle" size="80" value="${ notice.nTitle }">
                            </td>
                        </tr>
                        <tr>
                            <th>작성자</th>
                            <td>
                                <input type="text" name="nWriter" value="${ notice.nWriter }" size="80" readonly>
                            </td>
                        </tr>
                        <tr>
                            <th>공지내용</th>
                            <td>
                                <textarea cols="80" rows="7" name="nContent">${ notice.nContent }</textarea>
                            </td>
                        </tr>
                        <tr>
                            <th>업로드한 파일</th>
                            <td>
                            	<c:if test="${ !empty at.originalFileName }">
                                	<a href="${ contextPath }/resources/nUploadFiles/${ at.changeFileName }" download>${ at.originalFileName }</a>
                                </c:if>
                            </td>
                        </tr>
                        <tr>
                            <th>첨부파일 변경</th>
                            <td>
                                <input type="file" name="reloadFile">
                            </td>
                        </tr>
                        <tr>
                            <th>공지구분</th>
                            <td>
                            	<c:if test="${ notice.nSort == '전체' }">
                                	<input type="radio" name="nSort" value="전체" checked>
                                	<label>전체공지</label>
                                	<input type="radio" name="nSort" value="매장">
                                	<label>매장공지</label>
								</c:if>
								<c:if test="${ notice.nSort == '매장' }">
									<input type="radio" name="nSort" value="전체">
                                	<label>전체공지</label>
                                	<input type="radio" name="nSort" value="매장" checked>
                                	<label>매장공지</label>
                                </c:if>
                            </td>
                        </tr>
                    </table>
                    
                    <div id="btnArea">
                        <button type="submit" class="btn-ghost green">수정</button>
                        <button type="button" class="btn-ghost gray" onclick="history.go(-1)">취소</button>
                    </div>
                    
                </form>
            	
            </div>
            
        </section>

    </div>
    
    <c:import url="../common/footer.jsp"/>
</body>
</html>