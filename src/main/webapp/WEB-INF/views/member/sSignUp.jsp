<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head> 
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
<title>s_Sign_Up</title>
  <style> 
    /* 공통 css */
    *:focus{
        outline: none;
    }

    /* 공통,색별 버튼 css */
    button {
        cursor: pointer;
        margin: 3px;
        padding: 10px 20px;
    }

    /* 태그별 css */
    #sign_up_div{
        border: 2px solid  rgb(130, 180, 127);
        padding: 5px 5% 5px;
        margin: auto;
        min-width: 350px;
        width: 90%;
        height: 50%;
        text-align: center;
    }
    #sign_up_form{
        margin: auto;
        padding: 5px;
/*         width: 90%; */
        height: 90%;
        text-align: center;
    }
    form>table:not(#menu_table){
        margin: 5px auto 5px;
        text-align: left;
        border-top: 1px solid  lightgray;
        border-collapse: collapse;
        font-size: 13px;
    }
    th,td{
    border-bottom: 1px solid  lightgray;
    padding: 8px;
    }
    #menu_table th,td{
    border-bottom: 1px solid  lightgray;
    padding: 5px;
    }
    td:nth-child(1){
        border-right: 1px solid  lightgray;
        background-color:rgb(130, 180, 127,0.3);
        color: rgb(64, 64, 64);
        text-align: center;
        width: 130px;
    }
    td:nth-child(2){
        width: 300px;
    }
    #menu_table td:nth-child(2){
        width: 150px;
    }
    #menu_table{
        margin: auto;
        margin-top: 10px;
        border-radius: 5px;
        border-top: 1px solid  lightgray;
        border-collapse: collapse;
    }
    #menu_table tr td:nth-child(1){
        border-right: none;
        background-color:white;
        color: none;
        text-align: center;
    }
    h1{
        margin-bottom: 3px; 
    }
    caption{
        font-size: 15px;
    }
    h4{
        margin: 10px auto 10px;
    }

    /* 버튼별 css */
    #sign_up{
        display: block;
        width: 150px;
        height: 25px;
        border: none;
        border-radius: 5px;
        margin: 5px auto 5px;
        background-color: rgb(130, 180, 127, 0.7);
        color: white;
        font-size: 15px;
        
    }
    #check_btn{
        display: inline-block;
        border: none;
        border-radius: 5px;
        background-color: rgb(64, 64, 64);
        color: white;
        font-size: 13px;
        padding: 0% 0% 1% 0%;
        height: 27px;
        width: 60px;
    }
    #checktext{
        display: block;
        margin: 5px auto;
    }
    #open{
        border:2px solid  rgb(130, 180, 127);
        border-radius: 5px;
        margin: 5px;
    }
    .choice{
        display: inline-block;
        width: 33px;
        height: 23px;
        padding-right: 5px; 
        padding-left: 3.5px; 
    }
    
    /* input css */
    input:not([type="button"]){
        border-radius: 5px;
        height: 23px;
        width: 200px;
        border: 1px solid  lightgray;
    }
    input[type="checkbox"]{
        height: 13px;
        width: 20px;
        border-radius: 5px;
        border: 1px solid  lightgray;
    }
    #textValue{
        border: none;
        background-color: rgba( 255, 255, 255, 0.1 );
    }
    select{
        border-radius: 5px;
        border: 1px solid  lightgray;
    }
    textarea{
        resize: none;
        border-radius: 5px;
        overflow:hidden;
        height: 100%;
        width: 200px;
        border: 1px solid  lightgray;
    }
    #menu_table [type=text]{
        height: 20px;
        width: 95%;
        border-radius: 5px;
        border: 1px solid  lightgray;
    }
    input[type=number]{
        height: 20px;
        width:100px;
        text-align: right;
        border-radius: 5px;
        border: 1px solid  lightgray;
    }
    input[type=time]{
        height: 20px;
        width:100px;
        text-align: right;
        border-radius: 5px;
        border: 1px solid  lightgray;
    }
    .contents input::placeholder,
    .contents textarea::placeholder{
        font-size: 10px;
    }
    #menu_table [type=button]{
        display: inline-block;
        border: none;
        border-radius: 5px;
        background-color: rgb(64, 64, 64);
        color: white;
        font-size: 13px;
    }
    p{
        margin: 3px;
    }

    /* file css */
    .filebox input[type="file"] {
    position: absolute;
    width: 0;
    height: 0;
    padding: 0;
    overflow: hidden;
    border: 0;
    }

    .filebox label {
    cursor: pointer; 
    text-align: center;
    display: inline-block;
    border: none;
    border-radius: 5px;
    background-color: rgb(64, 64, 64);
    color: white;
    font-size: 13px;
    padding-top: 3px;
    width: 50px;
    height: 23px;
    }

    /* named upload */
    .filebox .upload-name {
    display: inline-block;
    width: 130px;
    height: 20px;
    font-size:10px;
    color: gray;
    vertical-align: middle;
    border-radius: 5px;
    border: 1px solid  lightgray;

    }
    /* 증감소 버튼 숨기기 css */
    input[type="number"]::-webkit-outer-spin-button,
    input[type="number"]::-webkit-inner-spin-button {
        -webkit-appearance: none;
    }

    </style>
</head>
<body>
<jsp:include page="../common/headerbar.jsp" />
<section>
            <div class="contents" align="center">
                <div id="sign_up_div">
                   <h1>회원가입</h1>
				<p id="textValue" disabled></p>
                    <form id="sign_up_form" enctype="multipart/form-data">
                        <table id="sign_up_table">
                            <tr>
                                <td>아이디</td>
                                <td>
                                    <input type="text" name="mId" placeholder="영문,숫자로 포함 4~12자로 입력해주세요.">
									<button type="button" id="check_btn" >중복확인</button>
                                </td>
                            </tr>
                            <tr>
                                <td>비밀번호</td>
                                <td ><input type="password" name="mPwd"  placeholder="영문,숫자로 포함 8~12자로 입력해주세요."></td>
                            </tr>
                            <tr>
                                <td>비밀번호 확인</td>
                                <td><input type="password" name="mPwd2" placeholder="다시 한번 확인 해주세요."></td>
                            </tr>
                            <tr>
                                <td>이름</td>
                                <td ><input type="text" name="mName" placeholder="2자 이상의 한글로 입력해 주세요."></td>
                            </tr>
                            <tr>
                                <td>이메일</td>
                                <td ><input type="email" name="mEmail" placeholder="인증 시 사용되므로 정확히 작성해 주세요."></td>
                            </tr>
                            <tr>
                                <td>전화번호</td>
                                <td >
                                <input type="text" id="phone1" style="width:50px;height: 23px;">
                                -
                                <input type="text" id="phone2" style="width:50px;height: 23px;">
                                -
                                <input type="text" id="phone3" style="width:50px;height: 23px;">
                                </td>
                            </tr>
                        </table>
                        <table id="buisness_table">
                                <caption style="font:25px; margin-bottom: 5px; "><strong>사업자 정보</strong></caption>
                            <tr>
                                <td>사업자등록번호</td>
                                <td>
                                <input type="text" id="sNumber1" style="width:30px;height: 23px;">
                                -
                                <input type="text" id="sNumber2" style="width:15px;height: 23px;">
                                -
                                <input type="text" id="sNumber3" style="width:50px;height: 23px;">

                                </td>
                            </tr>    
                            <tr>
                                <td>사업자등록증 사본등록</td>
                                <td>
                                <div class="filebox"> 
                                    <input class="upload-name" value="파일선택" readonly>
                                    <input type="file"  multiple="multiple" id="buisness_file"name="bfile">
                                    <label for="buisness_file">업로드</label> 
                                </div>
                                </td>
                            </tr>
                        </table>
                        <img src="./resources/img/open.png" id="open">
                        <table id="store_table" style="display:none" >
                            <caption style="font:25px; margin-bottom: 5px; "><strong>매장 정보</strong></caption>
                            <tr>
                                <td>매장명</td>
                                <td colspan=""><input type="text" name="sName"></td>
                            </tr>
                            <tr>
                                <td>매장 전화번호</td>
                                <td >
                                <input type="text" id="sTel1" name="phone1" style="width:50px;height: 23px;">
                                -
                                <input type="text" id="sTel2" name="phone2" style="width:50px;height: 23px;">
                                -
                                <input type="text" id="sTel3" name="phone3" style="width:50px;height: 23px;">
                                </td>
                            </tr> 
                              <!--전화번호 유효성 두군데 수정  -->
						<tr>
							<td>우편번호</td>
							<td><input type="text" name="post"
								class="postcodify_postcode5" size="6" />
								<button id="postcodify_search_button" type="button">검색</button>
							</td>
						</tr>
						<tr>
							<td>도로명 주소</td>
							<td><input type="text" name="address1"class="postcodify_address" /></td>
						</tr>
						<tr>
							<td>상세 주소</td>
							<td><input type="text" name="address2"class="postcodify_details" /></td>
						</tr>
						<tr>
							<td>카테고리</td>
							<td><select name="sCategory" id="category">
									<option value="">선택하기</option>
									<option value="한식">한식</option>
									<option value="분식">분식</option>
									<option value="돈까스,회,일식">돈까스,회,일식</option>
									<option value="아시안,양식">아시안,양식</option>
									<option value="중국집">중국집</option>
									<option value="카페,디저트">카페,디저트</option>
									<option value="도시락">도시락</option>
									<option value="패스트푸드">패스트푸드</option>
									<option value="치킨">치킨</option>
									<option value="피자">피자</option>
									<option value="족발,보쌈">족발,보쌈</option>
									<option value="찜,탕">찜,탕</option>
									<option value="야식">야식</option>
							</select></td>
						</tr>
						<tr>
                                <td>휴무일</td>
                                <td>
                                    <input type="checkbox" name="sOff" id=""><label for="">연중무휴</label>
                                    <input type="checkbox" name="sOff" id="holiday"><label for="holiday">정기휴무</label>
                                    <input type="checkbox" name="sOff" id=""><label for="">공휴일</label>
                                    <p class="holiday" style="display:none;">
                                    주 단위 휴무 : 
                                    <select>
                                    <option value="0">매주</option>
                                    <option value="1">매월 첫째</option>
                                    <option value="2">매월 둘째</option>
                                    <option value="3">매월 셋째</option>
                                    <option value="4">매월 넷째</option>
                                    </select>
                                    </p>
                                    <p class="holiday" style="display:none;">
                                    요일별 휴무 : 
                                    <select>
                                    <option value="1">월요일</option>
                                    <option value="2">화요일</option>
                                    <option value="3">수요일</option>
                                    <option value="4">목요일</option>
                                    <option value="5">금요일</option>
                                    <option value="6">토요일</option>
                                    <option value="7">일요일</option>
                                    </select>
                                    </p>                                </td>
                            </tr>
                            <tr>
                                <td>운영시간</td>
                                <td>
                                    <p>월~금 : <input class="time" type="time"> ~ <input class="time" type="time"></p>
                                    <p>토요일 : <input class="time" type="time"> ~ <input class="time" type="time"></p>
                                    <p>일요일 : <input class="time" type="time"> ~ <input class="time" type="time"></p>
                                </td>
                            </tr>
                            <tr>
                                <td>배달반경</td>
                                <td>
                                    <select name="deliveryKm" id="km">
                                    <option value="1">1.5km</option>
                                    <option value="2">2km</option>
                                    <option value="3">3km</option>
                                    <option value="4">4km</option>
                                    <option value="5">5km</option>
                                    </select>
                                    </td>
                            </tr>
                            <tr>
                                <td>배달비</td>
                                <td><p><input name="deliveryCharge" type="number"placeholder="숫자만 입력해 주세요.">원</p></td>
                            </tr>
                            <tr>
                                <td>배달가능 최소금액</td>
                                <td><p><input name="minPrice" type="number"placeholder="숫자만 입력해 주세요.">원</p></td>
                            </tr>
                             <tr>
                                <td>가게 대표 이미지</td>
                                <td>
                                <div class="filebox"> 
                                    <input class="upload-name" value="파일선택" readonly>
                                    <input type="file" multiple="multiple" id="store_file"name="sfile">
                                    <label for="store_file">업로드</label> 
                                </div>
                                </td>
                            </tr>
                            <tr>
                                <td>가게 소개</td>
                                <td><textarea name="sInfo" rows="5" cols="50" placeholder="내용을 입력해주세요"></textarea></td>
                            </tr>
                        </table>
                        <table id="menu_table" style="display:none" >
                            <caption style="font:25px; margin-bottom: 5px; "><strong>메뉴</strong></caption>
                            <tr>
                                <th style="width:250px;">메뉴명</th>
                                <th style="width:130px">가격</th>
                                <th style="width:220px">이미지</th>
                                <th style="width:100px"></th>
                            </tr>
                            <tr >
                                <td><input type="text" name="menuList[0].mnName"></td>
                                <td><input type="number" name="menuList[0].mnPrice" style="display:inline-block;" placeholder="숫자만 입력해 주세요.">원</td>
                                <td>
                                <div> 
                                    <input type="file"  multiple="multiple" id="buisness_file" name="mnFile" >
                                </div>
                                </td>
                                <td>
                                <input type="button" id="plus0" class="choice" value="추가" >
                                <input type="button" class="choice" value="삭제" onclick="minus(this);">
                                </td>
                            </tr>
                            <tr >
                                <td><input type="text" name="menuList[1].mnName"></td>
                                <td><input type="number" name="menuList[1].mnPrice" style="display:inline-block;" placeholder="숫자만 입력해 주세요.">원</td>
                                <td>
                                <div> 
                                    <input type="file"  multiple="multiple" id="buisness_file" name="mnFile" >
                                </div>
                                </td>
                                <td>
                                <input type="button" id="plus0" class="choice" value="추가" >
                                <input type="button" class="choice" value="삭제" onclick="minus(this);">
                                </td>
                            </tr>
                            <tr>
                                <td><input type="text" name="menuList[2].mnName"></td>
                                <td><input type="number" name="menuList[2].mnPrice" style="display:inline-block;" placeholder="숫자만 입력해 주세요.">원</td>
                                <td>
                                <div> 
                                    <input type="file"  multiple="multiple" id="buisness_file" name="mnFile" >
                                </div>
                                </td>
                                <td>
                                <input type="button" id="plus0" class="choice" value="추가" >
                                <input type="button" class="choice" value="삭제" onclick="minus(this);">
                                </td>
                            </tr>
                        </table>
                        <h4>이용 약관 동의</h4>
                        <textarea id="checktext">
             
                        </textarea>
                        <label><input type="checkbox" >약관 확인 후 동의합니다.</label>
                        <input type="submit" id="sign_up" class="btn-ghost green"value="회원가입">
                        <input type="text" name="mPhone" style="display:none">
                        <input type="text" name="sTel" style="display:none">                        
                        <input type="text" name="sNo" style="display:none">
                    </form>
                </div>
            </div>
        </section>
        
        <script src="//d1p7wdleee1q2z.cloudfront.net/post/search.min.js"></script>
		<script> $(function() { $("#postcodify_search_button").postcodifyPopUp(); }); </script>
        
 
    <script>
/* 	var i=0;
    var num="#plus"+(i);
	console.log(i);
    
    var rowItem = "<tr id=\"sample\">"
    rowItem += "<td><input type=\"text\" name=\"mnList["+(i+1)+"].mnName\"></td>"
    rowItem += "<td><input type=\"number\" name=\"mnList["+(i+1)+"].mnPrice\" style=\"display:inline-block;\" placeholder=\"숫자만 입력해 주세요.\">원</td>"
    rowItem += "<td>"
    rowItem += "<div class=\"filebox\">"
    rowItem += "<input class=\"upload-name\" value=\"파일선택\" readonly>"
    rowItem +="<input type=\"file\"  multiple=\"multiple\" id=\"buisness_file\">"
    rowItem +="<label for=\"buisness_file\">업로드</label>"
    rowItem +="</div>"
    rowItem +="</td>"
    rowItem +="<td>"
    rowItem +="<input type=\"button\" id=\"plus"+(i+1)+"\" class=\"choice\" value=\"추가\">"
    rowItem +="<input type=\"button\" class=\"choice\" value=\"삭제\" onclick=\"minus(this);\">"
    rowItem +="</td>"
    rowItem +="</tr>"
    
    $("#plus").on('click', function() {
	 	$('#menu_table').append(rowItem);i+=1;

 	});  */
    

    $( '#open' ).click( function() {
        if ($('#store_table').css('display') == 'none') {
            $('#open').attr('src',"./resources/img/close.png");
            $('#store_table').show();
            $('#menu_table').show();
        }else {
            $('#open').attr('src',"./resources/img/open.png");
            $('#store_table').hide();
            $('#menu_table').hide();
        };
    });
    $( '#holiday' ).on('click', function() {
        if ($('.holiday').css('display') == 'none') {
            $('.holiday').show();
            $('.holiday').show();
        }else {
            $('#store_table').hide();
            $('#menu_table').hide();
        };
    });
    
	var check1 = [];
	var check2 = [];
	var check3 = [];
	var check4 = [];
	var checkAry = [];
	
	var ng = "양식이 맞지 않습니다.";
	var tGreen = ({"color" : "green"});
	var tRed = ({"color" : "red"});
	var red = ({"border" : "2px solid  red"});
	var green = ({"border" : "2px solid rgb(130, 180, 127, 0.7)"});
	

	$('#check_btn').on('click', function() {
		var idput = $('input[name=mId]');
		console.log($('input[name=mId]').prop("readonly"));
		console.log($('input[name=mId]').attr("readonly"));
		
		if(checkAry[0]==true){
			var result = confirm('사용 가능한 아이디인 경우 변경이 불가합니다.계속 진행하시겠습니까?'); 
			var mId = idput.val();
		
			if (result) {
				$.ajax({
					url : "checkId.do",
					type : "POST",
					data : {mId : mId},
					success : function(data) {
						if (data == "No") {
							checkAry[0] = false;
							idput.css(red);
							$('#textValue').text("사용 불가능한 아이디 입니다").css(tRed);
						} else {
							checkAry[0] = true;
							idput.css(green);
							idput.prop("readonly", true);
							$('#textValue').text("  ");
						}
					},
					error : function() {
						alert("문제가 발생하였습니다.관리자에게 문의해주세요.");
					}
				});
			}
	 	}else{
	 		$('#textValue').text("다시 확인해주세요").css(tRed);
	 	}
	});
	

	
	$('input').on("keyup", function() {
		var put = $('td input');
		var pwd = put.eq(1).val();

		for (var i=0; i<8;i++) {
			var check = false;
			var cput = put.eq(i);
			var vput = put.eq(i).val();
			
			switch(i){
				case 0 :check=(/^[a-zA-Z0-9]{6,10}$/).test(vput);break;
				case 1 :check=(/^[a-zA-Z0-9]{8,12}$/).test(vput);break;
				case 2 :check=(pwd==vput);break;
				case 3 :check=(/^[가-힣]{2,}$/).test(vput);break;
				case 4 :check=(/([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/).test(vput);break;
				case 5 :check=(/^[0-9]{3}$/).test(vput);break;
				case 6 :check=(/^[0-9]{3,4}$/).test(vput);break;
				case 7 :check=(/^[0-9]{4}$/).test(vput);break;
			}
			
			if(check==false){
				check1[i] = false; 
				cput.css(red);
				break;
			}else{
				check1[i] = true;
				cput.css(green);
			}
		}
	});
	    $('#sign_up_table').on("mouseover focus", function() {
	    	$('input[name=mPhone]').val($('#phone1').val() +$('#phone2').val()+$('#phone3').val());
	    	console.log($('input[name=mPhone]').val());
	    	
	    	if($.inArray(false, check1) >= 0){
	    		checkAry[0] = false; 
	    		console.log(check1);
			}else{
	    		checkAry[0] = true; 
			}
	    });
	    $('#buisness_table').on("mouseover focus", function() {
	    	$('input[name=sNo]').val($('#sNumber1').val()+$('#sNumber2').val()+$('#sNumber3').val());
	    	console.log($('input[name=sNo]').val());
	    	
	    	if($.inArray(false, check2) >= 0){
	    		checkAry[1] = false; 
	    		console.log(check2);
			}else{
	    		checkAry[1] = true; 
			}
	    });
	    $('#store_table').on("mouseover focus", function() {
	    	$('input[name=sTel]').val($('#sTel1').val() +$('#sTel2').val()+$('#sTel3').val());
	    	var time = ""; 
	    	for(var i=0;i<6;i++){
	    	if(i<5){
	        time+=$('.time').eq(i).val()+",";
	    	}else{
	    	time+=$('.time').eq(5).val();
	    	}
	    	}
	    	console.log(time);
	    	console.log($('input[name=sTel]').val());
	    	
	    	
	    	
	    	if($.inArray(false, check3) >= 0){
	    		checkAry[2] = false;
	    		console.log(check3);
			}else{
	    		checkAry[2] = true; 
			}
	    });
	    $('#menu_table').on("mouseover focus", function() {

	    	
	    	if($.inArray(false, check4) >= 0){
	    		checkAry[3] = false;
	    		console.log(check4);
			}else{
	    		checkAry[3] = true; 
			}
	    });

	    
	    
	    $('#sign_up').on("click", function() {
	    	if($.inArray(false, checkAry) >= 0){
				$('#textValue').text("다시 확인 해 주세요.").css(tRed);
				return false;
			}else{
				$("#sign_up_form").attr({action:'sInsert.do', method:'POST'}).submit();
				return true;
			}
	    });

	
    </script>   
<jsp:include page="../common/footer.jsp" />
</body>
</html>