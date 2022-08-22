<%@page import="com.kh.admin.notice.vo.AdminNoticeVo"%>
<%@page import="java.util.List"%>
<%@page import="com.kh.common.vo.PageVo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	List<AdminNoticeVo> voList = (List<AdminNoticeVo>)request.getAttribute("list");
	PageVo pv = (PageVo)request.getAttribute("pv");
	
	int currentPage = pv.getCurrentPage();
	int startPage = pv.getStartPage();
	int endPage = pv.getEndPage();
	int maxPage = pv.getMaxPage();
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
   <style>
       #box{height: 150px;width: 1920px;}
        #notice{
            /* border: 2px solid red; */
            width: 700px;
            height: 900px;
            margin: 0 auto;
            background-color: rgba(255, 255, 255, 0.675);
        }
        #notice-h1{
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
       .noti-a{
        text-decoration: none;
        color: black;
       }
       .noti-info{
        /* border: 1px solid blue; */
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
        width: 100%;
        border: 0.3px dashed gray;
       }
       .noti-img .noti-info .noti-title .noti-date #notice{
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
        <div id="notice">
            <div id="notice-h1"><h1>공지사항</h1></div>
            <ul>
                <!--  <li >
                    <hr>
                    <a href="" class="noti-a">
                        <div class="noti-info">
                            <div class="noti-img">
                            </div>
                            <h3 class="noti-title">[중요]꼭 읽어보세요!</h3>
                            <span class="noti-date">2022-08-03 &nbsp; 조회수 : 0</span> 
                        </div>
                    </a>
                    <hr>
                </li>
                <li >
                    <a href="" class="noti-a">
                        <div class="noti-info">
                            <div class="noti-img"><img src="<%=contextPath%>/resources/img/join3.png" alt=""></div>
                            <h3 class="noti-title">[중요]공지사항입니다</h3>
                            <span class="noti-date">2022-08-03 &nbsp; 조회수 : 0</span> 
                        </div>
                    </a>
                    <hr>
                </li>  --> 
                <%for(AdminNoticeVo b : voList) {%>
                <li >
                    <a href="" class="noti-a">
                        <div class="noti-info">
                            <div class="noti-img"><img src="<%=contextPath%>/resources/img/join3.png" alt=""></div>
                            <h3 class="noti-title"><%=b.getTitle() %></h3>
                            <span class="noti-date"><%=b.WriteDate()%> &nbsp; 조회수 : <%=b.getCnt() %></span> 
                        </div>
                    </a>
                    <hr class="last-hr">
                </li>
                <%} %>
                <li >
                    <a href="" class="noti-a">
                        <div class="noti-info">
                            <div class="noti-img"><img src="<%=contextPath%>/resources/img/join3.png" alt=""></div>
                            <h3 class="noti-title">[중요]공지입니다입니다입니다공지입니다공지공지</h3>
                            <span class="noti-date">2022-08-03 &nbsp; 조회수 : 0</span> 
                        </div>
                    </a>
                    <hr class="last-hr">
                </li>
            </ul>

            <div class="page-area">
                <%if(currentPage != 1){ %>
                <a href="<%=contextPath %>/member/noticeList?p=<%=currentPage-1%>"> &lt;</a>
                <%} %>
                
                <%for(int i = startPage; i <=endPage; i++){ %>
                	<%if(i==currentPage){ %>
                		<a><%=i %></a>
                	<%}else{ %>
                		<a href="<%=contextPath %>/board/list?p=<%=i%>"><%=i %></a>
                <%}%>
                <%if(currentPage != maxPage){ %>
                <a href="/semi/board/list?p=<%=currentPage+1%>"> &gt; </a>
                <%} %>
                
            </div>
        </div>

    </main>
</html>