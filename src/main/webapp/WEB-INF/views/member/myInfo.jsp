<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ssakbaedal</title>
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

    #update_div{
        border: 2px solid  rgb(130, 180, 127);
        padding: 5px 10% 5px;
        margin: auto;
        min-width: 400px;
        width: 70%;
        height: 50%;
    }
    #update_form{
        margin: auto;
        padding: 5px;
        width: 90%;
        height: 90%;
    }
    #update_table{
        text-align: left;
        border-top: 1px solid lightgray;
        margin: auto;
        border-radius: 0px;
    }

    #update_table th,td {
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
    #checktext{
        resize: none;
        height:300px;
        width: 800px;
        border: 1px solid  lightgray;
    }
    /* 버튼별 css */
    #update:hover{
        background-color: rgb(64, 64, 64);
    }
    #update{
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
	<c:import url="../common/headerbar.jsp" />

	<c:choose>
		<c:when test="${ loginUser.mType == 1 }">
			<c:import url="../common/nav_admin.jsp" />
		</c:when>
		<c:when test="${ loginUser.mType == 2 }">
			<c:import url="../common/nav_user.jsp" />
		</c:when>
		<c:otherwise>
			<c:import url="../common/nav_store.jsp" />
		</c:otherwise>
	</c:choose>
	<div class="contents" align="center">
			<div id="update_div">
				<h1>정보변경</h1>
				<form id="update_form" >
					<table id="update_table">
						<tr>
							<td>아이디</td>
							<td><input type="text" name="mId" value="${ loginUser.mId }" readonly></td>
						</tr>
						<tr>
							<td>비밀번호</td>
							<td><input type="password" name="mPwd"></td>
						</tr>
						<tr>
							<td>비밀번호 확인</td>
							<td><input type="password" name="mPwd2"></td>
						</tr>
						<tr>
							<td>이름</td>
							<td><input type="text" name="mName" value="${ loginUser.mName }"></td>
						</tr>
						<tr>
							<td>이메일</td>
							<td><input type="email" name="mEmail" value="${ loginUser.mEmail }"></td>
						</tr>
						<tr>
							<td>전화번호</td>
							<td>
							<c:set var="mPhone" value="${ loginUser.mPhone }"/> 
							<input type="text" class="phone" id="phone1" maxlength="3" value="${fn:substring(mPhone,0,3)}"> - 
							<c:choose>
							    <c:when test="${fn:length(mPhone) > 12}">
							    	<input type="text" class="phone" id="phone2" maxlength="4" value="${fn:substring(mPhone,4,8)}"> - 
									<input type="text" class="phone" id="phone3" maxlength="4" value="${fn:substring(mPhone,9,13)}"> 
							    </c:when>
							    <c:otherwise>
							        <input type="text" class="phone" id="phone2" maxlength="4" value="${fn:substring(mPhone,4,7)}"> - 
									<input type="text" class="phone" id="phone3" maxlength="4" value="${fn:substring(mPhone,8,12)}"> 
							    </c:otherwise>
							</c:choose>
							</td>
						</tr>
						<c:choose>
							<c:when test="${ loginUser.mType == 3 }">
							   <tr id="birth" style="display: none;"> 
							</c:when>
							<c:otherwise>
							   <tr>
							</c:otherwise>
						</c:choose>
							<td>생년월일</td>
							<td><input type="text" name="birth" maxlength="6" value="${ loginUser.birth }"></td>
						</tr>
						<c:choose>
							<c:when test="${ loginUser.mType == 3 }">
							   <tr style="display: none;"> 
							</c:when>
							<c:otherwise>
							   <tr>
							</c:otherwise>
						</c:choose>
							<td>성별</td>
							<td><input type="radio" class="gender" id="radio1"
								name="gender" value="F"<c:if test="${ loginUser.gender eq 'F' }">checked</c:if>> 
								<label for="radio1">여자</label>
								<input type="radio" class="gender" id="radio2" name="gender"
								value="M"<c:if test="${ loginUser.gender eq 'M' }">checked</c:if>>
								<label for="radio2">남자</label></td>
						</tr>
					</table>
					<input type="button" id="update"class="btn-ghost green" value="수정">
					<input type="text" name="mPhone" style="display:none">
				</form>
			</div>
		</div>
			<script>

		var checkAry = [true,false,false,false,false,false,false];

		var ng = "양식이 맞지 않습니다.";
		var tGreen = ({"color" : "green"});
		var tRed = ({"color" : "red"});
		var red = ({"border" : "2px solid  red"});
		var green = ({"border" : "2px solid rgb(130, 180, 127, 0.7)"});

		$('input').on("keyup",function() {
			var put = $('td input');					
			var pwd = put.eq(1).val();				

			for (var i = 1; i < 9; i++) {				
				var check = false;				
				var cput = put.eq(i);				
				var vput = put.eq(i).val();				

				switch (i) {				
				case 1:check = (/^[a-zA-Z0-9]{8,12}$/).test(vput);break;			
				case 2:check = (pwd == vput);break;				
				case 3:check = (/^[가-힣]{2,}$/).test(vput);break;				
				case 4:check = (/([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/).test(vput);break;				
				case 5:check = (/^[0-9]{3}$/).test(vput);break;
				case 6:check = (/^[0-9]{3,4}$/).test(vput);break;
				case 7:check = (/^[0-9]{4}$/).test(vput);break;
				case 8:check = (/^[0-9]{6}$/).test(vput);break;
				}

				if (check == false) {				
				checkAry[i] = false;					
				cput.css(red);					
				console.log(checkAry);					
				break;					
				} else {				
				checkAry[i] = true;						
				cput.css(green);					
				console.log(checkAry);					
				}
			}
		});

		$('#update').on("click",function() {
			$('input[name=mPhone]').val($('#phone1').val() +"-"+ $('#phone2').val()+"-"+$('#phone3').val());
			 if($('#birth').css('display') == 'none'){
				 checkAry[8] = true;
		        }
			
			if ($.inArray(false, checkAry) >= 0) {	
				alert("다시 확인 해 주세요.");	
				return false;	
			} else {	
				$("#update_form").attr({action : 'mupdate.do',method : 'post'}).submit();
				return true;	
			}
		});
		</script>
	<jsp:include page="../common/footer.jsp" />
</body>
</html>