<%@page import="com.kh.admin.attachment.vo.AdminNoticeAttachmentVo"%>
<%@page import="com.kh.admin.notice.vo.AdminNoticeVo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	AdminNoticeVo vo = (AdminNoticeVo)request.getAttribute("vo");
	AdminNoticeAttachmentVo attachVo = (AdminNoticeAttachmentVo)request.getAttribute("attachVo");
%>
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
            text-align: left;
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
        font-size: 45px;
       }
       .noti-date{
        text-align: right;
        border-bottom: 2px solid lightgray;
        font-size: 15px;
        margin-left: -34px;
       } 
       .noti-img{
        /*border: 1px solid blue;*/
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
                <!-- <div id="notice-h1"><h1>공지사항</h1></div> -->
            
                <div>
                 <ul>
                     <li><br> <div id="noti-title"><%=vo.getTitle() %></div></li>
                     <li><div class="noti-date">작성일 :<%=vo.getWriteDate() %> &nbsp;</div></li>
                   
                     <li><div class="noti-img"><img src="<%=contextPath%>/resources/admin/event/<%=attachVo.getName()%>" alt="이미지파일입니다"></div></li>
                     <li><div style="font-size : 25px;"><%=vo.getContent() %></div></li>
                 </ul>
                </div>
                
            </div>
            <div id="noti-btn-div">
               <!-- <button id="noti-pre" style="color:white;" onclick="location.href=''">이전</button> --> 
                <button id="noti-list" style="color:white;" onclick="location.href='<%=contextPath%>/member/noticeList?p=1'">목록</button> 
               <!--<button id="noti-next" style="color:white;" onclick=" location.href='<%=contextPath%>/notice/detail?num=<%=vo.getNo()%> + 1'">다음</button> </div>  --> 
             </div>
       

    </main>
</body>
</html>