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
            /* border: 2px solid red; */
            width: 700px;
            height: 900px;
            margin: 0 auto;
            background-color: rgba(255, 255, 255, 0.675);
        }
        #event-h1{
            margin-left: 30px;
            margin-bottom: 30px;
            padding-top: 20px;
        }
       
        li{
            list-style: none;
            display: block;
            position: relative;
            right: 3%;
            box-sizing: border-box;
        }
       .event-a{
        text-decoration: none;
        color: black;
       }
       .event-info{
        /* border: 1px solid blue; */
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
        width: 100%;
        border: 0.3px dashed gray;
        
       }
       .event-img .event-info .event-title .event-date #event{
        box-sizing: border-box;
       }
       .page{
        text-align: center;
       }
    </style>
</head>
<body>
<%@ include file="/WEB-INF/views/common/userHeader.jsp" %>
    <main>
        <div id="box"></div>
        <div id="event">
            <div id="event-h1"><h1>이벤트</h1></div>
            <ul>
                <li >
                    <hr>
                    <a href="" class="event-a">
                        <div class="event-info">
                            <div class="event-img"><img src="<%=contextPath%>/resources/img/finish.png" alt=""></div>
                            <h3 class="event-title">[특가]행사합니다!!</h3>
                            <span class="event-date">2022-08-03</span>
                        </div>
                    </a>
                    <hr>
                </li>
                <li >
                    <a href="" class="event-a">
                        <div class="event-info">
                            <div class="event-img"><img src="<%=contextPath%>/resources/img/finish.png" alt=""></div>
                            <h3 class="event-title">[특가]여름맞이 행사</h3>
                            <span class="event-date">2022-08-03</span>
                        </div>
                    </a>
                    <hr>
                </li>
                <li >
                    <a href="" class="event-a">
                        <div class="event-info">
                            <div class="event-img"><img src="<%=contextPath%>/resources/img/finish.png" alt=""></div>
                            <h3 class="event-title">[마감임박]얼른 오세요</h3>
                            <span class="event-date">2022-08-03</span>
                        </div>
                    </a>
                    <hr>
                </li>
                <li >
                    <a href="" class="event-a">
                        <div class="event-info">
                            <div class="event-img"><img src="<%=contextPath%>/resources/img/finish.png" alt=""></div>
                            <h3 class="event-title">[마감임박]곧 마감입니다?</h3>
                            <span class="event-date">2022-08-03</span>
                        </div>
                    </a>
                    <hr>
                </li>
            </ul>

            <div class="page">
                <a>1</a>
                <a>2</a>
                <a>3</a>
                <a>4</a>
                <a>5</a>
            </div>
        </div>

    </main>
</body>
</html>