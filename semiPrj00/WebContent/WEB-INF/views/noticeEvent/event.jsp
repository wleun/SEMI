<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
   <style>
       #box{height: 150px;width: 1920px;}
        #event{
            border: 2px solid red;
            width: 700px;
            height: 800px;
            margin: 0 auto;
        }
        #event-h1{
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
       a{
        text-decoration: none;
        color: black;
       }
       .event-info{
        border: 1px solid blue;
        height: 130px;
       }
       .event-img{
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
       .event-title{
        line-height: 33px;
        font-size: 25px;
        width: 65%;
        position: relative;
        right: -10px;
        margin-top: 2%;
       }
       .event-date{
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
       .event-img .event-info .event-title .event-date #event{
        box-sizing: border-box;
       }
    </style>
</head>
<body>
<%@ include file="/WEB-INF/views/common/userHeader.jsp" %>
    <main>
        
        <div id="event">
            <div id="event-h1"><h1>이벤트</h1></div>
            <ul>
                <li >
                    <a href="" class="event-a">
                        <div class="event-info">
                            <div class="event-img"><img src="/resources/images/loginIcon.png" alt=""></div>
                            <h3 class="event-title">[특가]행사합니다라라ㅏ람쥐</h3>
                            <span class="event-date">2022-08-03</span>
                        </div>
                    </a>
                    <hr>
                </li>
                <li >
                    <a href="" class="event-a">
                        <div class="event-info">
                            <div class="event-img"><img src="/resources/images/loginIcon.png" alt=""></div>
                            <h3 class="event-title">[특가]행사합니다라라ㅏ람쥐며느리어카센타</h3>
                            <span class="event-date">2022-08-03</span>
                        </div>
                    </a>
                    <hr>
                </li>
                <li >
                    <a href="" class="event-a">
                        <div class="event-info">
                            <div class="event-img"><img src="/resources/images/loginIcon.png" alt=""></div>
                            <h3 class="event-title">[마감임박]대박ㄷ대대대박적이네옹</h3>
                            <span class="event-date">2022-08-03</span>
                        </div>
                    </a>
                    <hr>
                </li>
            </ul>
        </div>

    </main>
</body>
</html>