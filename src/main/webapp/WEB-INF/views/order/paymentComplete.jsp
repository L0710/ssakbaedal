<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ssakbaedal</title>
<style>
	#orderDetail {
        width: 70%;
        border: 1px solid rgb(130, 180, 127);
        padding: 1.5em;
    }

    #deliveryImg {
        width: 100px;
        border-radius: 10px;
    }
</style>
</head>
<body>
	<div class="wrapper">
        <c:import url="../common/headerbar.jsp" />
			<c:set var="time" value="${ payment.pDate }" />
			<fmt:formatDate var="orderTime" type="date" value="${time}"
				pattern="yyyy/MM/dd HH:mm:ss" />
			<fmt:formatDate var="oTime" type="date" value="${time}"
				pattern="yyyyMMddHHmmss" />
        <section>
            <div class="contents" align="center">
                <h1 style="font-size:28px">결제 완료</h1>
                <div id="orderDetail">
                    <br>
                    <h4 style="color:rgb(130, 180, 127)">싹배달을 이용해주셔서 감사합니다.</h4><br>
                    <img src="./resources/img/delivery.png" id="deliveryImg"/><br>
                    <h5>고객님이 주문하신 주문번호는</h5>
                    <h5><label style="color:red; font-family: Arial; font-size: 18px">${ oTime }${ payment.oNo }</label> 입니다.</h5>
                    <br>
                    <h4>주문 내역</h4>
                    <table>
                        <tr>
                            <td style="width:70%">주문번호</td>
                            <td style="text-align:right">${ oTime }${ payment.oNo }</td>
                        </tr>
                        <tr>
                            <td >주문시간</td>
                            <td style="text-align:right">${ orderTime }</td>
                        </tr>
                        <tr>
                            <td>결제금액</td>
                            <td style="text-align:right; color: red">
                            	<fmt:formatNumber value="${ payment.price }" pattern="#,###" />
                            </td>
                        </tr>
                    </table>
                    <br><hr><br>
                    <h4>주문자 정보</h4>
                    <table>
                        <tr>
                            <td style="width:20%">연락처</td>
                            <td style="text-align:right">${ order.oPhone }</td>
                        </tr>
                        <tr>
                            <td>주소</td>
                            <td style="text-align:right">${ order.oAddress }</td>
                        </tr>
                        <tr>
                            <td>요청사항</td>
                            <td style="text-align:right">${ order.request }</td>
                        </tr>
                    </table>
                    <br><br><br>

                    <div id="btnArea">
                    	<c:url var="home" value="home.do"/>
                        <button class="btn-ghost green" id="goMainBtn" onclick="location.href='${ home }'">홈</button>
                    </div>
                </div>
            </div>
        </section>
        <br><br>


    </div>
    
	<c:import url="../common/footer.jsp" />
	
</body>
</html>