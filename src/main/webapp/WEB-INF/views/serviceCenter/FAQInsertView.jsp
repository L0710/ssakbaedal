<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ssakbaedal</title>

<style>
        
        section {
            margin-left: 187px;
            width: 1013.5px;
            height: 60%;
            float: left;
        }
        
        #inFAQ_table {
            border-collapse: collapse;
            background-color: white;
            width: 80%;
            overflow: hidden;
            border-radius: 5px;
            table-layout: fixed;
        }
        
        th, td {
            font-family:'Motnserrat',sans-serif;
            text-align: center;
            font-size: 12px;
            padding: 10px;
            border-bottom: 1px solid rgb(192, 211, 192);
            overflow: hidden;
            white-space: nowrap;
            text-overflow: ellipsis;
            border-top: 1px solid rgb(192, 211, 192);
            border-bottom: 1px solid rgb(192, 211, 192);
        }
        
        th {
            background-color: rgb(192, 211, 192);
            color: white;
        }
        
        button {
            cursor: pointer;
            margin: 3px;
            padding: 10px 20px;
            outline: 0; /* 버튼 클릭시 테두리 생성하지 않게함.*/
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
        
        .sidemenu {
            width: 150px;
            position: fixed;
            top: 200px;
            /*left: 1290px;*/
            margin-left: 12.5px;
            margin-top: 100px;
        }
        
        .contents {
            margin-top: 1%;
            padding: 3%;
            border: 1px solid rgb(130, 180, 127);
            height: 100%;
        }       

        #td_button {
            border: 1px solid white;
        }
        
        #asdf{
            width: 100%;
            height: 50px;
            text-align: center;
        }

        #asdf span{
            color: rgb(143,145,142);
        }

</style>

</head>
<body>
<div class="wrapper">
        <c:import url="../common/headerbar.jsp"/>
        
        <section>
            <div class="contents" align="center">
                
                <div id="asdf">
                    <h1>FAQ</h1>
                    <span>자주 묻는 질문 작성</span>
                </div>
                <br>
                <br>
                
                <form action="faqInsert.do" method="POST" enctype="multipart/form-data">
                    <table id="inFAQ_table" align="center">
                        <tr>
                            <th width="20%">제목</th>
                            <td>
                                <input type="text" name="fTitle" size="80">
                            </td>
                        </tr>
                        <tr>
                            <th>작성자</th>
                            <td>
                                <input type="text" name="fWriter" value="${ loginUser.mId }" size="80" readonly>
                            </td>
                        </tr>
                        <tr>
                            <th>내용</th>
                            <td>
                                <textarea cols="80" rows="7" name="fContent"></textarea>
                            </td>
                        </tr>
                        <tr>
                            <td id="td_button" colspan="2">
                                <br>
                                <br>
                                <button type="submit" class="btn-ghost green">작성</button>
                                <button type="button" class="btn-ghost gray" onclick="location.href='service.do'">취소</button>
                            </td>
                        </tr>
                    </table>
                </form>
                
            </div>
            
        </section>
        
        <c:import url="../common/sidemenu_sCenter.jsp"/>

    </div>
    
    <c:import url="../common/footer.jsp"/>
    
</body>
</html>