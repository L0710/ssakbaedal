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
            width:100%;
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
            /* border: 1px solid rgb(64, 64, 64);
            border-radius: 20px; */
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

        .groupBtn {
            margin-top: 100px;
        }


    </style>
</head>
<body>

    <div class="wrapper" align="center">
	<c:import url="../../common/headerbar.jsp"/>

        <section>
	<c:import url="../../common/nav_store.jsp"/>

            <div class="contents" align="center"  >
				<canvas id="canvas" width="700" height="350" ></canvas>
            </div>

			
    </div>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.6.0/Chart.js"></script>

<script>
    
    
   		var chartLabels = [];
   		var chartData = [];
    
		$.getJSON("chart.do", function(data) {
			
			$.each(data, function(inx, obj) {
				chartLabels.push(obj.month);
				chartData.push(obj.monthSum);
			});
			
			console.log("data");
			createChart();
			console.log("create Chart");
		});
   		
   		var barChartData = {
   				labels : chartLabels,
   				datasets : [
   					{
   						label : "월별 통계",
   						backgroundColor: [
   							'#ff7473',
   							'#ffc952',
   							'#47b8e0',
   							'#bd1550',
   							'#008c9e',
   							'#cbe86b',
   							'#bf209f',
   							'#55967e',
   							'#6a60a9',
   							'#fd999a',
   							'#a79c8e',
   							'#CE6D39'
   							],
   						borderColor: [
   							'transparent',
   							'transparent',
   							'transparent',
   							'transparent',
   							'transparent',
   							'transparent',
   							'transparent',
   							'transparent',
   							'transparent',
   							'transparent',
   							'transparent',
   							'transparent'
   							],	
   					borderWidth: 1,
   					 data : chartData
   						
   					}
   				]
   		}
   		
   		function createChart() {
   			console.log("function");
   			var ctx = document.getElementById("canvas").getContext("2d");
   			barChartDemo = Chart.Bar(ctx, {
   				data:barChartData,
   				option : {
   					responsive: false,
   					scales:{
   						yAxes:[{
   							ticks:{
   								befinAtZero:true
   							}
   						}]
   					}
   				}
   			})
   		}
/* 	var ctx = document.getElementById('myChart');
	
	var myChart = new Chart(ctx, {
		type: 'bar',
		data: {
			labels: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
			datasets: [{
				label: '월별매출',
				data: [10, 19, 3, 5, 2, 3],
				backgroundColor: [
					'rgba(255, 99, 132, 0.2)',
					'rgba(54, 162, 235, 0.2)',
					'rgba(255, 206, 86, 0.2)',
					'rgba(75, 192, 192, 0.2)',
					'rgba(153, 102, 255, 0.2)',
					'rgba(255, 159, 64, 0.2)'
				],
				borderColor: [
					'rgba(255, 99, 132, 1)',
					'rgba(54, 162, 235, 1)',
					'rgba(255, 206, 86, 1)',
					'rgba(75, 192, 192, 1)',
					'rgba(153, 102, 255, 1)',
					'rgba(255, 159, 64, 1)'
				],
				borderWidth: 1
			}]
		},
		options: {
			responsive: false,
			scales: {
				yAxes: [{
					ticks: {
						beginAtZero: true
					}
				}]
			},
		}
	}); */
	
/* 	function load() {
		$.getJson("")
	} */
	
	
</script>

    </section>
    <div class="sidemenu">
        <button class="btn-ghost gray si" onclick="location.href='${contextPath}/statistics.do">월별매출</button>
        <button class="btn-ghost gray si" onclick="location.href='${contextPath}/menuStatistics.do'">메뉴별매출</button>
    </div>
    </section>

    </div>
    <br><br><br><br><br><br>

	<c:import url="../../common/footer.jsp"/>


    </div>
</body>
</html>