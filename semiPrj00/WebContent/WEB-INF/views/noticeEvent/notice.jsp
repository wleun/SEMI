<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
   <style>
       #box{height: 150px;width: 1920px;}
        #notice{
            border: 2px solid red;
            width: 700px;
            height: 800px;
            margin: 0 auto;
        }
        #notice-h1{
            margin-left: 30px;
            margin-bottom: 30px;
            
        }
       
        li{
            list-style: none;
            display: block;
            position: relative;
            right: 3%;
            box-sizing: border-box;
        }
       .noti-a{
        text-decoration: none;
        color: black;
       }
       .noti-info{
        border: 1px solid blue;
        height: 130px;
       }
       .noti-img{
        border: 1px solid black;
        width: 120px;
        height: 110px;
        float: right;
        position: relative;;
        bottom: -6.5%;
        right: 3%;
       }
       img{
        width: 110px;
        height: 110px;
       }
       .noti-title{
        line-height: 33px;
        font-size: 25px;
        width: 65%;
        position: relative;
        right: -10px;
        margin-top: 2%;
       }
       .noti-date{
        position:absolute;
        left: 15px;
        bottom: 14px;
        color: gray;
       }
       hr{
        box-sizing: border-box;
        width: 80%;
        border: 0.3px dashed gray;
       }
       .noti-img .noti-info .noti-title .noti-date #notice{
        box-sizing: border-box;
       }
       
    </style>
</head>
<body>
<%@ include file="/WEB-INF/views/common/userHeader.jsp" %>
    <main>
        <div id="box"></div>
        <div id="notice">
            <div id="notice-h1"><h1>공지사항</h1></div>
            <ul>
                <li >
                    <a href="" class="noti-a">
                        <div class="noti-info">
                            <div class="noti-img"><img src="/resources/images/loginIcon.png" alt=""></div>
                            <h3 class="noti-title">[중요]공지되떻되는걸까요다잉공지되떻</h3>
                            <span class="noti-date">2022-08-03</span>
                        </div>
                    </a>
                    <hr>
                </li>
                <li >
                    <a href="" class="noti-a">
                        <div class="noti-info">
                            <div class="noti-img"><img src="/resources/images/loginIcon.png" alt=""></div>
                            <h3 class="noti-title">[중요]공지되떻되는걸까요다잉공지되떻</h3>
                            <span class="noti-date">2022-08-03</span>
                        </div>
                    </a>
                    <hr>
                </li>
                <li >
                    <a href="" class="noti-a">
                        <div class="noti-info">
                            <div class="noti-img"><img src="/resources/images/loginIcon.png" alt=""></div>
                            <h3 class="noti-title">[중요]공지되떻되는걸까요다잉공지되떻</h3>
                            <span class="noti-date">2022-08-03</span>
                        </div>
                    </a>
                    <hr class="last-hr">
                </li>
            </ul>
        </div>

    </main>
</html>