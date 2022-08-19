<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String memberNo = (String)request.getAttribute("memberNo");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    #box{height: 150px;width: 1920px;}
    #finish-outer{
        /* border: 1px solid blue; */
        width: 700px;
        height: 800px;
        margin: 0px auto;
        background-color: rgba(255, 255, 255, 0.675);
        border-radius: 10px;
    }
   
    #finish-div{
        margin-top: 40px;
        width: 100%;
        height: 300px;
        /* border: 1px solid gray; */
        margin: 0px auto;
        /*background-color: rgba(255, 255, 255, 0.675);*/
        border-radius: 8px;
    }

   
    #finish-h1{
        box-sizing: border-box;
       text-align: center;
       font-size: 60px;
       padding-right: 90px;
       padding-top: 15px;
    }
    
    .join-find-a{
        text-decoration: none;
        color: #48ca7d;
        text-align: center;
       
    }
    .join-find{float: right;}
    #finish-img{
        box-sizing: border-box;
        width: 300px;
        height: 280px;
        position: relative; 
        left: 200px;
    }
    .go{
        position: relative;
        left: 250px;
        width: 100px;
        height: 60px;
        border: 0px solid gray ;
        border-radius: 50px;
        background-color: #48CA7D;
        font-size: 22px;
        color: white;
    }
</style>
<head>
    <meta charset="UTF-8">
   
    <title>로그인</title>
</head>
<body>
<%@ include file="/WEB-INF/views/common/userHeader.jsp" %>
   <main>
    <div id="box"></div>
    <div id="finish-outer">
        <h1 id="finish-h1">&nbsp; &nbsp; &nbsp;환영합니다!</h1>
        
        <div id="finish-div">
            <br>
            <img src="<%=contextPath%>/resources/img/finish.png" alt="" id="finish-img">
            <br><br>
            <button class="go"onclick="location.href='<%=contextPath%>/member/login'">로그인 하기</button>
            <button class="go" onclick="location.href='<%=contextPath%>/member/join3'">메이커 등록</button>
             
            
            
        </div>
        
    </div>
   </main>
    

</body>
</html>