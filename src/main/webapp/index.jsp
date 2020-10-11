<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic&display=swap" rel="stylesheet">
<title>ssakbaedal</title>
<script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
<style>
        * {
        font-family: 'Nanum Gothic', sans-serif;
        margin: 0;
        padding: 0;
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

    header {
        width: 100%;
        height: 20%;
    }

    section {
        width: 100%;
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

    th, td {
        font-family:'Motnserrat',sans-serif;
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
        margin-top: 100px;
    }

    .contents {
        margin-top: 1%;
        /*padding: 3%;*/
        /*border: 1px solid lightgray;*/
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

    #search_area {
        height: 50px;
    }

    #searchValue {
        height: 40px;
        width: 280px;
        background-color: white;
        font-size: 15px;
        margin-top: 5px;
        margin-left: 37%;
    }

    li {
            list-style: none;
        }

        .slide_wrapper {
            position: relative;
            width: 960px;
            margin: 0 auto;
            margin-top: 10px;
            height: 200px;
            overflow: hidden;
            /*border: 1px solid lightgray;*/
            border-bottom: none;
        }

        .slides {
            position: absolute;
            left: 0;
            top: 0;
            transition: left 0.5s ease-out;
        }

        .slides li:not(:last-child) {
            float: left;
            margin-right: 30px;
        }

        .slides li p {
            font-family:'Motnserrat',sans-serif;
        }

        .slides li {
            overflow: hidden;
            transition:transform 1s;
        }

        .slides li:hover{
            transform:scale(1.05);
            cursor: pointer;
        }

        .controls {
            text-align: center;
            margin-left: 119px;
            width: 960px;
            /*border: 1px solid lightgray;*/
            border-top: none;
        }

        #main_title{
            width: 100%;
            height: 100px;
        }


        #prev{
            border-radius: 50%;
        }

        #next{
            border-radius: 50%;
        }

        #event_re_rank_container{
            /*border: 1px solid lightgray;*/
            margin-left: 119px;
            margin-top: 40px;
            width: 960px;
            /*height: 351px;*/
            height: 595px;
        }

        #recommend_area{
            margin-top: 10px;
            margin-left: 10px;
            width: 400px;
            height: 330px;
            float: left;
        }

        #rank_area{
            margin-top: 10px;
            margin-left: 549px;
            width: 400px;
            height: 330px;
        }

        .main_title{
            width: 400px;
            height: 30px;
            font-family:'Motnserrat',sans-serif;
        }

        .main_recommend_rnak_img_area{
            margin-top: 10px;
            width: 400px;
            height: 300px;
            transition:transform 1s;
        }

        .main_recommend_rnak_img_area:hover{
            cursor: pointer;
            transform:scale(1.02);
        }

        #event_area{
            margin-top: 30px;
            margin-left: 10px;
            width: 937px;
            height: 210px;
        }

        #main_event_img_area{
            margin-top: 10px;
            width: 937px;
            height: 170px;
            transition:transform 1s;
        }

        #main_event_img_area:hover{
            cursor: pointer;
            transform:scale(1.02);
        }

    </style>
</head>
<body>
	<div class="wrapper">
        <header>
            <div id="address" align="left">
                <button class="btn-ghost gray" id="mypageBtn">현재주소</button>
                <input id="addtxt" type="text" placeholder="주소입력">
            </div>
            <div class="btnGroup" align="right">
                <button class="btn-ghost green" id="mypageBtn">로그인/회원가입</button>
            </div>
            <br>
            <div class="logoArea">
                <img src="./resources/img/logo.png" id="logo">
            </div>
        </header>
        <br>
        <section>
            <div class="contents">
                <form action="#" name="#" method="GET">
                    <div id="search_area">
                        <input id="searchValue" type="search" name="searchValue" placeholder=" 먹고 싶은 메뉴, 가게 검색">
                        <button type="submit" id="search_btn" class="btn-ghost gray">검색</button>
                    </div>
                </form>

                <div class="slide_wrapper" align="center">
                    <ul class="slides">
                        <li>
                            <img src="./resources/img/total22.jpg" alt="">
                            <p>전체보기</p>
                        </li>
                        <li>
                            <img src="./resources/img/koreanfood6.jpg" alt="">
                            <p>한식</p>
                        </li>
                        <li>
                            <img src="./resources/img/chinafood2.jpg" alt="">
                            <p>중식</p>
                        </li>
                        <li>
                            <img src="./resources/img/japanfood2.jpg" alt="">
                            <p>일식/돈까스</p>
                        </li>
                        <li>
                            <img src="./resources/img/westernfood2.jpg" alt="">
                            <p>양식/피자</p>
                        </li>
                        <li>
                            <img src="./resources/img/0330020014461.jpg" alt="">
                            <p>치킨</p>
                        </li>
                        <li>
                            <img src="./resources/img/fastfood2.jpg" alt="">
                            <p>패스트푸드</p>
                        </li>
                        <li>
                            <img src="./resources/img/dosirak2.jpg" alt="">
                            <p>도시락</p>
                        </li>
                        <li>
                            <img src="./resources/img/boonsik2.png" alt="">
                            <p>분식</p>
                        </li>
                        <li>
                            <img src="./resources/img/cafe2.jpg" alt="">
                            <p>카페/디저트</p>
                        </li>
                    </ul>
                </div>
                <p class="controls">
                    <button class="btn-ghost gray" id="prev" onclick="prev();">prev</button>
                    <button class="btn-ghost gray" id="next" onclick="next();">next</button>
                </p>

                <div id="event_re_rank_container">
                    <div id="recommend_area">
                        <div class="main_title">
                            <h1>추천</h1>
                        </div>
                        <div class="main_recommend_rnak_img_area">
                            <img src="./resources/img/recommend.png" width="400px" height="300px">
                        </div>
                    </div>

                    <div id="rank_area">
                        <div class="main_title">
                            <h1>랭크</h1>
                        </div>
                        <div class="main_recommend_rnak_img_area">
                            <img src="./resources/img/rank.png" width="400px" height="300px">
                        </div>
                    </div>

                    <div id="event_area">
                        <div class="main_title">
                            <h1>이벤트</h1>
                        </div>
                        <div id="main_event_img_area">
                            <img src="./resources/img/event123.PNG" width="937px" height="170">
                        </div>
                    </div>
                    
    
                </div>
                
            </div>
        </section>
        <br><br>


    </div>
    <br><br>
    <footer>

        <a href="#">이용약관</a> &nbsp;&nbsp;&nbsp;
        <a href="#">개인정보처리방침</a> &nbsp;&nbsp;&nbsp;
        <a href="#">고객센터</a>
        <br><br>
        <p>
            싹배달 | 대표자 : 이승근/임한나/이소현/안수연 공동<br><br>
            사업자 주소 : 서울특별시 강남구 테헤란로 10길 9 그랑프리 빌딩 4F, 5F, 7F<br><br>
            Copyright © 2020- SSAKBAEDAL All Rights Reserved
        </p>
    </footer>

    <script>
        var slides = document.querySelector(".slides"),
            slide = document.querySelectorAll(".slides li"),
            currentIdx = 0,
            slideCount = slide.length,
            prevBtn = document.querySelector(".prev"),
            slideWidth = 300,
            slideMargin = 30,
            nextBtn = document.querySelector(".next");

            slides.style.width = (slideWidth + slideMargin) * slideCount - slideMargin + 'px';

        function moveSlide(num) {
            slides.style.left = -num * 330 + 'px';
            currentIdx = num;
        }
        

        function next(){
            if(currentIdx < slideCount - 3){
                moveSlide(currentIdx + 1);
                console.log(currentIdx)
            }else{
                moveSlide(0);
            }
        };

        function prev(){
            if(currentIdx > 0){
                moveSlide(currentIdx - 1);
                console.log(currentIdx)
            }else{
                moveSlide(slideCount - 3);
            }
        };

    </script>

</body>
</html>