<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
    <style>
    #box{height: 150px;width: 1920px;}
       ul{
        padding: 0px;
       }
       li{
        list-style: none;
       }
        #event{
            border: 2px solid red;
            width: 700px;
            height: 800px;
            margin: 0 auto;
        }
        #event-h1{
            text-align: center;
            border-bottom: 1px solid black;
        }
       #event-outer{
        border: 1px solid blue;
        width: 600px;
        height: 700px;
        box-sizing: border-box;
        margin: 0 auto;
       }
       #event-title{
        text-align: center;
        font-size: 20px;
       }
       .event-date{
        text-align: right;
        border-bottom: 1px solid black;
        font-size: small;
       } 
       .event-img{
        border: 1px solid blue;
        width: 300px;
        height: 300px;
        margin: 10px auto;
    
       }
       .event-term{
        text-align: center;
        border-bottom: 1px solid black;
       }
       a{
        text-decoration: none;
        color: black;
       }
       #event-pre{position: relative; left: 50px;}
       #event-list{position: relative; left: 300px;}
       #event-next{position: relative; left: 550px;}
    </style>
</head>
<body>
<%@ include file="/WEB-INF/views/common/userHeader.jsp" %>
    <main>
        <div id="box"></div>
        <div id="event">
            <div id="event-outer">
                <div id="event-h1"><h1>이벤트</h1></div>
            
                <div>
                 <ul>
                     <li><div id="event-title">[특가]여름맞이 행사</div></li>
                     <li><div class="event-date">작성일 : 2022-08-03</div></li>
                     <li><div class="event-term">이벤트 기간 : 2022-01-01 ~ 2022-03-03</div></li>
                     <li><div class="event-img"><img src="" alt="이미지파일입니다"></div></li>
                     <li><div>텍스트내용..</div></li>
                 </ul>
                </div>
                
            </div>
           <a href="" id="event-pre">이전</a>
           <a href="" id="event-list">목록</a>
           <a href="" id="event-next">다음</a>
        </div>
       

    </main>
</body>
</html>