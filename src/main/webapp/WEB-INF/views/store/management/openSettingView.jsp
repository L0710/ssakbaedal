<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
    <link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic&display=swap" rel="stylesheet">
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
            border-left: none;
            border-right: none;
            border-top: 1px solid black;
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
            /* border: 1px solid rgb(64, 64, 64);
            border-radius: 20px; */
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

        #goEvent,
        #goRank {
            width: 100%;
        }



        .groupBtn {
            margin-top: 100px;
        }





        #noticeTable {
            margin-top: 60px;
            width: 80%;
            border-spacing: 0;
            text-align: center;
            font-size: 20px;
            margin: 50px auto;
        }

        #noticeTable td,
        #noticeTable th {
            border:none;
            border-top: 1px solid black;
        }

        .payText {
            width: 60%;
            height: 30px;
        }

        #tel {
            text-align: left;
        }

        #address {
            float: left;
            margin-bottom: 7px;
        }

        .btnGroup {
            margin-left: 840px;
        }

        #addtxt {
            height: 25px;
            background-color: white;
            font-size: 15px;
            text-align: center;
        }

        #menubar {
            text-decoration: none;
            list-style: none;
            font-size: 20px;
            font-weight: bold;
            padding: 0;
        }

        .btn-ghost.gray.si {
            width: 150px;
            height: 40px;
            padding-top: 5px;
        }

        #sName {
            font-size: 18px;
            border: none;
            width: 100px;
            margin-bottom: 20px;
        }

        .date{
            width: 150px;
            height: 25px;
            margin-left: 20px;
            margin-bottom: 20px;
        }

        #sStatus  {
            height: 25px;
        }

        #sSaveBtn {
            margin-bottom:20px; 
        }

        #opentTitle {
            font-size: 25px;
            font-weight: bold;
            margin-bottom: 40px;
        }

    </style>
</head>
<body>
    <div class="wrapper">
	<c:import url="../../common/headerbar.jsp"/>

        <section>
	<c:import url="../../common/nav_store.jsp"/>


            <div class="contents" align="center">
                <p id="opentTitle">영업관리</p>
                <input type="text" id="sName" value="매장이름" readonly>
                <select id="sStatus">
                    <option>정상영업</option>
                    <option>하루폐점</option>
                    <option>휴무</option>
                </select>
                <br>
                <span>시작일</span><input type="date" class="date"><br>
                <span>종료일</span><input type="date" class="date"><br>
                <button class="btn-ghost gray" id="sSaveBtn">저장</button>
                <hr>



                <div class="tableWrapper" align="center">
                    <table id="noticeTable">
                        <tr>
                            <th>날짜</th>
                            <th>매장상태</th>
                        </tr>
                        <tr>
                            <td>2020/10/20</td>
                            <td>정상영업</td>
                        </tr>
                        <tr>
                            <td>2020/10/19</td>
                            <td>하루폐점</td>
                        </tr>
                        <tr>
                            <td>2020/10/18</td>
                            <td>
                                휴무<br>
                                2020/10/15~2020/10/18
                            </td>

                        </tr>
                        <tr>
                            <td>2020/10/14</td>
                            <td>정상영업</td>
                        </tr>
                        <tr>
                            <td>2020/10/13</td>
                            <td>정상영업</td>
                        </tr>
                        <tr>
                            <td>2020/10/12</td>
                            <td>정상영업</td>
                        </tr>
                        <tr>
                            <td>2020/10/11</td>
                            <td>정상영업</td>
                        </tr>
                    </table>

                    <div class="pagingArea" align="center" style="font-size:14px;">
                            [이전] [1][2][3][4][5] [다음]
                    </div>
                </div>
            </div>

    </div>

    </section>
    <div class="sidemenu">
        <button class="btn-ghost gray si" onclick="location.href='${contextPath}/menuSetting.do'">메뉴관리</button>
        <button class="btn-ghost gray si" onclick="location.href='${contextPath}/openSetting.do'">영업관리</button>
        <button class="btn-ghost gray si" onclick="location.href='${contextPath}/storeManage.do'">매장관리</button>
        <button class="btn-ghost gray si">리뷰관리</button>
        <button class="btn-ghost gray si">알림</button>
    </div>
    </section>

    </div>
    <br><br><br><br><br><br>

	<c:import url="../../common/footer.jsp"/>


    </div>
</body>
</html>