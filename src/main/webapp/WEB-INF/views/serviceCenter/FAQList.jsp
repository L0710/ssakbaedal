<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>
        * {
                font-family: 'Nanum Gothic', sans-serif;
            }
        
        header, section, aside, footer{
            box-sizing: border-box;
            display: block;
        }
        
        body{
            width: 1200px;
            height: 800px;
            margin: auto;
        }
        
        section {
            margin-left: 186.8px;
            width: 1013.5px;
            height: 60%;
            float: left; 
        }
        
        #FAQ_table {
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
            outline: 0; /* 버튼 클릭시 테두리 생성하지 않게함.*/
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
        
        .sidemenu {
            width: 150px;
            position: fixed;
            top: 200px;
            /*left: 1290px;*/
            margin-left: 12.5px;
            margin-top: 100px;
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

        #asdf span{
            color: rgb(143,145,142);
        }
        
        #FAQ_table tr:hover {
            cursor: pointer;
            background: rgba(130, 180, 127, 0.1);
        }
        
        #insertBtn {
        	margin-right: 100px;
        }

</style>

</head>
<body>
<div class="wrapper">
        <c:import url="../common/headerbar.jsp"/>
        
        <section>
            <div class="contents" align="center">
                <div id="asdf">
                    <h1>FAQ</h1>
                    <span>자주 묻는 질문</span>
                </div>
                <br>
                <br>
                <table id="FAQ_table" align="center">
                    <tr>
                        <th width="20%">NO</th>
                        <th>제목</th>
                        <th width="20%">작성자</th>
                    </tr>
					
					<c:forEach var="f" items="${ flist }">
						<c:url var="fdetail" value="FAQDetail.do">
							<c:param name="fNo" value="${ f.fNo }"/>
							<c:param name="page" value="${ pi.currentPage }"/>
							<c:param name="searchCondition" value="${ search.searchCondition }"/>
							<c:param name="searchValue" value="${ search.searchValue }"/>
						</c:url>
						<tr onclick="location.href='${contextPath}/${ fdetail }'">
							<td>${ f.fNo }</td>
							<td>${ f.fTitle }</td>
							<td>${ f.fWriter }</td>
						</tr>
					</c:forEach>
					
                </table>
                <br>
                <!-- 관리자만 보이게 함. -->
                <c:if test="${ !empty loginUser && loginUser.mNo == '1' }">
					<div id="insertBtn" align="right">
		            	<button class="btn-ghost green" onclick="location.href='inFAQ.do'">작성</button>
		            </div>
	            </c:if>
	            
                <div class="pagingArea" align="center" style="font-size:14px;">
                
                	<!-- 검색 후 페이징 처리에 대한 수정 -->
					<!-- 검색한 값이 있는지 없는지 여부에 따라 넘어갈 주소값을 결정함 -->
					<c:if test="${ search.searchValue eq null }">
						<!-- 검색한 값이 없으면 selectList.bo 호출 -->
						<c:set var="loc" value="/service.do" scope="page"/>
					</c:if>
					<c:if test="${ search.searchValue ne null }">
						<!-- 검색한 값이 있으면 search.bo 호출 -->
						<c:set var="loc" value="/scSearch.do" scope="page"/>
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
                	<form action="scSearch.do" name="searchCondition">
	                    <select id="searchCondition" name="searchCondition" style="width:50px;">
	                    	
	                        <option value="all" 
	                        <c:if test="${ sc_Search.searchCondition == 'all' }">selected
	                        </c:if>>
	                        	전체
	                        </option>
	                        
	                        <option value="title"
	                        <c:if test="${ sc_Search.searchCondition == 'title' }">selected
	                        </c:if>>
	                        	제목
	                        </option>
	                        <option value="content"
	                        <c:if test="${ sc_Search.searchCondition == 'content' }">selected
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
        
        <c:import url="../common/sidemenu_sCenter.jsp"/>

    </div>
    
    <c:import url="../common/footer.jsp"/>
    
</body>
</html>