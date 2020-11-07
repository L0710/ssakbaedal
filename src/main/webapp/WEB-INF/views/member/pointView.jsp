<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<script
  src="https://code.jquery.com/jquery-3.5.1.js"
  integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc="
  crossorigin="anonymous"></script>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ssakbaedal</title>
<style>
	        .groupBtn {
            margin-top: 100px;
        }

 


        #all-wrapper {
            width: 100%;
            height: 80%;
    
        }

        #info-wrapper{
            width: 100%;
            height: 20%;
            margin-top: 50px;
            margin-left: 20px;
        } 

        #name_img {
            width: 10%;
            height: 100%;
            margin-left: 100px;
            float: left;
        }

        #se{
            width: 60%;
            height: 100%;
        }

        #level-wrapper {
            width: 100%;
            height: 50%;
            margin-left:250px;
        }

        #sum_point {
            width: 500px;
            /* height: 50%; */
            font-size: 16px;
            font-weight: bold;
            margin-left: 20px;
            float: left;
        }

        #levelbar-wrapper {
            width: 100%;
            height: 20%;
            float: left;
            margin-left: 150px;
            margin-top: 50px;
        }

        #userimg {
            width: 100px;
        }

        #userName{
            background-color: white;
            border: none;
            font-size: 25px;
            color: black;
            margin-top: 10px;
            width: 100px;
            font-weight: bold;
            text-align:center;
        }

        #level-wrapper p{
            font-size: 16px;
            float: left;
            margin-right: 10px;
            margin-top: 20px;
            font-weight: bold;
        }

        #level-img1{
            width: 50px;
            float: left;
            margin-right: 20px;
        }

        #level-img2 {
            width: 50px;
            float: left;
            margin-right: 20px;
        }

        #psum, #ppoint{
            float: left;
            margin-left: 20px;
            margin-right: 20px;
        }

        #imgwra {
            width: 1000px;
            float: left;
            margin-top: 50px;
        }

        #level_img1{
            width: 100px;
            float: left;
            margin-left: 200px;
        }

        #level_img2{
            width: 100px;
            margin-right: 170px;
            float: left;
        }

        #range {
            margin-top: 40px;
            margin-right: 10px;
            margin-left: 10px;
            float: left;
        }

        input[type=range] { 
        -webkit-appearance: none; 
        overflow: hidden; 
        width: 40%; 
        height: 10px; 
        background: transparent; 
        cursor: pointer; 
        background: #e5e4e3; 
        border-radius: 0; 
    } 
    
    input[type=range]:focus { 
        outline: none;
    }

    input[type=range]::-webkit-slider-thumb { 
        -webkit-appearance: none;
        width: 10px;
        height: 10px;
        background: #fff; 
        box-shadow: -100vw 0 0 100vw rgba(138, 206, 61, 0.596);
        border: 0.1px solid rgba(138, 206, 61, 0.596);
        cursor: pointer;
     }

        
        nav a:hover {
            text-decoration: none;
            color: rgb(130, 180, 127);

        }

        #intro p{
            text-align: left;
            margin-left: 150px;
        }
        
        #result {
        	text-align:center;
        	font-size:15px;
	      	border:none;
        	color:palevioletred;
        	width:120px;
        	margin:0 auto;
        	font-weight:bold;
        }
        
        #intro {
        	margin-top:50px;
        	margin-bottom:20px;
        }
</style>
</head>
<body>
	<div class="wrapper">
        <c:import url="../common/headerbar.jsp"/>
    
        <section id="section">
        	<!-- 로그인했을시 유저에 따른 내비 보여주기 -->
        	<!-- 관리자 -->
        	<c:if test="${ !empty loginUser && loginUser.mId eq 'admin' }">
        		<c:import url="../common/nav_admin.jsp"/>
			</c:if>
			<!-- 일반유저 -->
			<c:if test="${ !empty loginUser && loginUser.mId ne 'admin' }">
				<c:import url="../common/nav_user.jsp"/>
			</c:if>
			
                <div class="contents">
                        <div id="all-wrapper">
                                <div id="info-wrapper">
                                    <div id="name_img" align="center">
                                        <div id="img-wrapper"><img src="${contextPath}/resources/img/cutlery.png" id="userimg"></div>
                                        <div id="name-wrapper"><input type="text" type="text" id="userName" value="${loginUser.mName}" readonly></div>
                                    </div>
                                        <div id="level-wrapper">
                                        
                                        <input type="hidden" id="cal" value="${loginUser.priceSum }">
                                        
                                        <c:choose>
                                        	<c:when test="${loginUser.mGrade eq 'BRONZE' }">
                                        		<p style="margin-right:30px">현재 레벨은</p> <p style="font-size:10px; color:rgb(184, 132, 20); ">(브론즈)</p> 
	                                            <div><img id="level-img1"  src="${contextPath}/resources/img/coin.png" ></div>
	                                            <p style="margin-right:30px">이고 다음 레벨 </p><p style="font-size:10px; color:silver; ">(실버)</p> 
	                                            <div><img id="level-img2"  src="${contextPath}/resources/img/gold-ingots.png" ></div>
	                                            <p>까지</p>
	                                            <p style="color:palevioletred"><fmt:formatNumber value="${cal.difference}" type="number"/>원</p>
	                                            <p>남았습니다.</p>
                                        	</c:when>
                                        	
                                        	<c:when test="${loginUser.mGrade eq 'SILVER' }">
                                        		<p style="margin-right:30px">현재 레벨은 </p>  <p style="font-size:10px; color:silver; ">(실버)</p> 
	                                            <div><img id="level-img1"  src="${contextPath}/resources/img/gold-ingots.png" ></div>
	                                            <p style="margin-right:30px">이고 다음 레벨 </p><p style="font-size:10px; color:gold; ">(골드)</p> 
	                                            <div><img id="level-img2"  src="${contextPath}/resources/img/diamond.png" ></div>
	                                            <p>까지</p>
	                                            <p style="color:palevioletred"><fmt:formatNumber value="${cal.difference}" type="number"/>원</p>
	                                            <p>남았습니다.</p>
                                        	</c:when>
                                        	
                                        	<c:otherwise>
                                        		<p style="margin-right:30px">현재 레벨은 </p>  <p style="font-size:10px; color:silver; ">(골드)</p> 
	                                            <div><img id="level-img1"  src="${contextPath}/resources/img/gold-ingots.png" ></div>
	                                            <p>축하드립니다. 최고레벨 입니다.</p>
                                        	</c:otherwise>
                                        </c:choose>
                                            
                                        </div>
                                        <br>
                                        <div id="sum_point" align="center">
                                            <p id="psum" >누적금액    <fmt:formatNumber value="${cal.priceSum}" type="number"/>원</p>
                                            <p id="ppoint">누적 포인트    ${loginUser.point}</p>
                                        </div>
                                </div>
                                    <div id="imgwra" align="center" style="margin-bottom:30px;">
                                    <c:if test="${loginUser.mGrade eq 'BRONZE' }">
                                    	<div id="wrapimg1"><img id="level_img1" src="${contextPath}/resources/img/dollar.png"></div>
                                    	<input type="range" id="range" min="0" max="500000" step="1000" value="${cal.priceSum}" disabled>
                                   		<div id="wrapimg2"><img id="level_img2" src="${contextPath}/resources/img/diamond.png"></div>
                                    </c:if>
                                    <c:if test="${loginUser.mGrade eq 'SILVER' }">
                                    	<div id="wrapimg1"><img id="level_img1" src="${contextPath}/resources/img/dollar.png"></div>
                                    	<input type="range" id="range" min="0" max="1000000" step="1000" value="${cal.priceSum}" disabled>
                                   		<div id="wrapimg2"><img id="level_img2" src="${contextPath}/resources/img/diamond.png"></div>
                                    </c:if>   
                                    </div>
       
                                    <div align="center" id="intro" align="center">
                                        <table width="700px" height="100px" class="table"  style="text-align:center;">
                                            <tr>
                                                <th>등급</th>
                                                <th>누적금액</th>
                                                <th>포인트지급</th>
                                            </tr>
                                            <tr>
                                                <td>브론즈</td>
                                                <td>500000미만</td>
                                                <td>한달에 한번 1000원 쿠폰</td>
                                            </tr>
                                            <tr>
                                                <td>실버</td>
                                                <td>500000~1000000미만</td>
                                                <td>한달에 두번 2000원 쿠폰</td>
                                            </tr>
                                            <tr>
                                                <td>골드</td>
                                                <td>1000000이상</td>
                                                <td>한달에 세번 3000원 쿠폰</td>
                                            </tr>
                                        </table>
                                        
                                        <p style="margin-top:30px;">
                                            -포인트 지급은 레벨마다 상이합니다. 자세한 사항은 표를 참고해주세요.<br>
                                            -적립된 포인트는 1000p부터 100점씩 사용가능합니다.<br>
                                            -적립된 포인트 사용 시 사용하신 포인트 만큼의 포인트를 차감합니다.<br>
                                            -포인트 사용은 결제 시 선택 가능합니다.<br>
                                            -포인트 적립은 이벤트에서 가능합니다.<br>
                                            -포인트 적립과 사용은 회원만 가능합니다.<br>
                                        </p>
                                    </div>
                                    

                            </div>

                </div>
                
                
        </section>
        
        <c:import url="../common/sidemenu_user.jsp"/>

    </div>


    <c:import url="../common/footer.jsp"/>
</body>

		<script>
			$(function() {
				cal();
			})
		

			function cal() {
				
					var cal = $("#cal").val();
					var re = 0;
					var result = 0;
					if(cal < 500000) {
						re = 500000;
						result = re - cal;
						console.log(result);
					} else if (cal >= 500000 && cal < 1000000 ) {
						re = 1000000;
						result = re - cal;
						console.log(result);
					} else {
						result = 0;
					}	 
					console.log(result);
			        $("#result").val(result);
			    };
			
		</script>
		
		
</html>