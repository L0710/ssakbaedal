<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>  
<head> 
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
<title>Insert title here</title>
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
        padding: 5px 10% 5px;
        margin: auto;
        min-width: 400px;
        width: 70%;
        height: 50%;
    }
    #sign_up_form{
        margin: auto;
        padding: 5px;
        width: 90%;
        height: 90%;
    }
    #sign_up_table{
        text-align: left;
        border-top: 1px solid lightgray;
        margin: auto;
        border-radius: 0px;
    }

    #sign_up_table th,td {
    border-bottom: 1px solid  lightgray;
  }
    tr td:nth-child(1){
        border-right: 1px solid  lightgray;
        background-color:rgb(130, 180, 127,0.3);
        color: rgb(64, 64, 64);
        text-align: center;
        width: 130px;
    }
    tr td:nth-child(2){
        width: 320px;
    }
    h1{
        margin-bottom: 3px; 
    }
    /* 버튼별 css */
    #sign_up:hover{
        background-color: rgb(64, 64, 64);
    }
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
        border: none;
        border-radius: 5px;
        background-color: rgb(64, 64, 64);
        color: white;
        font-size: 13px;
        padding: 0% 0% 1% 0%;
        height: 28px;
        width: 70px;
    }
    /* input css */
    td input{
        border-radius: 5px;
        height: 25px;
        width: 200px;
        border: 1px solid  lightgray;
    }
    [type=radio]{
        visibility: hidden;
        width: 15px;
        height: 15px;
    }
    [type='radio']:checked+label{
        color:  rgb(130, 180, 127);
        border: 1px solid  rgb(130, 180, 127);
        border-radius: 5px;
        padding: 2px;
    }
    #checktext{
        display: block;
        margin: 5px auto;
    }
    #textValue{
        border: none;
        background-color: rgba( 255, 255, 255, 0.1 );
    }
    .contents input::placeholder{
        font-size: 10px;
    }
    .phone{
    width: 50px; 
    height: 23px;
    
    }
    </style>
</head>
<body>
	<jsp:include page="../common/headerbar.jsp" />
		<div class="contents" align="center">
			<div id="sign_up_div">
				<h1>회원가입</h1>
				<p id="textValue" disabled></p>
				<form id="sign_up_form">
					<table id="sign_up_table">
						<tr>
							<td>아이디</td>
							<td><input type="text" name="mId"
								placeholder="영문,숫자로 포함 6~8자로 입력해주세요.">
								<button type="button" id="check_btn" >중복확인</button></td>
						</tr>
						<tr>
							<td>비밀번호</td>
							<td><input type="password" name="mPwd"
								placeholder="영문,숫자로 포함 8~12자로 입력해주세요."></td>
						</tr>
						<tr>
							<td>비밀번호 확인</td>
							<td><input type="password" name="mPwd2"
								placeholder="다시 한번 확인 해주세요."></td>
						</tr>
						<tr>
							<td>이름</td>
							<td><input type="text" name="mName"
								placeholder="2자 이상의 한글로 입력해 주세요."></td>
						</tr>
						<tr>
							<td>이메일</td>
							<td><input type="email" name="mEmail"
								placeholder="인증 시 사용되므로 정확히 작성해 주세요."></td>
						</tr>
						<tr>
							<td>전화번호</td>
							<td>
							<input type="text" class="phone" name="phone1"> - 
							<input type="text" class="phone" name="phone2"> - 
							<input type="text" class="phone" name="phone3">
							</td>
						</tr>
						<tr>
							<td>생년월일</td>
							<td><input type="text" name="birth"
								placeholder="예)201010 형식으로 입력해주세요."></td>
						</tr>
						<tr>
							<td>성별</td>
							<td><input type="radio" class="gender" id="radio1"
								name="gender" value="F"> <label for="radio1">여자</label>
								<input type="radio" class="gender" id="radio2" name="gender"
								value="M"> <label for="radio2">남자</label></td>
						</tr>
					</table>

					<h4>이용 약관 동의</h4>
					<textarea id="checktext">
             
                        </textarea>
					<input type="checkbox" id="check_b"><label>약관 확인 후 동의합니다.</label> 
					<input type="button" id="sign_up"
						class="btn-ghost green" value="회원가입">
				</form>
			</div>
		</div>
	<script>
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
			console.log( $('input[name=mId]').val());
			for (var i=0; i<9;i++) {
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
					case 8 :check=(/^[0-9]{6}$/).test(vput);break;
				}
				
				if(check==false){
					checkAry[i] = false; 
					cput.css(red);
					break;
				}else{
					checkAry[i] = true;
					cput.css(green);
				}
			}
		});
		
		$('#sign_up').on("click", function() {
			
			checkAry[9]=$('input:radio[name=gender]').is(':checked');

			if($('#check_b').is(":checked") == true){
				checkAry[10] = true;
			}else{
				checkAry[10] = false;
			}
			
			if($('input[name=mId]').prop("readonly")!=true){
			$('#textValue').text("중복체크를 해주세요.").css(tRed);
			
			}else{
			if($.inArray(false, checkAry) >= 0){
				$('#textValue').text("다시 확인 해 주세요.").css(tRed);
				return false;
			}else{
				$("#sign_up_form").attr({action:'minsert.do', method:'post'}).submit();
				return true;
			}
			}
		});

		
	</script>
	<jsp:include page="../common/footer.jsp" />
</body>
</html>