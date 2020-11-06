<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
        
        section {
            width: 100%;
            height: 60%;
            float: left;
        }
        
        #in_table{
        	border-collapse: collapse;
            background-color: white;
            width: 65%;
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
            border-right: 1px solid rgb(192, 211, 192);
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
            margin-left: 780px;
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
                    <h1>업체 승인</h1>
                </div>
            	
                    <table id="in_table" align="center">
                        <tr>
                            <th width="20%">매장명</th>
                            <td>
                                ${ storeAppro.sName }
                            </td>
                        </tr>
                        <tr>
                            <th>사업자등록번호</th>
                            <td>
                                ${ storeAppro.sNo }
                            </td>
                        </tr>
                        <tr>
                            <th>사업자등록증 사진</th>
                            <td>
                                <c:if test="${ !empty at.originalFileName }">
                            		<a href="${ contextPath }/resources/muploadFiles/certification/${ at.changeFileName }" download="${ at.originalFileName }">${ at.originalFileName }</a>
                            	</c:if>
                            </td>
                        </tr>
                        <tr>
                            <th>매장 전화번호</th>
                            <td>
                                ${ storeAppro.sTel }
                            </td>
                        </tr>
                        <tr>
                        	<th>매장 주소</th>
                        	<td>
                        		${ storeAppro.sAddress }
                        	</td>
                        </tr>
                        <tr>
                        	<th>카테고리</th>
                        	<td>
                        		${ storeAppro.sCategory }
                        	</td>
                        </tr>
                    </table>
                    
					<c:url var="sApprove" value="sApprove.do">
						<c:param name="mNo" value="${ storeAppro.mNo }"/>
						<c:param name="page" value="${ page }"/>
					</c:url>
                    <div id="btnArea">
                        <button type="button" id="cancelBtn" class="btn-ghost gray" onclick="history.go(-1)">목록</button>
                        <button type="button" class="btn-ghost green" onclick="location.href='${ sApprove }'">승인</button>
                    </div>

            </div>
            
        </section>

    </div>
    
    <c:import url="../common/footer.jsp"/>
</body>
</html>