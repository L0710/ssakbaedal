<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
        
        .contents {
            margin-top: 1%;
            padding: 3%;
            border: 1px solid lightgray;
            height: 100%;
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
        
        #notice_table tr:hover {
            cursor: pointer;
            background: rgba(130, 180, 127, 0.1);
        }
        
        #asdf{
            width: 100%;
            height: 50px;
            text-align: center;
        }
        
        .btn-ghost.gray.si {
    		width: 150px;
    		height: 40px;
    		padding-top: 5px;
		}
		
		.sidemenu {
            width: 150px;
            position: fixed;
            top: 230px;
            /* left: 1230px; */
            margin-left: 1035px;
            margin-top: 50px;
        }
        
</style>

</head>
<body>
	
	<div class="wrapper">
		<c:import url="../common/headerbar.jsp"/>
	
		<section>
			<jsp:include page="../common/nav_store.jsp" />
			
			<div class="contents">
				<div id="asdf">
					<h1>공지사항</h1>
                </div>
            	<br>
                <br>
                <table id="notice_table" align="center">
                    <tr>
                        <th width="10%">NO</th>
                        <th>제목</th>
                        <th width="15%">작성자</th>
                        <th width="15%">작성일</th>
                    </tr>
                    
                    <c:forEach var="sn" items="${ snlist }">
						<c:url var="sndetail" value="snDetail.do">
							<c:param name="nId" value="${ sn.nId }"/>
							<c:param name="page" value="${ pi.currentPage }"/>
							<c:param name="searchCondition" value="${ search.searchCondition }"/>
							<c:param name="searchValue" value="${ search.searchValue }"/>
						</c:url>
                    	
	                    <tr onclick="location.href='${contextPath}/${ sndetail }'">
	                        <td>${ sn.nId }</td>
	                        <td>${ sn.nTitle }</td>
	                        <td>${ sn.nWriter }</td>
	                        <td>${ sn.nCreateDate }</td>
	                    </tr>                    
                    </c:forEach>

                </table>
                <br>
                <br>

                <div class="pagingArea" align="center" style="font-size:14px;">
                
                	<!-- 검색 후 페이징 처리에 대한 수정 -->
					<!-- 검색한 값이 있는지 없는지 여부에 따라 넘어갈 주소값을 결정함 -->
					<c:if test="${ search.searchValue eq null }">
						<!-- 검색한 값이 없으면 selectList.bo 호출 -->
						<c:set var="loc" value="/snlist.do" scope="page"/>
					</c:if>
					<c:if test="${ search.searchValue ne null }">
						<!-- 검색한 값이 있으면 search.bo 호출 -->
						<c:set var="loc" value="/snSearch.do" scope="page"/>
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
                	<form action="snSearch.do" name="searchCondition">
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
		<div class="sidemenu">
        	<button class="btn-ghost gray si" onclick="location.href='${contextPath}/menuSetting.do'">메뉴관리</button>
        	<button class="btn-ghost gray si" onclick="location.href='${contextPath}/openSetting.do'">영업관리</button>
        	<button class="btn-ghost gray si" onclick="location.href='${contextPath}/storeManage.do'">매장관리</button>
        	<button class="btn-ghost gray si" onclick="location.href='${contextPath}/snlist.do'">매장공지</button>
    	</div>
		
	</div>
	
	<c:import url="../common/footer.jsp"/>

</body>
</html>