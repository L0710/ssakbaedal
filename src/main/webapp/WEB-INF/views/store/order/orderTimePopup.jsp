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
        }
        .btn-ghost.blue {
            background: transparent;
            border: 2px solid rgb(98, 145, 231);
            border-radius: 8px;
            color: rgb(98, 145, 231);
            text-decoration: none;
            -webkit-transition-duration: 0.4s;
            /* Safari */
            transition-duration: 0.4s;
        }


        .btn-ghost.red {
            background: transparent;
            border: 2px solid rgb(231, 113, 98);
            border-radius: 8px;
            color: rgb(231, 113, 98);
            text-decoration: none;
            -webkit-transition-duration: 0.4s;
            /* Safari */
            transition-duration: 0.4s;
        }


        #big, #closeBtn {
            width: 150px;
        }

        .btn-ghost.green {
            background: transparent;
            border: 2px solid rgb(130, 180, 127);
            border-radius: 8px;
            color: rgb(130, 180, 127);
            text-decoration: none;
            -webkit-transition-duration: 0.4s;
            transition-duration: 0.4s;
        }

        .btn-ghost.green:hover {
            background-color: rgb(130, 180, 127);
            color: white;
        }

    </style>
    <script>
        function change() {
          if(document.get)  {
              document.getElementById("10min").style.backgroundColor("rgb(98, 145, 231)");

          } 
        }
    </script>
</head>
<body align="center">
    <h1>배달예상시간</h1>
    <button id="10min" class="btn-ghost blue" value="10" onclick="change();">10분</button>
    <button id="20min" class="btn-ghost blue" value="20" onclick="change();">20분</button><br>
    <button id="30min" class="btn-ghost blue" value="30" onclick="change();">30분</button>
    <button id="40min" class="btn-ghost blue" value="40" onclick="change();">40분</button><br>
    <button id="50min" class="btn-ghost red" value="50" onclick="change();">50분</button>
    <button id="60min" class="btn-ghost red" value="60" onclick="change();">60분</button><br>
    <button id="over" class="btn-ghost red" id="big" value="90" onclick="change();">60분 + α</button><br>
    <button class="btn-ghost green" id="closeBtn">배달호출</button><br>
    <!-- <input type="text"> -->
</body>
</html>