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
            margin-top: 40px;
        }

        .stinfo {
            font-size: 15px;
            margin-left: 50px;
            width: 150px;
            height: 30px;
            margin-top: 30px;
        }
        
        .otime {
        	font-size:15px;
        	margin-left:30px;
        	border:none;
        	margin-top:10px;
        	margin-bottom:10px;
        }
        
        #oTimeWrapper {
        	margin-bottom:10px;
        	border:1px solid black;
        	width:300px;
        	margin-left:150px;
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
            width: 130px;
            height:100px;
        }

        #slogoWrapper {
            width: 150px;
            height: 120px;
            border: 1px solid lightgrey;
            border-radius: 7px;
            display: inline-block;
            float: left;

        }

        #logocontents {
            display: inline-block;
            margin-left: 30px;
            margin-top:20px;
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
        
        #holidayWrapper {
        	margin-left:140px;
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
                    <input type="hidden" name="mNo" value="${s.mNo}">
                    <input type="hidden" name="renameFileName" value="${ attach.changeFileName}">
                    <input type="hidden" name="originalFileName" value="${attach.originalFileName}">
                    <input type="hidden" name="filePath" value="${attach.filePath}">
                    <div id="spanwrapper">
                        <div>
                            <p id="slogo">로고</p><br>
                            <div id="slogoWrapper" align="center" name="sLogo">
          					    <div id="ss"><img id="slogoimg" src="${contextPath}/resources/muploadFiles/logo/${attach.changeFileName}"></div>                  
                            </div>
                            <div id="logocontents">
                                <p>로고 변경은 영업일 기준 최대 5일 이내 처리됩니다.</p>
                                <div id="changeWrapper" align="left" style="margin-top: 10px;">
                                    <label for="imgchangeBtn" id="btnla" class="btn-ghost green"  name="reloadFile">파일선택</label>
                                    <input type="file" id="imgchangeBtn" name="uploadLogoFile" >
                                </div>
                                <script>
								function readURL(input) {
	                        		if(input.files && input.files[0]) {
	                        			var reader = new FileReader();
	                        			
	                        			reader.onload = function(e) {
	                            			$("#slogoimg").attr("src", e.target.result);
	                            		}
	                        			reader.readAsDataURL(input.files[0]);
	                        		}
	                        	}
	                        	
		                        	$("input[name=uploadLogoFile]").change(function() {
		                        		readURL(this);
		                        	}); 
                                </script>
                            </div>
                            <br><br><br><br>
                            <hr style="margin-top:30px; margin-bottom: 30px;">
                            <div><span id="sinfo">매장정보</span></div><br>
                            <span>매장명</span><input type="text" id="stName" class="stinfo" name="sName" value="${s.sName }"><br>
                            <span>전화번호</span><input type="tel" id="sTel" class="stinfo" name="sTel" value="${s.sTel }"><br>
                            	<br><br>
                            	
                            	<c:forTokens items="${ s.openTime }" var="open" delims="," varStatus="status">
									<c:if test="${ status.index eq 0 }">
										<c:set var="open1" value="${ open }" />
									</c:if>
									<c:if test="${ status.index eq 1 }">
										<c:set var="open2" value="${ open }" />
									</c:if>
									<c:if test="${ status.index eq 2 }">
										<c:set var="open3" value="${ open }" />
									</c:if>
								</c:forTokens> 
							
							<div align="left">
							<span style="float:left;">운영시간</span>	
                            <div id="oTimeWrapper">
                            	<input id="open1" class="otime" name="sOpen1" value="${open1}"><br>
                            	<input id="open2" class="otime" name="sOpen2" value="${open2}"><br>
                            	<input id="open3" class="otime" name="sOpen3" value="${open3}"><br>
                            </div>
                            </div><br><br>
                            
                            <div>
                            	<span style="float:left;">휴무일</span>
                            		<div id="holidayWrapper">
                            			<input type="hidden" id="offday" value="${s.sOff }" name="sOff">
	                             		<input type="checkbox" name="sOff1" class="day" id="no" value="연중무휴" ><label>연중무휴</label>
	                                    <input type="checkbox" name="sOff1" class="day" id="red" value="공휴일"><label>공휴일</label>
	                                    <input type="checkbox" name="sOff1" class="day"id="holiday" value="정기휴무"><label for="holiday">정기휴무</label>
									
                                    <p class="holiday" >주 단위 휴무 : 
                                    <select id="selectweek" onchange="weekchange();" disabled>
                                    <option value="0">매주</option>
                                    <option value="1">매월 첫째</option>
                                    <option value="2">매월 둘째</option>
                                    <option value="3">매월 셋째</option>
                                    <option value="4">매월 넷째</option>
                                    </select>
                                    </p>
                                    <p class="holiday">요일별 휴무 : 
                                    <select id="selectdate" onchange="datechage();" disabled>
                                    <option value="1">월요일</option>
                                    <option value="2">화요일</option>
                                    <option value="3">수요일</option>
                                    <option value="4">목요일</option>
                                    <option value="5">금요일</option>
                                    <option value="6">토요일</option>
                                    <option value="7">일요일</option>
                                    </select>
                                    </p>
	                                    <input type="hidden" name="week">
	                                    <input type="hidden" name="date">
	                            	</div>
                            </div>
                             <br>
                            <span>배달반경(km)</span>
                             <select name="deliveryKm" id="km" class="stinfo" onchange="kmchange();">
                                    <option value="1">1km</option>
                                    <option value="2">2km</option>
                                    <option value="3">3km</option>
                                    <option value="4">4km</option>
                                    <option value="5">5km</option>
                            </select><br>
                            <input type="hidden" name="delivery">
                            
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
                            <input type="hidden" name="cateinpt">
                            <br>
                            
                        	<span>배달팁</span><input id="delverycost" class="stinfo" name="deliveryCharge" value="${ s.deliveryCharge}">원<br>
                            <span>최소배달금액</span><input id="minprice" class="stinfo" name="minPrice" value=${s.minPrice }>원<br>
                            <span>매장소개</span><input id="stintro" class="stinfo" name="sInfo" value="${s.sInfo }"><br>


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
 
								<div id="wpost">
								<span>우편번호</span><input type="text" id="postnum" name="post" class="postcodify_postcode5" value="${addr1 }" readonly/>
								<button id="postcodify_search_button" type="button" class="btn-ghost gray">검색</button><br>
								</div>
								
								<div>
								<span>도로명주소</span>
								<input type="text" name="address1" class="postcodify_address"  id="add1" value="${addr2}" readonly/><br>
							
								<span>상세주소</span>
								<input type="text" name="address2" class="postcodify_details" id="add2" value="${addr3}"  readonly/>
								</div><br>
                            <span>대표자명</span><input id="ownerName" class="stinfo" name="ownerName" value="${loginUser.mName }" readonly><br>
                            <span>사업자등록번호</span><input id="sNumber" class="stinfo" name="sNumber" value="${s.sNo}" readonly><br><br>
                        </div>
                        <div align="center">
                        	<input type="submit" id="updateBtn"  class="btn-ghost green" value="수정하기">
                        </div>
                         
                    </div>
                    </form>
                <br>
            </div>
            
            <script>

     	 	var holiday = $("#offday").attr("value");
/*         	console.log(holiday); */
        	
        	var length = holiday.length;
/*         	console.log(length); */
        	
        	
        	if($("input[name=sOff1]").attr("value").match("휴")) {
            	var split = holiday.split(",");
            	/*         	console.log(split); */
            	 var w = split[1];
            	 var d = split[2];
/*             	 
                 console.log(w);
            	 console.log(d);        		
				 */
             	$("#selectweek").val(w);
             	$("#selectdate").val(d);
            	 
        	}

        	
        	if(holiday == '연중무휴') {
        		$("#no").attr("checked", "checked");
        	} else if (holiday == '공휴일') {
        		$("#red").attr("checked", "checked");
        	} else {
        		$("#holiday").attr("checked", "checked");
        		$('.holiday').show();
        	} 

            	$("input[name=sOff1]").change(function() {
            		if($(this).attr("value") == '연중무휴') {
            			$("input[name=sOff1]").prop("checked", false);
            			$(this).prop("checked", true);
            			$("#offday").val($(this).attr("value"));
            			$("#selectweek").attr("disabled", true);
            			$("#selectdate").attr("disabled", true);
            			
            		} else if ($(this).attr("value") == '공휴일') {
            			$("input[name=sOff1]").prop("checked", false);
            			$(this).prop("checked", true);
            			$("#offday").val($(this).attr("value"));
            			$("#selectweek").attr("disabled", true);
            			$("#selectdate").attr("disabled", true);
            			
            		} else if ($(this).attr("value").match("휴")) {
            			$("input[name=sOff1]").prop("checked", false);
            			$(this).prop("checked", true);
            			$("#offday").val($(this).attr("value"));
            			
            			$("#selectweek").attr("disabled", false);
            			$("#selectdate").attr("disabled", false);

            		} else {
            			$(this).prop("checked", false); 
            		}
            	});
            	
	     		function weekchange() {
	        		var value1 = $("#selectweek option:selected").attr("value");
	        		$("input[name=week]").val(value1);
	        	}
	     		
	     		function datechage() {
	        		var value2 = $("#selectdate option:selected").attr("value");
	        		$("input[name=date]").val(value2);
	        	}
            
	     		var sCate = "${s.sCategory}";
				$("#sCate").val(sCate).attr("selected", "selected");	
				
	     		var km = "${s.deliveryKm}";
				$("#km").val(km).attr("selected", "selected");	
	
	     		function kmchange() {
	        		var value = $("#km option:selected").attr("value");
	        		$("input[name=delivery]").val(value);
	        	}
	        	
	        	var cate = $("#sCate option:selected").attr("value");
	        	$("input[name=cateinpt]").val(sCate);

            

            </script>

    </div>
    
   </section>
    <div class="sidemenu">
        <button class="btn-ghost gray si" onclick="location.href='${contextPath}/menuSetting.do'">메뉴관리</button>
        <button class="btn-ghost gray si" onclick="location.href='${contextPath}/openSetting.do'">영업관리</button>
        <button class="btn-ghost gray si" onclick="location.href='${contextPath}/storeManage.do'">매장관리</button>
        <button class="btn-ghost gray si">알림</button>
    </div>
    </section>
    <c:import url="../../common/sidemenu_store.jsp" />


    </div>
    <br><br><br><br><br><br>

  	<c:import url="../../common/footer.jsp"/>



    
    
    <script src="//d1p7wdleee1q2z.cloudfront.net/post/search.min.js"></script>
	
	<script> $(function() { $("#postcodify_search_button").postcodifyPopUp(); }); </script>
    
</body>
</html>