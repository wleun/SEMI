<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    #box{height: 150px;width: 1920px;}
    #finish-outer{
        border: 1px solid blue;
        width: 700px;
        height: 800px;
        margin: 0px auto;
    }
   
    #finish-div{
        margin-top: 40px;
        width: 100%;
        height: 300px;
        /* border: 1px solid gray; */
        margin: 0px auto;
        background-color: rgba(255, 255, 255, 0.675);
        border-radius: 8px;
    }

    input{
        border: 0px;
        height: 40px;
        width: 230px;
        border-bottom: 2px solid darkgray;
        background-color: rgba(255, 255, 255, 0.675);
        
    }
 
    #finish-h1{
       text-align: center;
       font-size: 40px;
    }
    
    .join-find-a{
        text-decoration: none;
        color: #48ca7d;
        text-align: center;
       
    }
    .join-find{float: right;}
    #finish-img{
        width: 200px;
        height: 180px;
        position: relative;
        left: 250px;
    }
    .go{
        position: relative;
        left: 250px;
        width: 100px;
        height: 60px;
        border: 1px solid gray ;
        border-radius: 8px;
        background-color: #48CA7D;
        font-size: 20px;
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
        <h1 id="finish-h1">환영합니다!</h1>
        
        <div id="finish-div">
            <br>
            <img src="<%=contextPath%>/resources/img/finish.png" alt="" id="finish-img">
            <br><br>
            <button class="go"onclick="location.href='<%=contextPath%>/member/login">로그인</button>
            <button class="go" onclick="location.href='<%=contextPath%>'">메인</button>
            
            
        </div>
        
    </div>
   </main>
    

</body>
</html>