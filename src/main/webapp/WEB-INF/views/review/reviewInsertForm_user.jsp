<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ssakbaedal</title>
<style>
#section {
	width: 85%;
	height: 60%;
	float: left;
}

#storeImg {
	width: 150px;
	height: 150px;
}

.info-wrapper {
	width: 100%;
	height: 30%;
}

#text {
	width: 70%;
	height: 100%;
	margin: 0;
	font-size: 20px;
}

#star {
	width: 100px;
	height: 30px;
	font-size: 15px;
	color:rgb(255,194,0);
}

.file-wrapper {
	font-size: 20px;
	margin-top: 20px;
}

#addfile {
	width: 200px;
	height: 30px;
	padding-left: 10px;
}

.review-wrapper {
	margin-top: 30px;
}

#reviewText {
	width: 60%;
	height: 300px;
}

.btn-wrapper {
	margin-top: 20px;
}

#reviewBtn, #cancelBtn {
	width: 10%;
}

#countingArea {
	text-align: right;
	margin-right: 15%;
}

#addfileBtn {
	padding: 1%;
	width: 50px;
	height: 30px;
}

#reviewTable {
	border-collapse: collapse;
	background-color: white;
	width: 60%;
	overflow: hidden;
	border-radius: 5px;
	margin: auto;
}
</style>
</head>
<body>
	<div class="wrapper">
		<c:import url="../common/headerbar.jsp" />
		<section id="section">
			<c:import url="../common/nav_user.jsp" />

			<br><br>
			<div class="contents">
			<form action="rinsert.do" method="post" enctype="multipart/form-data">
				<input type="hidden" name="oNo" value="${ param.oNo }">
				<input type="hidden" name="mNo" value="${ loginUser.mNo }">
				
				<div class="info-wrapper">
					<table id="reviewTable">
						<tr rowspan="3">
							<td rowspan="4">
							<c:forEach var="at" items="${ o.attachment }">
								<c:if test="${ !empty at.originalFileName  }">
									<div id="storeImgArea">
										<img id="storeImg" src="${ contextPath }/resources/muploadFiles/logo/${ at.changeFileName }">
									</div>
								</c:if>
							</c:forEach>
							</td>
							<td style="font-size:12px;"><b>${ o.sName }(${ o.sTel })</b></td>
						</tr>
						<tr>
							<td>주문메뉴 : 
								<c:set var="comma" value="," />
								<c:forEach var="d" items="${ o.ODetail }" varStatus="status">
									<c:if test="${ !status.last }">
		                        		${ d.mnName }*${ d.odNum }${ comma } 
		                        	</c:if>
									<c:if test="${ status.last }">
		                        		${ d.mnName }*${ d.odNum }
		                        	</c:if>
								</c:forEach>
							</td>
						</tr>
						<tr>
							<td>별점 &nbsp;&nbsp;
								<select id="star" name="rStar">
										<option value="1">★☆☆☆☆</option>
										<option value="2">★★☆☆☆</option>
										<option value="3">★★★☆☆</option>
										<option value="4">★★★★☆</option>
										<option value="5">★★★★★</option>
								</select>
							</td>
						</tr>
						<tr>
							<td>
								<div class="imgArea">
									<div id="contentImgArea1" style="float: left;">
										<img id="contentImg1" width="80" height="80" name="newfile">
									</div>
									<div id="contentImgArea2" style="float: left;">
										<img id="contentImg2" width="80" height="80" name="newfile">
									</div>
									<div id="contentImgArea3" style="float: left;">
										<img id="contentImg3" width="80" height="80" name="newfile">
									</div>
								</div>
							</td>
						</tr>
					</table>
					<div id="fileArea">
						<input type="file" id="thumbnailImg1" name="uploadFile"
							onchange="loadImg(this,1)">
						<input type="file" id="thumbnailImg2" name="uploadFile"
							onchange="loadImg(this,2)">
						<input type="file" id="thumbnailImg3" name="uploadFile"
							onchange="loadImg(this,3)">
					</div>

					<div class="review-wrapper" align="center">
						<textarea id="rContent" name="rContent" cols="100" rows="6" style="resize: none"
							placeholder="내용을 작성해주세요. 허위 리뷰일 경우 관리자에 의해 삭제되며 서비스 이용에 제한이 있을 수 있습니다."></textarea>
						<br>
						<div id="countingArea">
							<span style="color: #aaa; font-size: 10px;" id="counter">0/300자</span>
						</div>
					</div>
				</div>
				<br>
				<div align="center" class="btn-wrapper">
					<button type="submit" class="btn-ghost green" id="reviewBtn">등록</button>
					<button type="button" class="btn-ghost gray" id="cancelBtn" onclick="javascript:history.back();">취소</button>
				</div>
			</form>
			

				<script>
                    $(function() {
                        $('#rContent').keyup(function(e){
                            var content = $(this).val();
                            // console.log("content : " + content);
                            $(this).height(((content.split('\n').length + 1) * 1.5) + 'em');
                            $('#counter').html(content.length + '/300');

                            if (content.length > 300){
                                alert("최대 300자까지 입력 가능합니다.");
                                $(this).val(content.substring(0, 300));
                                $('#counter').html("(" + content.length + "/300)");
                                $("#reviewBtn").attr("disabled","disabled");
                            }
                        });
                        $('#rContent').keyup();
                    });
                </script>

				<script>
					$(function() {
						// input type="file" 태그를 숨김
						$("#fileArea").hide();

						// div를 클릭하면 input type="file"이 클릭 되도록 처리
						$("#contentImgArea1").click(function() {
							$("#thumbnailImg1").click();
						});

						$("#contentImgArea2").click(function() {
							$("#thumbnailImg2").click();
						});

						$("#contentImgArea3").click(function() {
							$("#thumbnailImg3").click();
						});

					});

					// div에 미리보기 표현하기
					function loadImg(value, num) {
						// value => this : input type="file"
						// num => 각 번호에 맞춰  적용 div 결정하기

						// file이 존재한다면
						if (value.files && value.files[0]) {
							// 파일을 읽어들일 수 있는 FileReader 객체 생성
							var reader = new FileReader();

							// 파일 읽기가 다 완료 되었을 때 실행 되는 메소드
							reader.onload = function(e) {
								switch (num) {
								case 1:
									$("#contentImg1").attr("src", e.target.result);
									break;
								case 2:
									$("#contentImg2").attr("src", e.target.result);
									break;
								case 3:
									$("#contentImg3").attr("src", e.target.result);
									break;
								}
							}

							// 파일 읽기 하는 메소드
							reader.readAsDataURL(value.files[0]);
						}
					}
				</script>
			</div>
		</section>

		<c:import url="../common/sidemenu_user.jsp" />

	</div>
	<br><br>

	<c:import url="../common/footer.jsp" />
</body>
</html>