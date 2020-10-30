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
            margin-left: 186.8px;
            width: 1013.5px;
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
        
        <section >
            
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
					<c:set var="loc" value="/tnlist.do" scope="page"/>
				</c:if>
				<c:if test="${ searchValue ne null }">
					<!-- 검색한 값이 있으면 search.bo 호출 -->
					<c:set var="loc" value="/tnSearch.do" scope="page"/>
				</c:if>
                            
                <c:url var="tnlist" value="${ loc }">
	            	<c:if test="${ searchValue ne null }">
						<c:param name="searchCondition" value="${ searchCondition }"/>
						<c:param name="searchValue" value="${ searchValue }"/>
					</c:if>
                    <c:param name="page" value="${ currentPage }"/>
                </c:url>
                
                <div id="btn_area" align="right">
                    <button class="btn-ghost gray" align="right" onclick="location.href='${ tnlist }'">목록</button>
                </div>
            	
            </div>
            
        </section>
        
        <c:import url="../common/sidemenu_sCenter.jsp"/>

    </div>
    
    <c:import url="../common/footer.jsp"/>
</body>
</html>