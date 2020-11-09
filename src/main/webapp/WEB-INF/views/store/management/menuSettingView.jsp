<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>        
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
            left: 1230px;
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





        .menuTable {
            margin-top: 60px;
            width: 80%;
            border-spacing: 0;
            text-align: center;
            font-size: 20px;
            margin: 50px auto;
        }

        .menuTable td,
        .menuTable th {
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

        #saveBtn {
            width: 100px;
        }

        #menuTitle {
            font-size: 20px;
            font-weight: bold;
        }

        #menualert {
            margin-left: 100px;
            color: rgb(240, 68, 91);
        }

               .stinfo {
            font-size: 15px;
            margin-left: 30px;
            width: 150px;
            height: 30px;
            margin-top: 30px;
        }
        

        /* #updateinfo {
            text-align: center;
            margin-top: 10px;
            margin-bottom: 10px;
        } */


        #best, #setMenu, #insertMenu,#sinfo,#deleteMenu  {
            font-size: 20px;
            font-weight: bold;
        }

        #bestwrapper {
            margin-bottom: 50px;
        }

        .BestMenu {
            margin: 5px;
            font-size: 14px;
            margin-top:40px; 
        }

        #sOff {
            margin-left: 42px;
        }

        #spanwrapper, #setwrapper, #inputwrapper, #bestwrapper{
            margin-left: 40px;
            margin-bottom: 20px;
        }

        .updateMenuname, .updateMenuprice  {
            text-align: center;
            width: 130px;
            height: 20px;
        }
        .btn-ghost.gray.si {
            width: 150px;
            height: 40px;
            padding-top: 5px;
        }
        
        #menuAddBtn, #upBtn, #insertSetBtn {
        	width: 100px;
            height: 40px;
            padding-top: 5px;
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
        
          #btnla, #btnup {
            font-size: 15px;
            padding: 5px;
            display: inline-block;
            margin-left: 10px;
            margin-top:20px;
        }
        
            #imgchangeBtn {
            margin-top: 10px;
            
        }
        
        .menuImg {
        	width:100px;
        	height:100px;
        }
        
     .filebox .upload-name {
    display: inline-block;
    width: 200px;
    height: 20px;
    font-size:10px;
    color: gray;
    vertical-align: middle;
    border-radius: 5px;
    border: 1px solid  lightgray;

    }
    </style>
</head>
<body >
<script>
function load() {
	history.go(0);
}
</script>


    <div class="wrapper">
    
      	<c:import url="../../common/headerbar.jsp"/>

        <section>
            <c:import url="../../common/nav_store.jsp"/>


            <div class="contents" align="center">
                <p id="menuTitle">품절관리</p>
                <p align="left" id="menualert">
                -메뉴 품절의 체크박스를 체크하면 품절처리 됩니다.<br>
                -메뉴 품절처리는 품절 해제하지 전까지 품절처리 됩니다.<br>
                -하루품절에 체크하면 하루이후에 자동으로 체크가 없어집니다.
                </p>
                <div class="tableWrapper" align="center">
                    <table class="menuTable", id="insertTable">
                    <thead>
                        <tr>
                        	<th>메뉴번호</th>
                            <th>메뉴명</th>
                            <th>가격</th>
                            <th>품절여부</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach var="menu" items="${menu}" varStatus="m">
                        <tr>
                        	<td>${menu.mnNo}</td>
                            <td>${menu.mnName}</td>
                            <td>${menu.mnPrice}</td>
                            <td>
                            <c:if test="${menu.mnStatus eq 'N'}">
                            	장기품절<input type="checkbox" name="soldout" class="ssoldout" value="long" checked >
                            </c:if>
                            <c:if test="${menu.mnStatus eq 'Y'}">
                            	장기품절<input type="checkbox" name="soldout" class="ssoldout" value="long" >
                            </c:if>
                            </td>
                        </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                </div>
                
                <script>

	                var mnno;
					$("#insertTable tbody tr").click(function() {
						mnno = $(this).children().eq(0).text();
					});
                	           
                	$("input[name=soldout]").change(function() {
                		if($(this).prop("checked")) {
                			$("input[name=soldout]").prop("checked", false);
                			$(this).prop("checked", true);
                			var a = $(this).attr("value");
                			select(a);
                		} else {
                			$(this).prop("checked", false) 
                				sale();
                		}
                	});
                	
                	
                	
                	function select(select) {
    					
						alert("품절처리되었습니다.");
						
                			 $.ajax({
                				url:"updateSoldout.do",
                				data:{mnno:mnno, select:select},
                				sucess:function(data) {
                					console.log(data);
                				}, 
                				errer:function(e) {
                					console.log(e);
                				}
                			}); 
    			
    					}
                	
                	function sale() {
                		alert("품절해제되었습니다.");
                		 
                		console.log(mnno);
                		
                		$.ajax({
                			url:"updateSale.do",
                			data:{mnno:mnno},
                			success:function(data) {
                				console.log(data);
                			},
                			error:function(e) {
                				console.log(e);
                			}
                		})
                		
                		
                	}
                
                </script>
                
                    <hr>
                    
                    <form action="menuInsert.do" method="post" enctype="multipart/form-data">
                    <div id="inputwrapper" align="center">
                        <div style="margin-top:30px;" align="center"><span id="insertMenu">메뉴등록</span></div><br>
                        
                        <span>메뉴명</span><input id="sMenu" class="stinfo" name="mnName"><br>
						<span>가격</span><input id="sPrice" class="stinfo" name="mnPrice"><br>
                            하위 카테고리 명 
							<select  class="stinfo" name="smallCate" >
								<option value="단품메뉴">단품메뉴</option>
								<option value="사이드">사이드</option>
								<option value="음료">음료</option>
							</select>
							<br>
                            
	                        <div id="changeWrapper" align="center" style="margin-top: 10px;" class="filebox">
                                    
                                    <input type="file" id="imgchangeBtn" name="mupFile" >
                                     <label for="imgchangeBtn" id="file-name"></label>
                                    <label for="imgchangeBtn" id="btnla" class="btn-ghost green" >파일선택</label>
                            </div>
                            
	                        <br><br><br>
                       <input type="submit" class="btn-ghost gray" value="메뉴추가" id="menuAddBtn"> 
                        </div>
                        <br><br>
                    </form>
                    
                    
				<script>
					
					$('input[type=file]').on('change',function(){

					    if(window.FileReader){

					      var filename = $(this)[0].files[0].name;

					    } else {

					      var filename = $(this).val().split('/').pop().split('\\').pop();

					    }

					    $(this).siblings('#file-name').text(filename);
					    $("input[name=originalFileName]").val(filename);
					    

					  });



				
				</script>
                                           
					<table class="menuTable" id="menuvTable">
                        <thead>
                            <tr>
                            	<th>메뉴번호</th>
                                <th>메뉴명</th>
                                <th>가격</th>
                                <th>메뉴 하위 카테고리</th>
                            </tr>
                          </thead>
                          <tbody>
                          <c:forEach var="menu" items="${menu}" varStatus="m">
                          	<tr>
                          		<td>${menu.mnNo }</td>
                          		<td>${menu.mnName}</td>
                          		<td>${menu.mnPrice}</td>
                          		<td>${menu.smallCate}</td>
                          	</tr>
                          </c:forEach>
                          </tbody>
                        </table>
                    
                    
                    <hr>
						
					 <div style="margin-top:30px;" align="center"><span id="deleteMenu">메뉴삭제/수정</span></div><br>	
                    <div class="tableWrapper" align="center">
                        <table class="menuTable" id="deleteTable">
                        <thead>
                            <tr>
                            	<th>메뉴번호</th>
                                <th>메뉴명</th>
                                <th>가격</th>
                                <th>삭제여부</th>
                            </tr>
                          </thead>
                          <tbody>
                          <c:forEach var="menu" items="${menu}" varStatus="m">
                          	<tr>
                          		<td>${menu.mnNo }</td>
                          		<td>${menu.mnName}</td>
                          		<td>${menu.mnPrice}</td>
                          		<td><button type="button" class="btn-ghost gray" onclick="del(this);">삭제</button></td>
                          	</tr>
                          </c:forEach>
                          </tbody>
                        </table>
                    </div>
                    
                    <script>
		                var mnno;
						$("#deleteTable tbody tr").click(function() {
							mnno = $(this).children().eq(0).text();
							console.log(mnno);
						});
						
						
						function del(obj) {
							var con = confirm("정말로 삭제하시겠습니까?\n 삭제하면 되돌릴 수 없고, 다시 메뉴 등록해야합니다.");
							if(con) {
								console.log("mnno" + mnno);
								
								 $.ajax({
										url:"deleteMenu.do",
										data:{mnno:mnno},
										success:function(data) {
											console.log(data);
											 
										},
										error:function(e) {
											console.log(e);
										}
									}); 
								 
								 var tr = $(obj).parent().parent();
								 tr.remove();
								
							} else {
								alert("삭제되지않았습니다.");
							}		
			
						}
                    </script>
                    
					<form action="menuUpdate.do" method="post"  enctype="multipart/form-data">
                    <div class="tableWrapper" align="center">
                        <table class="menuTable" id="upTable" >
                        <thead>
                            <tr>
                            	<th>메뉴번호</th>
                                <th>메뉴명</th>
                                <th>가격</th>
                                <th>사진</th>
                            </tr>
                          </thead>
                          <tbody>
                          	<c:forEach var="menu" items="${menu}" varStatus="index">
                          		<tr>
                          			<td><input type="text" value="${menu.mnNo}" name="menuList[${index.index}].mnNo" readonly style="border:none; width:30px; text-align:center;"></td>
                          			<td><input type="text"  value="${menu.mnName}"  name="menuList[${index.index }].mnName"></td>
                          			<td><input type="text" value="${menu.mnPrice}" name="menuList[${index.index }].mnPrice"></td>
									<td>
										<input type="text" value="${menu.mnNo }" name="refId" style="display:none;" >
		                       			 <div id="changeWrapper" align="center"  class="filebox">
		                                    <input type="file" name="menuUpFile" id="imgupBtn${index.index }" multiple="multiple">
		                                     <label for="imgupBtn${index.index }" class="filename"></label>
		                                    <label for="imgupBtn${index.index }"  class="btn-ghost green"  style="font-size: 15px; padding: 5px; display: inline-block; margin-left: 10px; ">파일선택</label>
	                            		</div>
									</td>
                          		</tr>
                          	</c:forEach>
                          	<tr colspan="4"></tr>
                          </tbody> 
                        </table>
                        <input type="submit" value="수정" class="btn-ghost gray" id="upBtn">
                    </div>
                    </form>
                    <script>
				
					
					$('input[type=file]').on('change',function(){

					    if(window.FileReader){

					      var filename = $(this)[0].files[0].name;

					    } else {

					      var filename = $(this).val().split('/').pop().split('\\').pop();

					    }

					    $(this).siblings('.filename').text(filename);
					    
					  });



				
				</script>
                    
                    <br><br>
                    <hr style="margin-bottom:40px;">
                    <div id="bestwrapper" align="left">
                        <div align="center"><span id="best">대표 메뉴 관리</span></div>
                        <table class="menuTable" id="bestTable">
                        <thead>
                            <tr>	
                            	<th>메뉴번호</th>
                                <th>메뉴명</th>
                                <th>가격</th>
                                <th>대표메뉴</th>
                            </tr>
                          </thead>
                          <tbody>
                          	<c:forEach var="menu" items="${menu}">
                          		<tr>
                          			<td>${menu.mnNo}</td>
                          			<td>${menu.mnName}</td>
                          			<td>${menu.mnPrice}</td>
                          			<td>
                          				<c:if test="${!empty menu.mnCategory}"><input type="checkbox" name="checkbest" checked></c:if>
                          				<c:if test="${empty menu.mnCategory}"><input type="checkbox" name="checkbest"></c:if>
                          			</td>
                          		</tr>
                          	</c:forEach>
                          </tbody>  
                        </table>
                    </div>
                    
                    <script>
		                var mnno;
						$("#bestTable tbody tr").click(function() {
							mnno = $(this).children().eq(0).text();
						});
						
						$("input[name=checkbest]").change(function() {
							
							if($(this).prop("checked")) {
								alert("대표메뉴 등록");
								
								$.ajax({
									url:"upbest.do",
									data:{mnno:mnno},
									success:function(data) {
										console.log(data);
									},
									error:function(e) {
										console.log(e)
									}
								});
								
							} else if($(this).prop("checked",false)) {
								alert("대표메뉴 등록 해제");
								
								$.ajax({
									url:"delbest.do",
									data:{mnno:mnno},
									success:function(data) {
										console.log(data);
									},
									error:function(e) {
										console.log(e)
									}
								});
							}
						});

                    </script>
                    
                    
                    
                    
                    
                <hr style="margin-bottom:40px;">
                <div id="setwrapper" align="left">
                    <br>
                    <form action="insertSet.do" method="post">
                    <div align="center"><span id="setMenu">세트 메뉴 관리</span></div>
                    <span>세트이름</span><input type="text" class="stinfo" name="setName">
                    <table class="menuTable" id="setTable">
                        <thead>
                        <tr>
                        	<th>메뉴번호</th>
                            <th>메뉴명</th>
                            <th>가격</th>
                            <th>체크</th>
                        </tr>
						</thead>
						<tbody>
							<c:forEach var="menu" items="${menu}">
								<tr>
									<td>${menu.mnNo}</td>
									<td>${menu.mnName }</td>
									<td>${menu.mnPrice}</td>
									<td><input type="checkbox" name="checkset"  value="${menu.mnPrice}" ></td>
								</tr>
							</c:forEach>
						</tbody>
                    </table>
                    <input type="hidden" name="sumMnno">
                    <span>총가격</span><input id="mnprice" name="mnprice" id="setSum" style="width:150px; height:30px; margin-left:40px;">
                    <br>
                    <div align="center"><input type="submit" id="insertSetBtn" class="btn-ghost gray" value="세트등록"></div>
               	</form>
               	
               		<div id="setWrapper">
               			 <table class="menuTable" id="setTable">
                        <thead>
                            <tr>	
                            	<th>세트메뉴 번호</th>
                                <th>메뉴명</th>
                                <th>가격</th>
                                <th>세트메뉴내역</th>
                                <th>삭제</th>
                            </tr>
                          </thead>
                          <tbody>
                          	<c:forEach var="set" items="${set}">
                          		<tr>
                          			<td>${set.smNo}</td>
                          			<td>${set.smName}</td>
                          			<td>${set.setPrice}</td>
                          			<td>${set.setList }</td>
                          			<td><input type="checkbox" name="setdel"></td>
                          		</tr>
                          	</c:forEach>
                          </tbody>  
                        </table>
               		</div>
               	
               	
                </div>
                </div>
            </div>
    </div>
    
    <script> 
/*     function load() {
    	history.go(0);
    }
      */
    var smno;
	$("#setTable tbody tr").click(function() {
		smno = $(this).children().eq(0).text();
		console.log(smno);
	});
	
	$("input[name=setdel]").change(function() {
		
		if($(this).prop("checked")) {
			
			var con = confirm("정말로 삭제하시겠습니까?");
			
			if(con) {
					$.ajax({
						url:"setdel.do",
						data:{smno:smno},
						success:function(data) {
							console.log(data);
							
							$tableBody = $("#bordTable tbody");
							$tableBody.html("");
							
							 for(var i in data) {
								var $tr = $("<tr>");
								
								var $smNo = $("<td>").val(data[i].smNo);
								var $smName = $("<td>").text(data[i].smName);
								var $setPrice = $("<td>").text(data[i].setPrice);
								var $setList = $("<td>").text(data[i].setList);

								
								$tr.append($smNo);
								$tr.append($smName);
								$tr.append($setPrice);
								$tr.append($setList);
								
								$tableBody.append($tr);
								
								load();
							} 
						},
						error:function(e) {
							console.log(e)
						}
					});	
				
				
			} else {
				$(this).prop("checked", false);
			}
		} 
	});
    
    	if($("input[name=setName]").attr("value") == "") {
    		alert("세트메뉴 이름을 입력해주세요");
    	}
    	
	    var mnno;
	    var mnprice;
	    var mnname;
	    

		var i = 1;
	    
		$("#setTable tbody tr").click(function() {
			
			mnno = $(this).children().eq(0).text();
			mnprice = $(this).children().eq(2).text();	
			
		});
		

		var pricesum = 0;
		var noList = "";
		
			$("input[name=checkset]").change(function() {
				var value = $(this).attr("value");
				if($(this).prop("checked")) {
					var a = parseInt(value);
					pricesum += a;
					
					noList += mnno+",";
					console.log(noList);
					
					$("input[name=mnprice]").val(pricesum);
					$("input[name=sumMnno]").val(noList);
					
				}else{
					var b = parseInt(value);
					pricesum -= b;
					
					noList = noList.replace(mnno+",","");
					console.log(noList);
					
					$("input[name=mnprice]").val(pricesum);
					$("input[name=sumMnno]").val(noList);
				}

			});	

    </script>
    
    
    

    </section>
    <div class="sidemenu">
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