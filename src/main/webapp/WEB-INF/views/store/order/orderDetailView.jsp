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
            margin-right: 20px;
        }

        #address, #clienttel, #daddress {
            margin-right: 20px;
            height: 20px;
            width: 300px;
            border: none;
            margin-bottom: 10px;
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

<script>
    function time_popup() {
        window.open("orderTimePopup.jsp", "배달예상시간", "width=400,height=500,left=400,top=100");
    }
</script>

</head>
<body>
    <div class="wrapper">
    
                 	<c:import url="../../common/headerbar.jsp"/>

        <section>
            <c:import url="../../common/nav_store.jsp"/>


            <div class="contents" align="center">
                <p id="orderTitle">주문관리</p>
                <div align="left">
                    <label for="address" class="label">주소</label><input type="text" id="address" placeholder="서울시 강남구 테헤란로 10길 9" readonly>
                    <label for="daddress" class="label">상세 주소</label><input type="text" id="daddress" placeholder="그랑프리 빌딩 4층 1강의실" readonly><br>
                    <label for="clienttel" class="label">전화번호</label><input type="text" id="clienttel" placeholder="010)1234-5678" readonly>
                </div>
                <div align="center">
                    <table id="orderTable" align="center">
                        <tr>
                            <th>메뉴이름</th>
                            <th>수량</th>
                            <th>가격</th>
                        </tr>
                        <tr>
                            <td>인절미빙수</td>
                            <td>1</td>
                            <td>8900</td>
                        </tr>
                        <tr>
                            <td>애플망고치즈빙수</td>
                            <td>1</td>
                            <td>11900</td>
                        </tr>
                        <tr>
                            <td>바바리안츄러스</td>
                            <td>1</td>
                            <td>2500</td>
                        </tr>
                        <tr>
                            <td>고구마붕어빵</td>
                            <td>1</td>
                            <td>2500</td>
                        </tr>
                        <tr>
                            <td colspan="2">배달팁</td>
                            <td colspan="2">3000</td>
                        </tr>
                        <tr>
                            <td colspan="2">총가격</td>
                            <td>28800</td>
                        </tr>
                    </table>
                    <div align="left">
                        <label for="require" class="label">요청사항</label><br>
                        <!-- <input type="text" id="require" maxlength="500" placeholder="최대150자)단무지 많이 가져다주세요."> -->
                        <textarea id="require" maxlength="300" readonly></textarea>
                    </div>
                    <div align="center">
                        <button class="btn-ghost green" id="pickupBtn" onclick="time_popup();">주문접수</button> 
                        <!-- <a href="com-orderTimepop.html" onclick="window.open(this.href,'_blank',width=400,height=500,toolbars=no); return false;" id="pick">주문접수</a> -->
                        <label for="time">예상시간 : </label><input type="text" id="time">
                        <button class="btn-ghost blue" id="pickupBtn">매장픽업</button>
                    </div>
                </div>


            </div>

    </div>
    </section>

    </section>

    </div>
    <br><br><br><br><br><br>

  	<c:import url="../../common/footer.jsp"/>
    </div>
</body>
</html>