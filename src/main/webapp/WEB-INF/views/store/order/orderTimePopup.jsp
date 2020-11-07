<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
    <script
  src="https://code.jquery.com/jquery-3.5.1.js"
  integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc="
  crossorigin="anonymous"></script>
    <style>
        button {
            cursor: pointer;
            margin: 3px;
            padding: 10px 20px;
        }
        .btn-ghost.blue {
            background: transparent;
            border: 2px solid rgb(98, 145, 231);
            border-radius: 8px;
            color: rgb(98, 145, 231);
            text-decoration: none;
            -webkit-transition-duration: 0.4s;
            /* Safari */
            transition-duration: 0.4s;
            margin-top:5px;
            margin-bottom:5px;
        }
        
        
        .btn-ghost.red {
            background: transparent;
            border: 2px solid rgb(231, 113, 98);
            border-radius: 8px;
            color: rgb(231, 113, 98);
            text-decoration: none;
            -webkit-transition-duration: 0.4s;
            /* Safari */
            transition-duration: 0.4s;
        }


        #over, #closeBtn {
            width: 150px;
        }
        
        #closeBtn {
        	height:40px;
        }

        .dbtn{
            background: transparent;
            border: 2px solid rgb(130, 180, 127);
            border-radius: 8px;
            color: rgb(130, 180, 127);
            text-decoration: none;
            -webkit-transition-duration: 0.4s;
            transition-duration: 0.4s;
        }

        .dbtn:hover {
            background-color: rgb(130, 180, 127);
            color: white;
        }

</style>

</head>
<body align="center">
    <h1>배달예상시간</h1>
	    <input type="button"  id="10min" class="btn-ghost blue" value="10" style="width:80px;height:40px;">
	    <input type="button"  id="20min" class="btn-ghost blue" value="20" style="width:80px;height:40px;"><br>
	    <input type="button" id="30min" class="btn-ghost blue" value="30"  style="width:80px;height:40px;">
	    <input type="button" id="40min" class="btn-ghost blue" value="40" style="width:80px;height:40px;"><br>
	    <input type="button" id="50min" class="btn-ghost blue" value="50" style="width:80px;height:40px;">
	    <input type="button" id="60min" class="btn-ghost blue" value="60" style="width:80px;height:40px;"><br>
	    <input type="button" id="over" class="btn-ghost blue"  value="90" style="width:160px;height:40px;"><br>
		<input type="text"  name="oNo" value="${oNo}" style="display:none;">
		<input type="text" name="time"  style="display:none;">
    <script >
    	

		
    	$("input[type=button]").click(function() {

    		var value = $(this).attr("value");
    		$("input[name=time]").val(value);
    		var oNo = $("input[name=oNo]").attr("value");
    		console.log(value+oNo);
    		
    		
    		$.ajax({
    			url:"updateTime.do",
    			data:{value:value, oNo:oNo},
    			success:function(data) {
    				console.log(data);
/*     	    		$("form[name=timesub]").submit(); */
    	      		opener.document.getElementById("time").value=value; 
    				opener.parent.win();
    	     		window.close();   
    			},
    			error:function(e) {
    				console.log(e);
    			}
    		});
    		
    	});
    </script>
    
    
    
    
    
    
    
    
    
    
    
    
</body>
</html>