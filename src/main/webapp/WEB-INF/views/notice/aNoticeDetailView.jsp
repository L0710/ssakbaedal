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
        
        .detail_table{
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
        
        .content_td {
            border-right: 1px solid rgb(130, 180, 127);
        }

        #td_title {
            border-right: 1px solid rgb(130, 180, 127);
        }
        
        #btn_area{
        	margin-right: 10%;
        	margin-top: 30px;
        }
        
        

</style>


</head>
<body>
	<div class="wrapper">
        <c:import url="../common/headerbar.jsp"/>
        
        <section>
        		<c:import url="../common/nav_admin.jsp"/>
 
            <div class="contents">
            	<div id="asdf">
                    <h1>공지사항</h1>
                </div>
            	<br>
                <br>
            
            	<table class="detail_table" align="center">
                    <tr>
                        <td id="td_title" width="60%"><strong>${ notice.nTitle }</strong></td>
                        <td width="20%">${ notice.nWriter }</td>
                        <td width="20%">${ notice.nCreateDate }</td>
                    </tr>
                </table>

                <table class="detail_table" align="center">
                    <tr>
                        <td class="content_td" width="20%" height="300px">내용</td>
                        <td>
							${ notice.nContent }
                        </td>
                    </tr>
                    <tr>
                        <td class="content_td">
							첨부파일
                        </td>
                        <td>
                        	<c:if test="${ !empty at.originalFileName }">
                            	<a href="${ contextPath }/resources/nUploadFiles/${ at.changeFileName }" download="${ at.originalFileName }">${ at.originalFileName }</a>
                            </c:if>
                        </td>
                    </tr>
                    
                </table>
                <!-- 검색 후 페이징 처리에 대한 수정 -->
				<!-- 검색한 값이 있는지 없는지 여부에 따라 넘어갈 주소값을 결정함 -->
				<c:if test="${ searchValue eq null }">
					<!-- 검색한 값이 없으면 selectList.bo 호출 -->
					<c:set var="loc" value="/nlist.do" scope="page"/>
				</c:if>
				<c:if test="${ searchValue ne null }">
					<!-- 검색한 값이 있으면 search.bo 호출 -->
					<c:set var="loc" value="/anSearch.do" scope="page"/>
				</c:if>
                            
                <c:url var="nlist" value="${ loc }">
	            	<c:if test="${ searchValue ne null }">
						<c:param name="searchCondition" value="${ searchCondition }"/>
						<c:param name="searchValue" value="${ searchValue }"/>
					</c:if>
                    <c:param name="page" value="${ currentPage }"/>
                </c:url>
                
                <c:url var="upnView" value="upnView.do">
                	<c:param name="nId" value="${ notice.nId }"/>
                	<c:param name="page" value="${ currentPage }"/>
                </c:url>
                
                <c:url var="nDelete" value="nDelete.do">
					<c:param name="nId" value="${ notice.nId }"/>
				</c:url>
                <div id="btn_area" align="right">
                    <button class="btn-ghost gray" align="right" onclick="location.href='${ nlist }'">목록</button>
                    <button class="btn-ghost green" align="right" onclick="location.href='${ upnView }'">수정</button>
                    <button class="btn-ghost red" align="right" onclick="noticeDelete();">삭제</button>
                </div>
                
            </div>
            
        </section>

    </div>
    
    <c:import url="../common/footer.jsp"/>
    
    <script>
    	function noticeDelete(){
    		var result = confirm("정말 삭제하시겠습니까?");
    		
    		if(result == true){
    			location.href='${ nDelete }';
    		}
    	}
    </script>
    
</body>
</html>