<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>             
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
  <link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic&display=swap" rel="stylesheet">
    <script
  src="https://code.jquery.com/jquery-3.5.1.js"
  integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc="
  crossorigin="anonymous"></script>
    <style>
        * {
            font-family: 'Nanum Gothic', sans-serif;
        }

        header,
        section,
        aside,
        footer {
            box-sizing: border-box;
            display: block;
        }

        body {
            width: 1200px;
            height: 800px;
            margin: auto;
        }

        header {
            width: 100%;
            height: 20%;
        }

        section {
            width: 85%;
            height: 60%;
            float: left;
        }

        aside {
            width: 15%;
            height: 60%;
            float: left;
        }

        footer {
            width: 100%;
            height: 20%;
            border-top: 3px solid rgb(192, 211, 192);
            margin: auto;
            margin-top: 1%;
            margin-bottom: 1%;
            padding-top: 2%;
            padding-bottom: 1%;
            text-align: center;
            font-size: 12px;
            float: left;
        }

        nav {
            padding: 24px;
            text-align: center;
            background: rgb(64, 64, 64);
        }

        table {
            border-collapse: collapse;
            background-color: white;
            width: 80%;
            overflow: hidden;
            border-radius: 5px;
        }

        th,
        td {
            font-family: 'Motnserrat', sans-serif;
            text-align: center;
            font-size: 12px;
            padding: 10px;
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

        .btn-ghost.blue {
            background: transparent;
            border: 2px solid rgb(117, 182, 219);
            border-radius: 8px;
            color: rgb(117, 182, 219);
            text-decoration: none;
            -webkit-transition-duration: 0.4s;
            /* Safari */
            transition-duration: 0.4s;
        }

        .btn-ghost.blue:hover {
            background-color: rgb(117, 182, 219);
            color: white;
        }

        .link {
            transition: 0.3s ease;
            background: rgb(64, 64, 64);
            color: #ffffff;
            font-size: 15px;
            text-decoration: none;
            border-top: 4px solid rgb(64, 64, 64);
            border-bottom: 4px solid rgb(64, 64, 64);
            padding: 20px 0;
            margin: 0 20px;
        }

        .link:hover {
            border-top: 4px solid #ffffff;
            border-bottom: 4px solid #ffffff;
            padding: 6px 0;
        }

        .logoArea {
            margin-top: 1%;
        }

        .sidemenu {
            width: 150px;
            position: fixed;
            top: 200px;
            left: 1150px;
            margin-top: 50px;
        }

        .contents {
            margin-top: 1%;
            padding: 3%;
            border: 1px solid rgb(130, 180, 127);
            height: 100%;
        }

        .btnGroup {
            margin-top: 1%;
        }

        #logo {
            width: 100%;
            height: 200px;
        }

        nav a:hover {
            text-decoration: none;
            color: white;
        }

        #menubar {
            text-decoration: none;
            list-style: none;
            font-size: 20px;
            font-weight: bold;
            padding: 0;
        }

        #menubar li {
            background-color: rgb(64, 64, 64);
            width: 150px;
            height: 40px;
            text-align: center;
            padding-top: 15px;
            color: white;
        }

        #menubar li:hover {
            background-color: rgb(130, 180, 127);
            width: 150px;
            height: 40px;
            text-align: center;
            padding-top: 15px;
            color: white;
        }

        #orderTitle {
            font-size: 25px;
            font-weight: bold;
        }

        .label {
            font-size: 15px;
        }

        #oaddress, #clienttel, #daddress {
            width: 400px;
            border: none;
            margin-bottom: 10px;
            margin-left:10%;
        } 

        #require {
            height: 80px;
            width: 900px;
            margin-top: 10px;
            margin-bottom: 10px;
        }

        #time {
            height: 20px;
            margin-right: 90px;
        }

        #pick {
            text-decoration: none;
            color: rgb(130, 180, 127);
        }

        #pick:hover {
            text-decoration: none;
            color:white;
        }
    </style>

</head>
<body onunload="opener.close();">
    <div class="wrapper">
    
                 	<c:import url="../../common/headerbar.jsp"/>

        <section>
            <c:import url="../../common/nav_store.jsp"/>


            <div class="contents" align="center">
                <p id="orderTitle">주문관리</p>
                <div align="left">
                    <label for="oaddress" class="label">주소</label><input type="text" id="oaddress" value="${sorder.oAddress }"  readonly><br><br>
                    <label for="clienttel"class="label">전화번호</label><input type="text" id="clienttel" value="${sorder.mPhone }" readonly>
                </div>
                <div align="center"><br><br>
                 <table id="orderTable" align="center">
                		 <tr>
                            <th>메뉴이름</th>
                            <th>수량</th>
                            <th>가격</th>
                        </tr>
                	<c:forEach var="sod" items="${ sod }">
                        <tr>
                            <td>${ sod.mnName }</td>
                            <td>${ sod.odNum }</td>
                            <td>${ sod.odPrice }</td>
                        </tr>
                   	</c:forEach>
                        <tr>
                            <td colspan="2">배달팁</td>
                            <td colspan="2">${sorder.deliveryCharge}</td>
                        </tr>
                        <tr>
                            <td colspan="2">총가격</td>
                            <td>${sorder.oPrice }</td>
                        </tr>
                  </table>
                    
                    <div align="left">
                        <label for="require" class="label" >요청사항</label><br>
                        <input type="text" id="require" value="${sorder.request}" >
                    </div>
                    <div align="center">
                    <c:choose>
                    	<c:when test="${sorder.oStatus == 1}">
                    		 <button class="btn-ghost green" id="pickupBtn1" onclick="time_popup();">주문접수</button> 
                    	</c:when>
                    	<c:when test="${sorder.oStatus == 2 || sorder.oStatus == 3 }">
                    		 <button style="background-color:rgb(130, 180, 127); color:white;" class="btn-ghost green" id="pickupBtn1" onclick="time_popup();" disabled >주문접수</button> 
                    	</c:when>
                    </c:choose>
                        <label for="time">예상시간 : </label><input type="text" id="time" name="time" value="${sorder.arrivalTime}" readonly>
                        <c:if test="${sorder.arrivalTime == null}">
                        	 <button class="btn-ghost blue" id="pickupBtn2"  disabled>매장픽업</button>
                        </c:if>
                        <c:if test="${sorder.arrivalTime != null }">
                        	  <button class="btn-ghost blue" id="pickupBtn2" style="background-color:rgb(117, 182, 219); color:white;" disabled>매장픽업</button>
                        </c:if>
                    </div>
                </div>
            </div>
<script>
    function time_popup() {
    	var oNo = ${sorder.oNo};
    	console.log(oNo);

			window.open("${contextPath}/orderTimePopup.do?oNo="+oNo, "배달예상시간", "width=400,height=500,left=400,top=100");
        
    }
    
    
     function win() {
    		 $("input[type=text][name=time]").val(${sorder.arrivalTime});
   } 
     
     $("#pickupBtn2").click(function() {
    	 var oNo = ${sorder.oNo};
    	 $.ajax({
    		 url:"updateoStatus2.do",
    		 data:{oNo:oNo},
    		 success:function(data) {
				console.log(data);
    		 },
    		 error:function(e) {
    			 console.log(e);
    		 }
    	 });
     });
     
     
    
   	
    
    
    
    
</script>




    </div>
    </section>

    </section>

    </div>
    <br><br><br><br><br><br>

  	<c:import url="../../common/footer.jsp"/>
    </div>
</body>
</html>