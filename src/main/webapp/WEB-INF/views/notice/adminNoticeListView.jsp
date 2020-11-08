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
        
        #notice_table{
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

</style>


</head>
<body>
	<div class="wrapper">
        <c:import url="../common/headerbar.jsp"/>
        
        <section >
            <c:import url="../common/nav_admin.jsp"/>
            
            <div class="contents">
            	<div id="asdf">
					<h1 style="font-size: 24px">공지사항</h1>
                </div>
                <table id="notice_table" align="center">
                    <tr>
                        <th width="10%">NO</th>
                        <th>제목</th>
                        <th width="15%">구분</th>
                        <th width="15%">작성일</th>
                    </tr>
					
					<c:forEach var="n" items="${ nlist }">
						<c:url var="andetail" value="anDetail.do">
							<c:param name="nId" value="${ n.nId }"/>
							<c:param name="page" value="${ pi.currentPage }"/>
							<c:param name="searchCondition" value="${ search.searchCondition }"/>
							<c:param name="searchValue" value="${ search.searchValue }"/>
						</c:url>
						
	                    <tr onclick="location.href='${contextPath}/${ andetail }'">
	                        <td>${ n.nId }</td>
	                        <td>${ n.nTitle }</td>
	                        <td>${ n.nSort }</td>
	                        <td>${ n.nCreateDate }</td>
	                    </tr>
					</c:forEach>
                </table>
                <br>
                <div align="right" style="margin-right: 10%">
                    <button class="btn-ghost green" id="insertBtn" align="right" onclick="location.href='innView.do'">공지작성</button>
                </div>

                <div class="pagingArea" align="center" style="font-size:14px;">
                
                	<!-- 검색 후 페이징 처리에 대한 수정 -->
					<!-- 검색한 값이 있는지 없는지 여부에 따라 넘어갈 주소값을 결정함 -->
					<c:if test="${ search.searchValue eq null }">
						<!-- 검색한 값이 없으면 selectList.bo 호출 -->
						<c:set var="loc" value="/nlist.do" scope="page"/>
					</c:if>
					<c:if test="${ search.searchValue ne null }">
						<!-- 검색한 값이 있으면 search.bo 호출 -->
						<c:set var="loc" value="/anSearch.do" scope="page"/>
					</c:if>
                
                    <!-- 페이징 -->
                    <c:if test="${ pi.currentPage <= 1 }">
					[이전]&nbsp;
					</c:if>
					<c:if test="${ pi.currentPage > 1 }">
						<c:url var="before" value="${ loc }">
						<c:if test="${ search.searchValue ne null }">
							<c:param name="searchCondition" value="${ search.searchCondition }"/>
							<c:param name="searchValue" value="${ search.searchValue }"/>
						</c:if>
							<c:param name="page" value="${ pi.currentPage - 1 }"/>
						</c:url>
						<a href="${ before }">[이전]</a>&nbsp;
					</c:if>
					
					<!-- 페이지 숫자 -->
					<c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
						<c:if test="${ p eq pi.currentPage }">
							<font color="red" size="3">[ ${ p } ]</font>
						</c:if>
						<c:if test="${ p ne pi.currentPage }">
							<c:url var="pagination" value="${ loc }">
								<c:if test="${ search.searchValue ne null }">
									<c:param name="searchCondition" value="${ search.searchCondition }"/>
									<c:param name="searchValue" value="${ search.searchValue }"/>
								</c:if>
								<c:param name="page" value="${ p }"/>
							</c:url>
							<a href="${ pagination }">${ p }</a> &nbsp;
						</c:if>
					</c:forEach>
					
					<!-- [다음] -->
					<c:if test="${ pi.currentPage >= pi.maxPage }">
						[다음]
					</c:if>
					<c:if test="${ pi.currentPage < pi.maxPage }">
						<c:url var="after" value="${ loc }">
							<c:if test="${ search.searchValue ne null }">
								<c:param name="searchCondition" value="${ search.searchCondition }"/>
								<c:param name="searchValue" value="${ search.searchValue }"/>
							</c:if>
							<c:param name="page" value="${ pi.currentPage + 1 }"/>
						</c:url>
						<a href="${ after }">[다음]</a>
					</c:if>
                </div>
                <br>

                <div id="searchArea" align="center">
                	<form action="anSearch.do" name="searchCondition">
	                    <select id="searchCondition" name="searchCondition" style="width:50px;">
	                    	
	                        <option value="all" 
	                        <c:if test="${ nSearch.searchCondition == 'all' }">selected
	                        </c:if>>
	                        	전체
	                        </option>
	                        
	                        <option value="title"
	                        <c:if test="${ nSearch.searchCondition == 'title' }">selected
	                        </c:if>>
	                        	제목
	                        </option>
	                        <option value="content"
	                        <c:if test="${ nSearch.searchCondition == 'content' }">selected
	                        </c:if>>	
	                        	내용
	                        </option>
	                    </select>
	                    <input name="searchValue" type="search" value="${ search.searchValue }" style="width:300px;">
	                    <button class="btn-ghost gray" id="searchBtn">검색</button>
                    </form>
                </div>
                
            </div>
            
        </section>

    </div>
    
    <c:import url="../common/footer.jsp"/>
</body>
</html>