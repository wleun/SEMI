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
        #notice{
            border: 2px solid red;
            width: 700px;
            height: 800px;
            margin: 0 auto;
        }
        #notice-h1{
            text-align: center;
            border-bottom: 1px solid black;
        }
       #noti-outer{
        border: 1px solid blue;
        width: 600px;
        height: 700px;
        box-sizing: border-box;
        margin: 0 auto;
       }
       #noti-title{
        text-align: center;
        font-size: 20px;
       }
       .noti-date{
        text-align: right;
        border-bottom: 1px solid black;
        font-size: small;
       } 
       .noti-img{
        border: 1px solid blue;
        width: 300px;
        height: 300px;
        margin: 10px auto;
    
       }
       a{
        text-decoration: none;
        color: black;
       }
       #noti-pre{position: relative; left: 50px;}
       #noti-list{position: relative; left: 300px;}
       #noti-next{position: relative; left: 550px;}
    </style>
</head>
<body>
<%@ include file="/WEB-INF/views/common/userHeader.jsp" %>
    <main>
        <div id="box"></div>
        <div id="notice">
            <div id="noti-outer">
                <div id="notice-h1"><h1>공지사항</h1></div>
            
                <div>
                 <ul>
                     <li><div id="noti-title">[공지]사기꾼 조심하세요!</div></li>
                     <li><div class="noti-date">작성일 : 2022-08-03</div></li>
                   
                     <li><div class="noti-img"><img src="" alt="이미지파일입니다"></div></li>
                     <li><div>텍스트내용..</div></li>
                 </ul>
                </div>
                
            </div>
           <a href="" id="noti-pre">이전</a>
           <a href="" id="noti-list">목록</a>
           <a href="" id="noti-next">다음</a>
        </div>
       

    </main>
</body>
</html>