<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
        
        section {
            width: 100%;
            height: 60%;
            float: left;
        }
        
        /* .contents {
            margin-top: 1%;
            padding: 3%;
            border: 1px solid lightgray;
            height: 100%;
        } */
        
        .contents {
            margin-top: 1%;
            padding: 3%;
            border: 1px solid lightgray;
            height: 100%;
            display: inline-block;
        }
        
        
        .sinfoTable {
        	border-collapse: collapse;
            background-color: #F2F2F2;
            width: 60%;
            overflow: hidden;
            border-radius: 5px;
        }

 		
        #storeArea {
            width: 650px;
            float: left;
            margin-bottom: 1%;
            background-color: #F2F2F2;
            padding: 0.5em;
        }

        #menuArea {
            width: 650px;
            float: left;
        }

        #basketArea {
            width: 400px;
            display: inline-block;
            margin-left: 5%;
        }

        #basketList {
            margin: 0;
            width:100%;
            border: 1px solid lightgray;
        }

        /* 탭 */
        .tabs {
            display: flex;
            flex-wrap: wrap;
            width: 100%;
        }

        .tabs label {
            width:33%;
            order: 1;
            display: block;
            padding:10px 0px;
            text-align:center;
            cursor: pointer;
            background: lightgray;
            font-weight: bold;
            border-radius: 3px;
            transition: background ease 0.2s;
        }

        /*박스배경*/
        .tabs .tab {
            order: 99;
            flex-grow: 1;
            width: 100%;
            display: none;
            padding: 1rem;
            background: #F2F2F2;
            border-radius: 3px;
        }

        .tabs input[type="radio"] {
            display: none;
        }

        /*탭 눌렀을때 컬러*/
        .tabs input[type="radio"]:checked + label {
            background: rgb(64, 64, 64);
            color: white;
        }

        .tabs input[type="radio"]:checked + label + .tab {
            display: block;
        }

        #writeReviewBtn {
            background-color: rgb(64, 64, 64);
            color: white; 
            padding: 0;
            font-size: 10px;
            width: 60px;
            height: 30px;
        }

        #reportBtn {
            background-color: rgb(64, 64, 64);
            color: white;
            padding: 0;
            font-size: 10px;
            width: 40px;
            height: 30px;
        }

        #deleteBtn{
            padding: 0;
            font-size: 10px;
            width: 40px;
            height: 30px;
        }

        /* 수량 */
        .value-button {
            display: inline-block;
            border: 1px solid #ddd;
            margin: 0px;
            width: 10px;
            height: 10px;
            text-align: center;
            vertical-align: middle;
            padding: 5px 0;
            background: #eee;
            -webkit-touch-callout: none;
            -webkit-user-select: none;
            -khtml-user-select: none;
            -moz-user-select: none;
            -ms-user-select: none;
            user-select: none;
        }

        .value-button:hover {
            cursor: pointer;
        }

        #qty {
            text-align: center;
            border: none;
            margin: 0px;
            width: 20px;
            height:20px;
        }

        input[type=number]::-webkit-inner-spin-button,
        input[type=number]::-webkit-outer-spin-button {
            -webkit-appearance: none;
            margin: 0;
        }

        #storeImgArea {
            width:100px;
            height:100px;
            border: 1px solid black;
        }

        #imgArea {
            width:100px;
            height:100px;
            border: 1px solid black;
            margin:auto;
        }
        #menuList {
            width: 100%;
            margin: auto;
            border: 1px solid black;
        }

        #menuList tr {
            border-bottom: 1px solid lightgray;
        }
        
        #menuImg {
            width:60px;
            height:60px;
            border: 1px solid black;
            margin:auto;
        }

        #addCartBtn{
            padding: 0;
            width:20px;
            height: 20px;
            border-radius: 5px;
        }

</style>


</head>
<body>
	<div class="wrapper">
        <c:import url="../common/headerbar.jsp"/>
        
        <section >
            
            <div class="contents">
            	
            	<div id="storeArea">
                    <table class="sinfoTable">
                        <tr>
                            <td rowspan="5" style="width:25%">
                                <div id="storeImgArea">
                                	<img id="storeImg" width="100px" height="100px" src="${ contextPath }/resources/logoUploadFiles/${atLogo.changeFileName}">
                                </div>
                            </td>
                            <td width="25%" style="font-size:14px"><b>${store.sName}</b></td>
                        </tr>
                        <tr>
                            <td>별점 4.5</td>
                            <td>리뷰 n개</td>
                        </tr>
                        <tr>
                            <td>최소주문금액</td>
                            <td>${ store.minPrice }원</td>
                        </tr>
                        <tr>
                            <td>배달 요금</td>
                            <td>${ store.deliveryCharge }원</td>
                        </tr>
                        <tr>
                            <td>카테고리</td>
                            <td>${ store.sCategory }</td>
                        </tr>
                    </table>
                </div>
                    
                <div id="menuArea">
                    <div class="tabs">
                        <input type="radio" name="tabs" id="tab1" checked="checked">    
                            <label for="tab1">메뉴</label>
                            <div class="tab">
                            <c:forEach var="menuList" items="${ menuList }" varStatus="vs">
                                <table id="menuList" class="sinfoTable" border="1">
                                    <tr>
                                        <td width="50%" id="mnName">${ menuList.mnName }</td>
                                        <td width="20%" id="mnPrice" style="text-align:right;">${ menuList.mnPrice }</td>
                                        <td>
                                        	<div id="menuImg">
	                                            <img width="60px" height="60px" src="${ contextPath }/resources/menuUploadFiles/${atMenuList[vs.index].changeFileName}">
	                                        </div>
                                        </td>
                                        <td width="5%">
                                            <button onclick="addCart();" id="addCartBtn" class="btn-ghost green">+</button>
                                        </td>
                                    </tr>
                                                                       
                                </table>
                            </c:forEach>
                            </div>
                        <!-- 버튼 클릭 시 한 행 추가 -->
                        <script>
                            function addCart(obj) {
                                var mnName = $("#mnName").html();
                                var mnPrice = $("#mnPrice").html();
                                
                                console.log(mnName);
                                console.log(mnPrice);

                                $('#basketList > tbody:last').append('<tr ><td rowspan=3>안녕ㅋ 친구들ㅋ </td></tr>');
                        }
                        </script>       
                        <input type="radio" name="tabs" id="tab2">    
                            <label for="tab2">매장정보</label>
                            <div class="tab">
                                <h3>사장님 알림</h3>
                                <hr>
                                <p style="font-size:12px;">${ store.sInfo }</p>
                                <br><br><br>

                                <h3>업체정보</h3>
                                <hr>
                                <table class="sinfoTable">
                                    <tr>
                                        <td>영업시간</td>
                                        <td>${ store.openTime }</td>
                                    </tr>
                                    <tr>
                                        <td>전화번호</td>
                                        <td>${ store.sTel }</td>
                                    </tr>
                                    <tr>
                                        <td>주소</td>
                                        <td>${ store.sAddress }</td>
                                    </tr>
                                </table>
                                <br><br><br>

                                <h3>사업자정보</h3>
                                <hr>
                                <table class="sinfoTable">
                                    <tr>
                                        <td>상호명</td>
                                        <td>${ store.sName }</td>
                                    </tr>
                                    <tr>
                                        <td>사업자등록번호</td>
                                        <td>${ store.sNo }</td>
                                    </tr>
                                </table>
                                <!-- <br><br><br>

                                <h3>원산지정보</h3>
                                <hr>
                                <p style="font-size:12px;">밀가루(국내산).....</p> -->
                            </div>
                                        
                        <input type="radio" name="tabs" id="tab3">    
                            <label for="tab3">리뷰</label>
                            <div class="tab">
                                <div align="right" style="margin-right:3%">
                                    <button id="writeReviewBtn" class="btn-ghost gray">리뷰 작성</button>
                                </div>
                                <h1 style="text-align:center;">총 <span style="color:rgb(130, 180, 127)">n</span>개의 리뷰가 작성되었습니다.</h1>
                                <hr>
                                <table id="reviewArea" class="sinfoTable" style="width:100%">
                                    <tr>
                                        <td style="width:60%">asd**님</td>
                                        <td>★★★★★</td>
                                        <td style="width:15%">2020-10-27</td>
                                        <td>
                                            <button id="reportBtn" class="btn-ghost gray">신고</button>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="2" id="reviewContent">
											살 수 굳세게 별과 얼마나 것은 쓸쓸하랴? 스며들어 소담스러운 맺어, 천자만홍이 봄바람이다. 그것을 얼마나 귀는 들어 청춘의 곳으로 아니다. 창공에 내려온 풀밭에 끝까지 밥을 안고, 위하여, 곳으로 속에서 것이다. 천고에 청춘의 실로 같은 석가는 모래뿐일 우는 가는 더운지라 황금시대다. 관현악이며, 유소년에게서 뛰노는 보이는 많이 불어 끝에 기관과 천고에 쓸쓸하랴? 뭇 열락의 얼마나 살 날카로우나 길을 어디 우리 때문이다. 만천하의 장식하는 위하여 있으랴? 품고 피가 피부가 위하여, 목숨이 공자는 이 창공에 칼이다. 청춘을 하는 그
                                            <input value="더보기" onclick="more();" type="button" id="moreBtn">
                                        </td>
                                        <td colspan="2">
                                            <div class="imgArea">
                                                <img id="reviewImg1" width="50" height="50">
                                                <img id="reviewImg2" width="50" height="50">
                                                <img id="reviewImg3" width="50" height="50">
                                            </div>
                                        </td>
                                    </tr>
                                </table>
                                <script>
                                    $(document).ready(function(){
                                        
                                    });
                                </script>
                            </div>
                    </div>
                </div>

                <div id="basketArea">
                    <table id="basketList">
                        <thead>
                            <tr>
                                <td colspan="2" style="text-align:center; background-color:rgb(192, 211, 192);">
                                    <h1 style="margin:0.3em; color: rgb(64, 64, 64)">주문표</h1>
                                </td>
                            </tr>
                        </thead>
                        <tbody>
                        <tr>
                            <td id="mName">
                               	후라이드 치킨<br>
                            </td>
                            <td style="text-align:right;">
                                <h4 id="mPrice" style="margin:0;">14000</h4><br>
                                <div class="value-button" id="decrease" onclick="decreaseValue()" value="Decrease Value">-</div>
                                <input type="number" id="qty" value="0" />
                                <div class="value-button" id="increase" onclick="increaseValue()" value="Increase Value">+</div>
                                <button onclick="deleteLine(this);" class="btn-ghost green" id="deleteBtn">삭제</button>
                            </td>
                        </tr>
                        </tbody>
                        <tr>
                            <td colspan="2" style="text-align:right;"><br><br>
                                <h1 style="color:red" id="priceSum">합계 : 0원</h1>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2" style="text-align:center;">
                                <br>
                                <button class="btn-ghost red">주문</button>
                            </td>
                        </tr>
                    </table>
                    <!-- 삭제 버튼 클릭 시 한 행 삭제-->
                    <script>
                        function deleteLine(obj) {
                            var tr = $(obj).parent().parent();
                         
                            // 라인 삭제
                            tr.remove();
                        }
                    </script>
                </div>
                <script>
                    function increaseValue() {
                        var value = parseInt(document.getElementById('qty').value, 10);
                        value = isNaN(value) ? 0 : value;
                        value++;
                        document.getElementById('qty').value = value;
                    }

                    function decreaseValue() {
                        var value = parseInt(document.getElementById('qty').value, 10);
                        value = isNaN(value) ? 0 : value;
                        value < 1 ? value = 1 : '';
                        value--;
                        document.getElementById('qty').value = value;
                    }
                </script>
                <!-- 합계 계산 -->
                <script>
                    $(function(){
                        var price = parseInt($("#mPrice").html());

                        $("#qty").change(function(){
                            var qty = $("#qty").html();
                            console.log(qty);
                        })
                        console.log(price);

                        var sum = price * qty;
                        $("#priceSum").html("합계 : " + sum + "원");
                    });
                </script>
                
            </div>
            
        </section>

    </div>
    
    <c:import url="../common/footer.jsp"/>
</body>
</html>