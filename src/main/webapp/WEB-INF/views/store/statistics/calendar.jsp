<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>             
<!DOCTYPE html>
<html>
<head>
<link href='fullcalendar/daygrid.css' rel='stylesheet' />
<link href='fullcalendar/fullcalendar.css' rel='stylesheet' />
<link href='fullcalendar/timegrid.css' rel='stylesheet' />
<link href='fullcalendar/daygrid.js' rel='stylesheet' />
<link href='fullcalendar/fullcalendar.js' rel='stylesheet' />
<link href='fullcalendar/interaction.js' rel='stylesheet' />
<link href='fullcalendar/timegrid.js' rel='stylesheet' />
<script src='fullcalendar/daygrid.js'></script>
<script src='fullcalendar/fullcalendar.css'></script>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="wrapper">
		    <c:import url="../common/headerbar.jsp"/>
		    
		    <div id="calendar"></div>
		    
		    <c:import url="../common/footer.jsp"/>
	</div>
	
	<script>
	document.addEventListener('DOMContentLoaded', function() {
		var calendarEl = document.getElementById('calendar'); 
		var calendar = new FullCalendar.Calendar(calendarEl, { 
			plugins: [ 'interaction', 'dayGrid', 'timeGrid' ], 
			defaultView: 'dayGridMonth', 
			defaultDate: new Date(), 
			header: {
				left: 'prev,next today', center: 'title', right: '' 
				}, 
			});
		calendar.render();
		});
	</script>
	
	



</body>
</html>

