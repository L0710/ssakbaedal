<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FindId</title>
    <style>
    /* 공통,div css */
    *:focus{
        outline: none; 
    }
    #id_find_div{
        border: 2px solid  rgb(130, 180, 127);
        padding: 10px;
        margin: auto;
        min-width: 400px;
        width: 50%;
        height: 50%;
        text-align: center;
    }
    /* 버튼 css */
    #find:hover{
        background-color: rgb(64, 64, 64);
    }
    #find{
        display: block;
        border: none;
        border-radius: 5px;
        width: 300px;
        height: 40px;
        margin: 20px auto ;
        letter-spacing: 10px;
        background-color: rgb(130, 180, 127, 0.7);
        color: white;
        font-size: 20px;
    }
    /* input css */
    input{
        display: block;
        width: 300px;
        height: 35px;
        margin: 10px auto ;
        border-radius: 5px;
        border: 1px solid  lightgray;
    }
    </style>
</head>
<body>
    <div id="id_find_div">
        <h1>아이디 찾기</h1>
        <P>본인 확인 완료 시 <br>가입하신 아이디를 일부 알려드립니다.</P>
        <input name="name" type="text" placeholder="이름을 입력해 주세요.">
        <input name="email" type="email" placeholder="이메일을 입력해 주세요.">
        <button id="find">찾기</button>
    </div>
</body>
</html>