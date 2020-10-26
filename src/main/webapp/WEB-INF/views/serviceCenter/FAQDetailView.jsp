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
            margin-left: 187px;
            width: 1013.5px;
            height: 60%;
            float: left;
        }
        
        .dFAQ_table {
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
            border-top: 1px solid rgb(192, 211, 192);
            border-bottom: 1px solid rgb(192, 211, 192);
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

        .content_td {
            border-right: 1px solid rgb(130, 180, 127);
        }

        #td_button {
            border: 1px solid white;
        }

        #td_title {
            border-right: 1px solid rgb(130, 180, 127);
        }
        
        #asdf{
            width: 100%;
            height: 50px;
            text-align: center;
        }

        #asdf span{
            color: rgb(143,145,142);
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
                
                <table class="dFAQ_table" align="center">
                    <tr>
                        <td id="td_title" width="20%"><strong>제목</strong></td>
                        <td>${ faq.fTitle }</td>
                    </tr>
                </table>

                <table class="dFAQ_table" align="center">
                    <tr>
                        <td class="content_td" width="20%" height="300px"><strong>내용</strong></td>
                        <td>
							${ faq.fContent }
                        </td>
                    </tr>
                    <tr>
                        <td id="td_button" colspan="2">
                            <br>
                            <br>
                            <!-- 검색 후 페이징 처리에 대한 수정 -->
							<!-- 검색한 값이 있는지 없는지 여부에 따라 넘어갈 주소값을 결정함 -->
							<c:if test="${ searchValue eq null }">
								<!-- 검색한 값이 없으면 selectList.bo 호출 -->
								<c:set var="loc" value="/service.do" scope="page"/>
							</c:if>
							<c:if test="${ searchValue ne null }">
								<!-- 검색한 값이 있으면 search.bo 호출 -->
								<c:set var="loc" value="/scSearch.do" scope="page"/>
							</c:if>
                            
                            <c:url var="flist" value="${ loc }">
	                            <c:if test="${ searchValue ne null }">
									<c:param name="searchCondition" value="${ searchCondition }"/>
									<c:param name="searchValue" value="${ searchValue }"/>
								</c:if>
                            	<c:param name="page" value="${ currentPage }"/>
                            </c:url>
                            <button class="btn-ghost gray" onclick="location.href='${ flist }'">목록으로</button>
                            <!-- 관리자만 수정 가능 -->
                            <c:if test="${ !empty loginUser && loginUser.mNo == '1' }">
                            	<c:url var="upFQAView" value="upFAQView.do">
                            		<c:param name="fNo" value="${ faq.fNo }"/>
                            		<c:param name="page" value="${ currentPage }"/>
                            	</c:url>
                            	<c:url var="fdelete" value="FAQDelete.do">
									<c:param name="fNo" value="${ faq.fNo }"/>
								</c:url>
                            	<button class="btn-ghost gray" onclick="location.href='${upFQAView}'">수정하기</button>
                            	<button class="btn-ghost gray" onclick="faqDelete();">삭제하기</button>
                            </c:if>
                        </td>
                    </tr>
                </table>
                
            </div>
            
        </section>
        
        <c:import url="../common/sidemenu_sCenter.jsp"/>

    </div>
    
    <c:import url="../common/footer.jsp"/>
    
    <script>
		function faqDelete(){
			var result = confirm("정말 삭제하시겠습니까?");
			
			if(result == true){
				location.href='${ fdelete }';
			}
		}
	</script>
    
</body>
</html>