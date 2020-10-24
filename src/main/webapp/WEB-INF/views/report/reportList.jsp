<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ssakbaedal</title>
<style>
	#section {
		width: 100%;
		height: 60%;
		float: left;
	}
	
	#reportList {
		width: 80%;
	}
</style>
</head>
<body>
	<div class="wrapper">
        <c:import url="../common/headerbar.jsp"/>
        
        <section >
            <c:import url="../common/nav_admin.jsp"/>
            
            <div class="contents" align="center">
                <h1 style="font-size:28px">회원 관리</h1>
                <br>
                <table align="center" id="reportList">
                    <tr>
                        <th width="10%"></th>
                        <th width="15%">회원번호</th>
                        <th width="25%">회원ID</th>
                        <th width="25%">회원상태</th>
                        <th width="15%">신고횟수</th>
                    </tr>
                    <tr>
                        <td><input type="checkbox"></td>
                        <td>3</td>
                        <td>admin</td>
                        <td>활동</td>
                        <td>0</td>
                    </tr>
                    <tr>
                        <td><input type="checkbox"></td>
                        <td>3</td>
                        <td>admin</td>
                        <td>활동</td>
                        <td>0</td>
                    </tr>
                    <tr>
                        <td><input type="checkbox"></td>
                        <td>3</td>
                        <td>admin</td>
                        <td>활동</td>
                        <td>0</td>
                    </tr>
                    <tr>
                        <td><input type="checkbox"></td>
                        <td>3</td>
                        <td>admin</td>
                        <td>활동</td>
                        <td>0</td>
                    </tr>
                </table>  
                <br><br><br>
                <div class="pagingArea" align="center" style="font-size:14px;">
                        [이전] [1][2][3][4][5] [다음]
                    </div>        
                <br><br>
                <div>
                    <button class="btn-ghost gray">반영</button>
                </div>
                <script>
                    // 상세보기
                    $(function(){
                        $("#reportList td").mouseenter(function(){
                            $(this).parent().css({"background":"lightgrey", "cursor":"pointer"});
                        }).mouseout(function(){
                            $(this).parent().css({"background":"white"});
                        }).click(function(){
                            var rId = $(this).parent().children().eq(0).text();
                        });
                    })
                
                </script>
            </div>
        </section>

    </div>
    
    <c:import url="../common/footer.jsp"/>
</body>
</html>