<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ssakbaedal</title>
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
            top: 230px;
            /* left: 1230px; */
            margin-left: 1035px;
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
            font-weight:bold;
            border: none;
            width: 100%;
            margin-bottom: 20px;
            margin-left:55px;
        }

        .date{
            width: 150px;
            height: 25px;
            margin-left: 20px;
            margin-bottom: 20px;
        }

        #openStatus  {
            height: 25px;
            margin-bottom:10px;
        }

        #sSaveBtn {
            margin-bottom:20px; 
        }

        #opentTitle {
            font-size: 25px;
            font-weight: bold;
            margin-bottom: 40px;
        }
        
        #sSaveBtn {
        	width:80px;
        	height:40px;
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
                <p><b>${store.sName}</b></p>
                <form action="updatesStatus.do" method="post">
                <label>매장상태</label>
                <input type="hidden"  id="mNo" name="mNo">
                <select id="openStatus" onchange="change();">
                    <option value="1" selected>정상영업</option>
                    <option value="2" >하루폐점</option>
                    <option value="3" >휴무</option>
                </select>
                <input type="hidden" name="soStatus" id="soStatus">
                <br>
                <span>시작일</span><input type="date" class="date" id="startDate" name="startDate" disabled><br>
                <span>종료일</span><input type="date" class="date" id="finishDate" name="finishDate"  disabled><br>
                <input type="hidden" name="start" id="start">
                <input type="hidden" name="end" id="end">
                <input type="submit" class="btn-ghost gray" id="sSaveBtn" value="저장">
                <hr>
				</form>
				
				<script>
				
				var mNo = ${loginUser.mNo};
				$("input[type=hidden][name=mNo]").val(mNo);
				
				var nostatus =  $("#openStatus option:selected").val();
				$("#soStatus").val(nostatus); 
				
				function change() {
					var status = $("#openStatus option:selected").val();
					console.log(status);
					$("#soStatus").val(status);

						if(status == "3") {
							console.log(status);
							$("input[type=date][name=startDate]").attr("disabled", false);
							$("input[type=date][name=finishDate]").attr("disabled", false);
						} 
				}
				
				$("#startDate").change(function() {
					var start = $(this).val();
					console.log(start);
					$("#start").val(start); 
				});
				
				$("#finishDate").change(function() {
					var end = $(this).val();
					console.log(end);
					$("#end").val(end);
				});
				
				</script>


                <div class="tableWrapper" align="center">

                    <table id="noticeTable">
                        <tr>
                            <th>날짜</th>
                            <th>매장상태</th>
                        </tr>
                        
                       <c:forEach var="db" items="${db}" > 
                        <tr>
                        	<c:if test="${db.sStatus == 3 }">
                        		<td>${db.startDate} ~ ${db.endDate}</td>
                        		<td>휴가</td>
                        	</c:if>
                        	
                        	<c:if test="${db.sStatus == 2 }">
                        		<td>${db.today}</td>
                        		<td>하루폐점</td>
                        	</c:if>
                        	
                        	<c:if test="${db.sStatus == 1 }">
                        		<td>${db.today}</td>
                        		<td>정상영업</td>
                        	</c:if>
                        </tr>
                        </c:forEach> 
                        
                        
         <tr align="center" height="20">
			<td colspan="2">
				<!-- [이전] -->
				<c:if test="${ pi.currentPage <= 1 }">
					[이전] &nbsp;
				</c:if>
				<c:if test="${ pi.currentPage > 1 }">
					<c:url var="before" value="openSetting.do">
						<c:param name="page" value="${ pi.currentPage - 1 }"/>
					</c:url>
					<a href="${ before }">[이전]</a> &nbsp;
				</c:if>
				<!-- 페이지 숫자 -->
				<c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
					<c:if test="${ p eq pi.currentPage }">
						<font color="red" size="4">[ ${ p } ]</font>
					</c:if>
					<c:if test="${ p ne pi.currentPage }">
						<c:url var="pagination" value="openSetting.do">
							<c:param name="page" value="${ p }"/>
						</c:url>
						<a href="${ pagination }">${ p }</a> &nbsp;
					</c:if>
				</c:forEach>
				<!-- [다음] -->
				<c:if test="${ pi.currentPage >= pi.maxPage }">
					[다음]
				</c:if>
				<c:if test="${ pi.currentPage < pi.maxPage }">
					<c:url var="after" value="openSetting.do">
						<c:param name="page" value="${ pi.currentPage + 1 }"/>
					</c:url>
					<a href="${ after }">[다음]</a>
				</c:if>
				</td>
			</tr>
                    </table>

                </div>
                
                
            </div>

    </div>

    </section>
        <div class="sidemenu">
        <c:url var="storeManage" value="storeManage.do">
			<c:param name="mNo" value="${ loginUser.mNo }"/>
		</c:url> 
        <button class="btn-ghost gray si" onclick="location.href='${contextPath}/menuSetting.do'">메뉴관리</button>
        <button class="btn-ghost gray si" onclick="location.href='${contextPath}/openSetting.do'">영업관리</button>
        <button class="btn-ghost gray si" onclick="location.href='${contextPath}/storeManage.do'">매장관리</button>
        <button class="btn-ghost gray si" onclick="location.href='${contextPath}/snlist.do'">매장공지</button>
    </div>
    </section>

    </div>
    <br><br><br><br><br><br>

	<c:import url="../../common/footer.jsp"/>


    </div>
</body>
</html>