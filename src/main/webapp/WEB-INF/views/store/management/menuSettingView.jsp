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





        #menuTable {
            margin-top: 60px;
            width: 80%;
            border-spacing: 0;
            text-align: center;
            font-size: 20px;
            margin: 50px auto;
        }

        #menuTable td,
        #menuTable th {
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


        nav a:hover {
            text-decoration: none;
            color: rgb(130, 180, 127);

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

        #saveBtn {
            width: 100px;
        }

        #menuTitle {
            font-size: 20px;
            font-weight: bold;
        }

        #menualert {
            margin-left: 100px;
            color: rgb(240, 68, 91);
        }

               .stinfo {
            font-size: 15px;
            margin-left: 30px;
            width: 150px;
            height: 30px;
            margin-top: 30px;
        }

        /* #updateinfo {
            text-align: center;
            margin-top: 10px;
            margin-bottom: 10px;
        } */


        #best, #setMenu, #insertMenu,#sinfo  {
            font-size: 20px;
            font-weight: bold;
        }

        #bestwrapper {
            margin-bottom: 50px;
        }

        .BestMenu {
            margin: 5px;
            font-size: 14px;
            margin-top:40px; 
        }

        #sOff {
            margin-left: 42px;
        }

        #spanwrapper, #setwrapper, #inputwrapper, #bestwrapper{
            margin-left: 40px;
            margin-bottom: 20px;
        }

        .updateMenuname, .updateMenuprice {
            text-align: center;
            width: 130px;
            height: 20px;
        }
        .btn-ghost.gray.si {
            width: 150px;
            height: 40px;
            padding-top: 5px;
        }
    </style>
</head>
<body>
    <div class="wrapper">
    
      	<c:import url="../../common/headerbar.jsp"/>

        <section>
            <c:import url="../../common/nav_store.jsp"/>


            <div class="contents" align="center">
                <p id="menuTitle">품절관리</p>
                <p align="left" id="menualert">
                -메뉴 품절의 체크박스를 체크하면 품절처리 됩니다.<br>
                -메뉴 품절처리는 품절 해제하지 전까지 품절처리 됩니다.<br>
                -하루품절에 체크하면 하루이후에 자동으로 체크가 없어집니다.
                </p>
                <div class="tableWrapper" align="center">
                    <table id="menuTable">
                        <tr>
                            <th>메뉴명</th>
                            <th>가격</th>
                            <th>품절여부</th>
                        </tr>
                        <tr>
                            <td>메뉴1</td>
                            <td>17,500</td>
                            <td>
                                <span>품절</span><input type="checkbox" class="ch">
                                <span>하루품절</span><input type="checkbox" class="chOneDay">
                            </td>
                        </tr>
                        <tr>
                            <td>메뉴1</td>
                            <td>17,500</td>
                            <td>
                                <span>품절</span><input type="checkbox" class="ch">
                                <span>하루품절</span><input type="checkbox" class="chOneDay">
                            </td>
                        </tr>
                        <tr>
                            <td>메뉴1</td>
                            <td>17,500</td>
                            <td>
                                <span>품절</span><input type="checkbox" class="ch">
                                <span>하루품절</span><input type="checkbox" class="chOneDay">
                            </td>
                        </tr>
                        <tr>
                            <td>메뉴1</td>
                            <td>17,500</td>
                            <td>
                                <span>품절</span><input type="checkbox" class="ch">
                                <span>하루품절</span><input type="checkbox" class="chOneDay">
                            </td>
                        </tr>
                        <tr>
                            <td>메뉴1</td>
                            <td>17,500</td>
                            <td>
                                <span>품절</span><input type="checkbox" class="ch">
                                <span>하루품절</span><input type="checkbox" class="chOneDay">
                            </td>
                        </tr>
                        <tr>
                            <td>메뉴1</td>
                            <td>17,500</td>
                            <td>
                                <span>품절</span><input type="checkbox" class="ch">
                                <span>하루품절</span><input type="checkbox" class="chOneDay">
                            </td>
                        </tr>
                        <tr>
                            <td>메뉴1</td>
                            <td>17,500</td>
                            <td>
                                <span>품절</span><input type="checkbox" class="ch">
                                <span>하루품절</span><input type="checkbox" class="chOneDay">
                            </td>
                        </tr>
                        <tr>
                            <td>메뉴1</td>
                            <td>17,500</td>
                            <td>
                                <span>품절</span><input type="checkbox" class="ch">
                                <span>하루품절</span><input type="checkbox" class="chOneDay">
                            </td>
                        </tr>
                        <tr>
                            <td>메뉴1</td>
                            <td>17,500</td>
                            <td>
                                <span>품절</span><input type="checkbox" class="ch">
                                <span>하루품절</span><input type="checkbox" class="chOneDay">
                            </td>
                        </tr>
                        <tr>
                            <td>메뉴1</td>
                            <td>17,500</td>
                            <td>
                                <span>품절</span><input type="checkbox" class="ch">
                                <span>하루품절</span><input type="checkbox" class="chOneDay">
                            </td>
                        </tr>
                        <tr>
                            <td>메뉴1</td>
                            <td>17,500</td>
                            <td>
                                <span>품절</span><input type="checkbox" class="ch">
                                <span>하루품절</span><input type="checkbox" class="chOneDay">
                            </td>
                        </tr>
                    </table>
                </div>
                    <hr>
                    <div id="inputwrapper" align="left">
                        <div style="margin-top:30px;" align="center"><span id="insertMenu">메뉴등록/수정</span></div><br>
                        <span>메뉴명</span><input id="sMenu" class="stinfo"><br>
                        <span>메뉴명</span><select class="stinfo">
                            <option>카테고리1</option>
                            <option>카테고리2</option>
                            <option>카테고리3</option>
                            <option>카테고리4</option>
                        </select><br>
                        <span>파일명</span><input type="text" class="stinfo" ><button class="btn-ghost green">사진등록</button>
                        <button class="btn-ghost gray">+</button>
                        +버튼을 누르면 메뉴 추가
                        <br><br>
                    </div>

                    <div class="tableWrapper" align="center">
                        <table id="menuTable">
                            <tr>
                                <th>메뉴명</th>
                                <th>가격</th>
                                <th>삭제여부</th>
                            </tr>
                            <tr>
                                <td>메뉴1</td>
                                <td>17,500</td>
                                <td>
                                    <span>삭제</span><input type="checkbox" class="ch">
                                </td>
                            </tr>
                            <tr>
                                <td>메뉴1</td>
                                <td>17,500</td>
                                <td>
                                    <span>삭제</span><input type="checkbox" class="ch">
                                </td>
                            </tr>
                            <tr>
                                <td>메뉴1</td>
                                <td>17,500</td>
                                <td>
                                    <span>삭제</span><input type="checkbox" class="ch">
                                </td>
                            </tr>
                            <tr>
                                <td>메뉴1</td>
                                <td>17,500</td>
                                <td>
                                    <span>삭제</span><input type="checkbox" class="ch">
                                </td>
                            </tr>
                            <tr>
                                <td>메뉴1</td>
                                <td>17,500</td>
                                <td>
                                    <span>삭제</span><input type="checkbox" class="ch">
                                </td>
                            </tr>
                            <tr>
                                <td>메뉴1</td>
                                <td>17,500</td>
                                <td>
                                    <span>삭제</span><input type="checkbox" class="ch">
                                </td>
                            </tr>
                            <tr>
                                <td>메뉴1</td>
                                <td>17,500</td>
                                <td>
                                    <span>삭제</span><input type="checkbox" class="ch">
                                </td>
                            </tr>
                            <tr>
                                <td>메뉴1</td>
                                <td>17,500</td>
                                <td>
                                    <span>삭제</span><input type="checkbox" class="ch">
                                </td>
                            </tr>
                            <tr>
                                <td>메뉴1</td>
                                <td>17,500</td>
                                <td>
                                    <span>삭제</span><input type="checkbox" class="ch">
                                </td>
                            </tr>
                            <tr>
                                <td>메뉴1</td>
                                <td>17,500</td>
                                <td>
                                    <span>삭제</span><input type="checkbox" class="ch">
                                </td>
                            </tr>
                            <tr>
                                <td>메뉴1</td>
                                <td>17,500</td>
                                <td>
                                    <span>삭제</span><input type="checkbox" class="ch">
                                </td>
                            </tr>
                        </table>
                    </div>

                    <div class="tableWrapper" align="center">
                        <table id="menuTable">
                            <tr>
                                <th>메뉴명</th>
                                <th>가격</th>
                                <th>수정</th>
                            </tr>
                            <tr>
                                <td><input class="updateMenuname" type="text" placeholder="메뉴이름"></td>
                                <td><input class="updateMenuprice" type="text" placeholder="메뉴가격"></td>
                                <td>
                                    <span>수정</span><input type="checkbox" class="ch">
                                </td>
                            </tr>
                            <tr>
                                <td><input class="updateMenuname" type="text" placeholder="메뉴이름"></td>
                                <td><input class="updateMenuprice" type="text" placeholder="메뉴가격"></td>
                                <td>
                                    <span>수정</span><input type="checkbox" class="ch">
                                </td>
                            </tr>
                            <tr>
                                <td><input class="updateMenuname" type="text" placeholder="메뉴이름"></td>
                                <td><input class="updateMenuprice" type="text" placeholder="메뉴가격"></td>
                                <td>
                                    <span>수정</span><input type="checkbox" class="ch">
                                </td>
                            </tr>
                            <tr>
                                <td><input class="updateMenuname" type="text" placeholder="메뉴이름"></td>
                                <td><input class="updateMenuprice" type="text" placeholder="메뉴가격"></td>
                                <td>
                                    <span>수정</span><input type="checkbox" class="ch">
                                </td>
                            </tr>
                            <tr>
                                <td><input class="updateMenuname" type="text" placeholder="메뉴이름"></td>
                                <td><input class="updateMenuprice" type="text" placeholder="메뉴가격"></td>
                                <td>
                                    <span>수정</span><input type="checkbox" class="ch">
                                </td>
                            </tr>
                            <tr>
                                <td><input class="updateMenuname" type="text" placeholder="메뉴이름"></td>
                                <td><input class="updateMenuprice" type="text" placeholder="메뉴가격"></td>
                                <td>
                                    <span>수정</span><input type="checkbox" class="ch">
                                </td>
                            </tr>
                            <tr>
                                <td><input class="updateMenuname" type="text" placeholder="메뉴이름"></td>
                                <td><input class="updateMenuprice" type="text" placeholder="메뉴가격"></td>
                                <td>
                                    <span>수정</span><input type="checkbox" class="ch">
                                </td>
                            </tr>
                            <tr>
                                <td><input class="updateMenuname" type="text" placeholder="메뉴이름"></td>
                                <td><input class="updateMenuprice" type="text" placeholder="메뉴가격"></td>
                                <td>
                                    <span>수정</span><input type="checkbox" class="ch">
                                </td>
                            </tr>
                            <tr>
                                <td><input class="updateMenuname" type="text" placeholder="메뉴이름"></td>
                                <td><input class="updateMenuprice" type="text" placeholder="메뉴가격"></td>
                                <td>
                                    <span>수정</span><input type="checkbox" class="ch">
                                </td>
                            </tr>
                            <tr>
                                <td><input class="updateMenuname" type="text" placeholder="메뉴이름"></td>
                                <td><input class="updateMenuprice" type="text" placeholder="메뉴가격"></td>
                                <td>
                                    <span>수정</span><input type="checkbox" class="ch">
                                </td>
                            </tr>
                            <tr>
                                <td><input class="updateMenuname" type="text" placeholder="메뉴이름"></td>
                                <td><input class="updateMenuprice" type="text" placeholder="메뉴가격"></td>
                                <td>
                                    <span>수정</span><input type="checkbox" class="ch">
                                </td>
                            </tr>
                        </table>
                    </div>
                    <hr style="margin-bottom:40px;">
                    <div id="bestwrapper" align="left">
                        <div align="center"><span id="best">베스트 메뉴 관리</span></div>
                        <table id="menuTable">
                            <tr>
                                <th>메뉴명</th>
                                <th>가격</th>
                                <th>베스트메뉴</th>
                            </tr>
                            <tr>
                                <td>메뉴1</td>
                                <td>17,500</td>
                                <td>
                                    <span>등록</span><input type="checkbox" class="ch">
                                </td>
                            </tr>
                            <tr>
                                <td>메뉴1</td>
                                <td>17,500</td>
                                <td>
                                    <span>등록</span><input type="checkbox" class="ch">
                                </td>
                            </tr>
                            <tr>
                                <td>메뉴1</td>
                                <td>17,500</td>
                                <td>
                                    <span>등록</span><input type="checkbox" class="ch">
                                </td>
                            </tr>
                            <tr>
                                <td>메뉴1</td>
                                <td>17,500</td>
                                <td>
                                    <span>등록</span><input type="checkbox" class="ch">
                                </td>
                            </tr>
                            <tr>
                                <td>메뉴1</td>
                                <td>17,500</td>
                                <td>
                                    <span>등록</span><input type="checkbox" class="ch">
                                </td>
                            </tr>
                            <tr>
                                <td>메뉴1</td>
                                <td>17,500</td>
                                <td>
                                    <span>등록</span><input type="checkbox" class="ch">
                                </td>
                            </tr>
                            <tr>
                                <td>메뉴1</td>
                                <td>17,500</td>
                                <td>
                                    <span>등록</span><input type="checkbox" class="ch">
                                </td>
                            </tr>
                            <tr>
                                <td>메뉴1</td>
                                <td>17,500</td>
                                <td>
                                    <span>등록</span><input type="checkbox" class="ch">
                                </td>
                            </tr>
                            <tr>
                                <td>메뉴1</td>
                                <td>17,500</td>
                                <td>
                                    <span>등록</span><input type="checkbox" class="ch">
                                </td>
                            </tr>
                            <tr>
                                <td>메뉴1</td>
                                <td>17,500</td>
                                <td>
                                    <span>등록</span><input type="checkbox" class="ch">
                                </td>
                            </tr>
                            <tr>
                                <td>메뉴1</td>
                                <td>17,500</td>
                                <td>
                                    <span>등록</span><input type="checkbox" class="ch">
                                </td>
                            </tr>
                        </table>
                    </div>
                    <hr style="margin-bottom:40px;">
                <div id="setwrapper" align="left">
                    <br>
                    <div align="center"><span id="setMenu">세트 메뉴 관리</span></div>
                    <span>세트이름</span><input type="text" class="stinfo">
                    <table id="menuTable">
                        <tr>
                            <th>메뉴명</th>
                            <th>가격</th>
                            <th>베스트메뉴</th>
                        </tr>
                        <tr>
                            <td>메뉴1</td>
                            <td>17,500</td>
                            <td>
                                <span>선택</span><input type="checkbox" class="ch">
                            </td>
                        </tr>
                        <tr>
                            <td>메뉴1</td>
                            <td>17,500</td>
                            <td>
                                <span>선택</span><input type="checkbox" class="ch">
                            </td>
                        </tr>
                        <tr>
                            <td>메뉴1</td>
                            <td>17,500</td>
                            <td>
                                <span>선택</span><input type="checkbox" class="ch">
                            </td>
                        </tr>
                        <tr>
                            <td>메뉴1</td>
                            <td>17,500</td>
                            <td>
                                <span>선택</span><input type="checkbox" class="ch">
                            </td>
                        </tr>
                        <tr>
                            <td>메뉴1</td>
                            <td>17,500</td>
                            <td>
                                <span>선택</span><input type="checkbox" class="ch">
                            </td>
                        </tr>
                        <tr>
                            <td>메뉴1</td>
                            <td>17,500</td>
                            <td>
                                <span>선택</span><input type="checkbox" class="ch">
                            </td>
                        </tr>
                        <tr>
                            <td>메뉴1</td>
                            <td>17,500</td>
                            <td>
                                <span>선택</span><input type="checkbox" class="ch">
                            </td>
                        </tr>
                        <tr>
                            <td>메뉴1</td>
                            <td>17,500</td>
                            <td>
                                <span>선택</span><input type="checkbox" class="ch">
                            </td>
                        </tr>
                        <tr>
                            <td>메뉴1</td>
                            <td>17,500</td>
                            <td>
                                <span>선택</span><input type="checkbox" class="ch">
                            </td>
                        </tr>
                        <tr>
                            <td>메뉴1</td>
                            <td>17,500</td>
                            <td>
                                <span>선택</span><input type="checkbox" class="ch">
                            </td>
                        </tr>
                        <tr>
                            <td>메뉴1</td>
                            <td>17,500</td>
                            <td>
                                <span>선택</span><input type="checkbox" class="ch">
                            </td>
                        </tr>
                    </table><br>
                    <div align="center"><button class="btn-ghost gray">세트 등록</button></div>
                </div>
                </div>
            </div>
    </div>

    </section>
    <div class="sidemenu">
        <button class="btn-ghost gray si" onclick="location.href='${contextPath}/menuSetting.do'">메뉴관리</button>
        <button class="btn-ghost gray si" onclick="location.href='${contextPath}/openSetting.do'">영업관리</button>
        <button class="btn-ghost gray si" onclick="location.href='${contextPaht}/storeManage.do'">매장관리</button>
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