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
            width: 70%;
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

        #orderTable  {
            margin-top: 60px;
            width: 80%;
            border-spacing: 0;
            text-align: center;
            font-size: 20px;
            margin: 50px auto;
        }

        #orderTable td,
        #orderTable th {
            border: 1px solid black;
        }
        
        #orderTable td:hover{
            cursor: pointer;
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

        #orderTitle {
            font-size: 25px;
            font-weight: bold;
        }

    </style>
</head>
<body>
    <div class="wrapper">
    
        <c:import url="../../common/headerbar.jsp"/>

        <c:import url="../../common/nav_store.jsp"/>


            <div class="contents" align="center">
                <p id="orderTitle">주문관리</p>
                
                <div class="tableWrapper" align="center">
                    <table id="orderTable">
                    <thead>
	                        <tr>
	                            <th>주문시간</th>
	                            <th>주소</th>
	                            <th>주문 메뉴</th>
	                            <th>메뉴 상태</th>
	                            <th>주문번호</th>
	                        </tr>
                        </thead>
                        <tbody>
                        </tbody>
                    </table>

                </div>
            </div>

    </div>
    
    <script>
     	$(function() {
    		orderList(); 
    		
    		setInterval(function() {
    			orderList();
    		}, 5000);
    	}); 
    	
    	var mno = "${loginUser.mNo}";
    	console.log(mno);
    	
   	function orderList() {
    		$.ajax({
    			url:"reloadList.do",
    			dataType:"json",
    			data:{mno:mno},
    			success:function(data) {
						var list1 = data.oList;
    					var list2 = data.odList;
    					
    				 $tableBody = $("#orderTable tbody");
    				 $tableBody.html("");
    				 
    				 
    				 for(var i in list1) {
    					 
    					 var $tr = $("<tr>");
    					 
    					 var $orderTime = $("<td>").text(list1[i].oTime);
    					 var $oAddress = $("<td>").text(list1[i].oAddress);
      					 var $mnName = $("<td>").text(list1[i].list.mnName);  
    					 var $oStatus = $("<td>").text(list1[i].oStatus);
    					 var $blank = $("<td>").text(list1[i].oNo);
						
    					 $tr.append($orderTime);
        				 $tr.append($oAddress);
            			 $tr.append($mnName);  
        				 $tr.append($oStatus);
        				 $tr.append($blank);
        				 
        				 $tableBody.append($tr);
        				 
    				 }
    				 
    				 $(function() {
    					 clickEvent();
    				 });
    				 
    			},
    			error:function(e) {
    				console.log(e);
    			}
    		});
    	}  
    	
		function clickEvent() { 
			$("#orderTable tbody tr").click(function() {
				$(this).css("background-color", "gray"); 
				var contents = $(this).children().eq(4).text(); 

		    	console.log(contents);
		    	
				location.href="orderDetail.do?oNo="+contents;
	    	
			});
		}
		    	

    </script>
    
    </section>

    </section>

    </div>
    <br><br><br><br><br><br>

  	<c:import url="../../common/footer.jsp"/>

    </div>
</body>

</html>