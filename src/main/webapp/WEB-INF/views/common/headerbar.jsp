<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8"><meta http-equiv="X-UA-Compatible" content="ie=edge">
<link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic&display=swap" rel="stylesheet">
<title>ssakbaedal</title>
    <style>
        * {
        font-family: 'Nanum Gothic', sans-serif;
    }

    header, section{
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

    .logoArea {
        margin-top: 1%;
    }

    .contents {
        margin-top: 1%;
        padding: 3%;
        border: 1px solid lightgray;
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
    </div>
</body>
</html>