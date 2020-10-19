<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<html>
<head>
<title>ssakbaedal</title>
<style>

	* {
	font-family: 'Nanum Gothic', sans-serif;
	margin: 0;
	padding: 0;
	}
	
	.contents {
	margin-top: 1%;
	/*padding: 3%;*/
	/*border: 1px solid lightgray;*/
	height: 100%;
	}
	    
	#search_area {
		height: 50px;
	}
	
	#searchValue {
		height: 40px;
		width: 280px;
		background-color: white;
		font-size: 15px;
		margin-top: 5px;
		margin-left: 37%;
	}
	
	li {
		list-style: none;
	}
	
	.slide_wrapper {
		position: relative;
		width: 960px;
		margin: 0 auto;
		margin-top: 10px;
		height: 200px;
		overflow: hidden;
		/*border: 1px solid lightgray;*/
		border-bottom: none;
	}
	
	.slides {
		position: absolute;
		left: 0;
		top: 0;
		transition: left 0.5s ease-out;
	}
	
	.slides li:not(:last-child ) {
		float: left;
		margin-right: 30px;
	}
	
	.slides li p {
		font-family: 'Motnserrat', sans-serif;
	}
	
	.slides li {
		overflow: hidden;
		transition: transform 1s;
	}
	
	.slides li:hover {
		transform: scale(1.05);
		cursor: pointer;
	}
	
	.controls {
		text-align: center;
		margin-left: 87px;
		width: 960px;
		/*border: 1px solid lightgray;*/
		border-top: none;
	}
	
	#main_title {
		width: 100%;
		height: 100px;
	}
	
	#prev {
		border-radius: 50%;
	}
	
	#next {
		border-radius: 50%;
	}
	
	#event_re_rank_container {
		/*border: 1px solid lightgray;*/
		margin-left: 87px;
		margin-top: 40px;
		width: 960px;
		/*height: 595px;*/
	}
	
	#recommend_area {
		margin-top: 10px;
		margin-left: 10px;
		width: 400px;
		height: 330px;
		float: left;
	}
	
	#rank_area {
		margin-top: 10px;
		margin-left: 549px;
		width: 400px;
		height: 330px;
	}
	
	.main_title {
		width: 400px;
		height: 30px;
		font-family: 'Motnserrat', sans-serif;
	}
	
	.main_recommend_rnak_img_area {
		margin-top: 10px;
		width: 400px;
		height: 300px;
		transition: transform 1s;
	}
	
	.main_recommend_rnak_img_area:hover {
		cursor: pointer;
		transform: scale(1.02);
	}
	
	#event_area {
		margin-top: 30px;
		margin-left: 10px;
		width: 937px;
		height: 210px;
	}
	
	#main_event_img_area {
		margin-top: 10px;
		width: 937px;
		height: 170px;
		transition: transform 1s;
	}
	
	#main_event_img_area:hover {
		cursor: pointer;
		transform: scale(1.02);
	}
	
</style>
</head>
<body>
<jsp:include page="common/headerbar.jsp" />
	<div class="wrapper">
        <br>
        <section>
            <div class="contents">
                <form action="#" name="#" method="GET">
                    <div id="search_area">
                        <input id="searchValue" type="search" name="searchValue" placeholder=" 먹고 싶은 메뉴, 가게 검색">
                        <button type="submit" id="search_btn" class="btn-ghost gray">검색</button>
                    </div>
                </form>

                <div class="slide_wrapper" align="center">
                    <ul class="slides">
                        <li>
                            <img src="./resources/img/total22.jpg" onclick="location.href='${contextPath}/tslist.do'">
                            <p>전체보기</p>
                        </li>
                        <li>
                            <img src="./resources/img/koreanfood6.jpg" onclick="location.href='${contextPath}/kslist.do'">
                            <p>한식</p>
                        </li>
                        <li>
                            <img src="./resources/img/chinafood2.jpg" onclick="location.href='${contextPath}/cslist.do'">
                            <p>중식집</p>
                        </li>
                        <li>
                            <img src="./resources/img/japanfood2.jpg" onclick="location.href='${contextPath}/jslist.do'">
                            <p>돈까스,회,일식</p>
                        </li>
                        <li>
                        	<img src="./resources/img/boonsik2.png" onclick="location.href='${contextPath}/sslist.do'">
                            <p>분식</p>
                        </li>
                        <li>
                            <img src="./resources/img/0330020014461.jpg" onclick="location.href='${contextPath}/chislist.do'">
                            <p>치킨</p>
                        </li>
                        <li>
                            <img src="./resources/img/westernfood2.jpg" onclick="location.href='${contextPath}/pslist.do'">
                            <p>피자</p>
                        </li>
                        <li>
                            <img src="./resources/img/fastfood2.jpg" onclick="location.href='${contextPath}/fslist.do'">
                            <p>패스트푸드</p>
                        </li>
                        <li>
                            <img src="./resources/img/asianfood2.jpg" onclick="location.href='${contextPath}/aslist.do'">
                            <p>아시안,양식</p>
                        </li>
                        <li>
                            <img src="./resources/img/jock2.jpg" onclick="location.href='${contextPath}/joslist.do'">
                            <p>족발,보쌈</p>
                        </li>
                        <li>
                            <img src="./resources/img/gob2.jpg" onclick="location.href='${contextPath}/yaslist.do'">
                            <p>야식</p>
                        </li>
                        <li> 
                            <img src="./resources/img/jjim2.jpg" onclick="location.href='${contextPath}/jjslist.do'">
                            <p>찜,탕</p>
                        </li>
                        <li> 
                            <img src="./resources/img/dosirak2.jpg" onclick="location.href='${contextPath}/doslist.do'">
                            <p>도시락</p>
                        </li>
                        <li>
                            <img src="./resources/img/cafe2.jpg" onclick="location.href='${contextPath}/cdslist.do'">
                            <p>카페/디저트</p>
                        </li>
                        <li>
                            <img src="./resources/img/cafe2.jpg" onclick="location.href='${contextPath}/testlist.do'">
                            <p>테스트</p>
                        </li>
                    </ul>
                </div>
                <p class="controls">
                    <button class="btn-ghost gray" id="prev" onclick="prev();">prev</button>
                    <button class="btn-ghost gray" id="next" onclick="next();">next</button>
                </p>

                <div id="event_re_rank_container">
                    <div id="recommend_area">
                        <div class="main_title">
                            <h1>추천</h1>
                        </div>
                        <div class="main_recommend_rnak_img_area">
                            <img src="./resources/img/recommend.png" width="400px" height="300px">
                        </div>
                    </div>

                    <div id="rank_area">
                        <div class="main_title">
                            <h1>랭크</h1>
                        </div>
                        <div class="main_recommend_rnak_img_area">
                            <img src="./resources/img/rank.png" width="400px" height="300px">
                        </div>
                    </div>

                    <div id="event_area">
                        <div class="main_title">
                            <h1>이벤트</h1>
                        </div>
                        <div id="main_event_img_area">
                            <img src="./resources/img/event123.PNG" width="937px" height="170" onclick="location.href='${contextPath}/elist.do'">
                        </div>
                    </div>
                    
    
                </div>
                
            </div>
        </section>
        <br><br>


    </div>
	<jsp:include page="common/footer.jsp" />
	<script>
        var slides = document.querySelector(".slides"),
            slide = document.querySelectorAll(".slides li"),
            currentIdx = 0,
            slideCount = slide.length,
            prevBtn = document.querySelector(".prev"),
            slideWidth = 300,
            slideMargin = 30,
            nextBtn = document.querySelector(".next");
            slides.style.width = (slideWidth + slideMargin) * slideCount - slideMargin + 'px';
        function moveSlide(num) {
            slides.style.left = -num * 330 + 'px';
            currentIdx = num;
        }
        
        function next(){
            if(currentIdx < slideCount - 3){
                moveSlide(currentIdx + 1);
                console.log(currentIdx)
            }else{
                moveSlide(0);
            }
        };
        function prev(){
            if(currentIdx > 0){
                moveSlide(currentIdx - 1);
                console.log(currentIdx)
            }else{
                moveSlide(slideCount - 3);
            }
        };
    </script>
</body>
</html>
