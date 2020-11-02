<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>            
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
  <link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic&display=swap" rel="stylesheet">
          <script
  src="https://code.jquery.com/jquery-3.5.1.js"
  integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc="
  crossorigin="anonymous"></script>
    <style>
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
        #updateBtn {
            width: 100px;
            margin-top: 30px;
        }

        .stinfo {
            font-size: 15px;
            margin-left: 50px;
            width: 150px;
            height: 30px;
            margin-top: 30px;
        }

        /* #updateinfo {
            text-align: center;
            margin-top: 10px;
            margin-bottom: 10px;
        } */


        #best, #setMenu, #insertMenu {
            font-size: 20px;
            font-weight: bold;
        }

        #sinfo, #pinfo {
            font-size: 18px;
            font-weight:bold; 
        }

        #bestwrapper {
            margin-bottom: 50px;
        }

        .BestMenu {
            margin: 5px;
            font-size: 14px;
            margin-top:40px; 
        }


        #spanwrapper, #setwrapper, #inputwrapper, #bestwrapper{
            margin-left: 40px;
            margin-bottom: 20px;
        }

        #slogoimg {
            width: 60px;
        }

        #slogoWrapper {
            width: 70px;
            height: 70px;
            border: 1px solid lightgrey;
            border-radius: 7px;
            display: inline-block;
            float: left;

        }

        #logocontents {
            display: inline-block;
            margin-left: 20px;
            height: 70px;
            width: 300px;
            text-align: center;
            border-radius: 7px;
        }

        #ss {
            margin-top: 7px;
        }
        
        #logocontents p {
            margin-top: 10px;
            font-size: 13px;
        }

        #slogo {
            font-size: 18px;
            margin-bottom: 0;
        } 
       

        #imgchangeBtn {
            margin-top: 10px;
            
        }

        #stName, #sOff, #delverycost, #id, #email {
            margin-left: 97px;
        }

        #sTel, #sOpen, #sDelivery, #sCate, #saddress, #ownerName, #stintro, #pwd {
            margin-left: 85px;
        }

        #pwdch {
            margin-left: 57px;
        }

        #sOff, #sOpen, #stintro {
            width: 500px;
            height: 80px;
        }
        
        #add2 {
        	    width: 300px;
    			height: 30px;
    			margin-left:55px;
    			margin-top:30px;
        }
        
        #add1{
                width: 300px;
    			height: 30px;
    			margin-left:40px;
        }
        
        #postnum {
        	margin-left:85px;
        	width: 150px;
    		height: 30px;
        }

        #changeWrapper input[type="file"] { 
            position: absolute;
            width: 1px;
            height: 1px; 
            padding: 0; 
            margin: -1px; 
            overflow: hidden; 
            clip:rect(0,0,0,0); 
            border: 0; 
        }

        #btnla {
            font-size: 15px;
            padding: 5px;
            display: inline-block;
            margin-left: 10px;
        }

        #minprice {
            margin-left: 60px;
        }
        .btn-ghost.gray.si {
            width: 150px;
            height: 40px;
            padding-top: 5px;
        }
        
        #updateBtn {
        	width: 100px;
        	cursor: pointer;
            margin: 3px;
            padding: 10px 20px;
        }
        
        #wpost {
        	margin-top:40px;
        	margin-bottom:40px;
        	
        }



    </style>
</head>
<body>
    <div class="wrapper">
    
              	<c:import url="../../common/headerbar.jsp"/>

        <section>
            <c:import url="../../common/nav_store.jsp"/>


            <div class="contents" >
                <div id="updateinfo">
                    <div align="center">
                    <span id="title" style="font-size:25px; font-weight:bold;">매장 정보 수정</span><br><br>
                    </div>
                    
					<form action="updateInfo.do" method="post"  enctype="multipart/form-data">
                    <div id="spanwrapper">
                        <div>
                            <p id="slogo">로고</p><br>
                            <div id="slogoWrapper" align="center" name="sLogo">
                                <div id="ss"><img id="slogoimg" src="../../resources/img/gold-ingots.png"></div>
                            </div>
                            <div id="logocontents">
                                <p>로고 변경은 영업일 기준 최대 5일 이내 처리됩니다.</p>
                                <div id="changeWrapper" align="left" style="margin-top: 10px;">
                                    <label for="imgchangeBtn" id="btnla" class="btn-ghost green"  name="reloadFile">파일선택</label>
                                    <input type="file" id="imgchangeBtn" name="uploadFile">
                                </div>
                            </div>
                            <hr style="margin-top:30px; margin-bottom: 30px;">
                            <div><span id="sinfo">매장정보</span></div><br>
                            <span>매장명</span><input type="text" id="stName" class="stinfo" name="sName" value="${s.sName }"><br>
                            <span>전화번호</span><input type="tel" id="sTel" class="stinfo" name="sTel" value="${s.sTel }"><br>
                            <span>운영시간</span><input id="sOpen" class="stinfo" name="sOpen" value="${s.openTime }"><br>
                            <span>휴무일</span><input id="sOff" class="stinfo" name="sOff"  value="${s.sOff}"><br>
                            <span>배달지역(km)</span><input id="sDelivery" class="stinfo" name="sDelivery" value="${s.deliveryKm}"><br>
                            <span>카테고리</span><select id="sCate" class="stinfo"  name="sCate" disabled>
                                <option value="한식">한식</option>
                                <option value="중국집">중국집</option>
                                <option value="돈까스,일식,회">돈까스,일식,회</option>
                                <option value="분식">분식</option>
                                <option value="패스트푸드">패스트푸드</option>
                                <option value="카페,디저트">카페,디저트</option>
                                <option value="치킨">치킨</option>
                                <option value="찜,탕">찜,탕</option>
                                <option value="피자">피자</option>
                                <option value="족발,보쌈">족발,보쌈</option>
                                <option value="아시안,양식">아시안,양식</option>
                                <option value="도시락">도시락</option>
                                <option value="야식">야식</option>
                            </select>
                            <br>
                        	<span>배달팁</span><input id="delverycost" class="stinfo" name="delveryCost" value="${ s.deliveryCharge}"><br>
                            <span>최소배달금액</span><input id="minprice" class="stinfo" name="minPrice" value=${s.minPrice }><br>
                            <span>매장소개</span><input id="stintro" class="stinfo" name="sIntro" value="${s.sInfo }"><br>

							<script>
								var sCate = "${s.sCategory}";
								$("#sCate").val(sCate).attr("selected", "selected");
							</script>

								<c:forTokens items="${ s.sAddress }" var="addr"
									delims="," varStatus="status">
									<c:if test="${ status.index eq 0 }">
										<c:set var="addr1" value="${ addr }" />
									</c:if>
									<c:if test="${ status.index eq 1 }">
										<c:set var="addr2" value="${ addr }" />
									</c:if>
									<c:if test="${ status.index eq 2 }">
										<c:set var="addr3" value="${ addr }" />
									</c:if>
								</c:forTokens> 
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     
								<span>매장주소</span><input id="saddress" class="stinfo" name="sAddress" value=""><br>
								<div id="wpost">
								<span>우편번호</span><input type="text" id="postnum" name="post" class="postcodify_postcode5" value="${addr1 }" readonly/>
								<button id="postcodify_search_button" type="button" class="btn-ghost gray">검색</button><br>
								</div>
								
								<div>
								<span>도로명주소</span>
								<input type="text" name="address1" class="postcodify_address"  id="add1" value="${addr2}" readonly/><br>
							
								<span>상세주소</span>
								<input type="text" name="address2" class="postcodify_details" id="add2" value="${addr3}"  />
								</div><br>
                            <span>대표자명</span><input id="ownerName" class="stinfo" name="ownerName" value="${loginUser.mName }" readonly><br>
                            <span>사업자등록번호</span><input id="sNumber" class="stinfo" name="sNumber" value="${s.sNo}" readonly><br><br>
                        </div>
                        <hr>
                        <br>
                        <div>
                            <div><span id="pinfo">회원정보</span></div><br>
                            <span>아이디</span><input type="text" id="id" class="stinfo" name="mName"  value="${loginUser.mId }" readonly><br>
                            <span>비밀번호</span><input type="password" id="pwd" class="stinfo" name="pwd" ><br>
                            <span>비밀번호 확인</span><input type="password" id="pwdch" class="stinfo" name="chPwd"><br>
                            <span>이메일</span><input type="email" id="email" class="stinfo" name="email" value="${loginUser.mEmail }"><br><br><br>
                            <div align="center">
                                <input type="submit" id="updateBtn"  class="btn-ghost green" value="수정하기">
                                <button type="button" class="btn-ghost gray" onclick="location.href=${mdelete}">탈퇴하기</button>
                            </div>
                        </div>
                    </div>
                    </form>
                <br>
            </div>

    </div>

    </section>

    <c:import url="../common/sidemenu_store.jsp" />


    </div>
    <br><br><br><br><br><br>

  	<c:import url="../../common/footer.jsp"/>



    </div>
    
    <script src="//d1p7wdleee1q2z.cloudfront.net/post/search.min.js"></script>
	
	<script> $(function() { $("#postcodify_search_button").postcodifyPopUp(); }); </script>
    
</body>
</html>