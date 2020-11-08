<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
<!DOCTYPE html>
<html>
<head> 
<meta charset="UTF-8">
<title>ssakbaedal</title>
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
        height: 90%;
    }
    /* 버튼 css */
    #find:focus{
        outline: none; 
    }
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
    /* 안내문구 css */
    p{
        display: table;
        width: 375px;
        height: 35px;
        font-size: 15px;
        margin: 2px auto ;

    }
    strong{
    	margin:auto;
    }

    </style>
</head>
<body>
<div id="id_find_div">
        <h1 style="text-align:center;">비밀번호 찾기</h1>
        <p>
	       본인 확인 완료 시 <br>
	       가입하신 이메일로 임시번호를 보내드립니다.<br>
        <strong id="value">로그인 후 마이페이지에서 비밀번호를 수정 해 주세요.</strong>
        </p>
        <input id="mId" name="mId" type="text" placeholder="아이디를 입력해 주세요.">
        <input id="mName" name="mName" type="text" placeholder="이름을 입력해 주세요.">
        <input id="mEmail" name="mEmail" type="email" placeholder="이메일을 입력해 주세요.">
        <button id="find">찾기</button>
    </div>
      <script>
    	 $('#find').on('click', function(){
    	        var mId = $('#mId').val();
    	        var mName = $('#mName').val();
    	        var mEmail = $('#mEmail').val();
    	        
    	        $('#value').text("...............진행중..............");
    	        $('#value').css({"color":"black"});
    	       if(mName!=""||mEmail!=""||mId!=""){
    	        $.ajax({
    	            url: "findPwd.do",
    	            type: "POST",
    	            data: {mId:mId,mName:mName,mEmail:mEmail},
    	            success: function(data){
    	            	if(data=="null"){
    	            		$('#value').text("일치하는 정보가 없습니다.");
    	            		$('#value').css({"color":"red","font-weight":"bold"});
    	            	}else{
    	            		 alert("임시비밀번호가 발송되었습니다.");
    	            		 $('#value').text("");
    	            	}
    	            },
    	            error: function(){
    	                alert("문제가 발생하였습니다.관리자에게 문의해주세요.");
    	            }
    	        });
    	       }else{
    	    	   alert("입력 후 검색해 주세요.");
    	       }
    	    });
      </script>
</body>
</html>