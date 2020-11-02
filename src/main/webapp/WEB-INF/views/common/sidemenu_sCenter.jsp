<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
		button {
            cursor: pointer;
            margin: 3px;
            padding: 10px 20px;
            outline: 0; /* 버튼 클릭시 테두리 생성하지 않게함.*/
        }
        
        #goFAQ {
        	width: 150px;
        }
        
        #goRequire {
        	width: 150px;
        }
        
        #goNotice {
        	width: 150px;
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
        
        .sidemenu {
            width: 150px;
            position: fixed;
            top: 200px;
            /*left: 1290px;*/
            margin-left: 12.5px;
            margin-top: 100px;
        }
        
</style>

</head>
<body>

	<div class="sidemenu">
    	<button class="btn-ghost gray" id="goFAQ" onclick="location.href='service.do'">FAQ</button>
    	<button class="btn-ghost gray" id="goNotice" onclick="location.href='tnlist.do'">공지사항</button>
    	<button class="btn-ghost gray" id="goRequire">1:1문의하기</button>
	</div>
	
</body>
</html>