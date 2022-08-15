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
            /* border: 2px solid red; */
            width: 700px;
            height: 900px;
            margin: 0 auto;
            background-color: rgba(255, 255, 255, 0.675);
        }
        #notice-h1{
            text-align: center;
            border-bottom: 2px solid lightgray;
        }
       #noti-outer{
        /* border: 1px solid black; */
        width: 700px;
        height: 750px;
        box-sizing: border-box;
        margin: 0 auto;
       }
       #noti-title{
        text-align: center;
        font-size: 20px;
       }
       .noti-date{
        text-align: right;
        border-bottom: 2px solid lightgray;
        font-size: small;
        margin-left: -34px;
       } 
       .noti-img{
        border: 1px solid blue;
        width: 300px;
        height: 300px;
        margin: 10px auto;
    
       }
       /* a{
        text-decoration: none;
        color: black;
        border:none;
        font-size: 18px;
        text-align: center;
        } */
        #noti-btn-div{
            border-top: 2px solid lightgray; 
            text-align: center;
            font-size: 18px;
        }
       #noti-pre{margin-top:5px; box-sizing: border-box; position: relative; right: 120px; border-radius: 8px; width: 50px; height:30px;  text-decoration: none; color: black; background-color: #48CA7D;border: 0px;}
       #noti-list{margin-top:5px; box-sizing: border-box; border-radius: 8px; width: 50px; height:30px;text-decoration: none; color: black; background-color: #48CA7D;border: 0px;}
       #noti-next{margin-top:5px; box-sizing: border-box; position: relative; left: 120px; border-radius: 8px; width: 50px; height:30px; text-decoration: none; color: black; background-color: #48CA7D;border: 0px;}
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
                     <li><div class="noti-date">작성일 : 2022-08-03 &nbsp; 조회수 : 0 &nbsp;</div></li>
                   
                     <li><div class="noti-img"><img src="" alt="이미지파일입니다"></div></li>
                     <li><div>텍스트내용..</div></li>
                 </ul>
                </div>
                
            </div>
            <div id="noti-btn-div">
                <button id="noti-pre"  onclick="location.href=''">이전</button>
                <button id="noti-list"  onclick="location.href='<%=contextPath%>/member/noticeList'">목록</button>
                <button id="noti-next"  onclick="location.href=''">다음</button> </div>
             </div>
       

    </main>
</body>
</html>