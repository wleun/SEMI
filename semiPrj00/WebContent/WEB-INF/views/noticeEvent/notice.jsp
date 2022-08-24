<%@page import="java.util.ArrayList"%>
<%@page import="com.kh.admin.notice.vo.AdminNoticeVo"%>
<%@page import="java.util.List"%>
<%@page import="com.kh.common.vo.PageVo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%

//ArrayList<AdminNoticeVo> voList = (ArrayList<AdminNoticeVo>)request.getAttribute("voList");

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
       #page-area{
       		text-align:center;
       		padding:30px;
       	}
       	#page-area a{
       		width:35px;
       		font-size : 18px;
       	}
        .btn-success{
            background-color: #48CA7D!important;
            border: 0px!important;
        }
        .btn{
            border-radius: 50px !important;
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
                <li>
                    <hr>
                </li>
              <%for(int i = 0; i <voList.size(); i++){ %>
               <li >
                    <div class="noti-a">
                        <div class="noti-info">
                            <h3 class="noti-title"><%=voList.get(i).getTitle() %></h3>
                            <span class="noti-date"><span id="notiNo"><%=voList.get(i).getNo()%></span> &nbsp; &nbsp;<%=voList.get(i).getWriteDate()%> </span>
                            
                        </div>
                    </div>
                    <hr>
                </li>
                <%} %>
              
            </ul>
 
            <div id="page-area">
           	<%if(currentPage != 1){ %>
		<a class="btn btn-sm btn-success" href="<%=contextPath %>/member/noticeList?p=<%=currentPage-1%>"> &lt; </a>
		<%} %>
		
		<% for(int i = startPage; i <= endPage; i++){ %>
			<%if(i==currentPage){ %>
				<a class="btn btn-sm btn-success" ><%=i %><a>
			<%}else{ %>
				<a class="btn btn-sm" href="<%=contextPath %>/member/noticeList?p=<%=i%>"><%=i %><a>
			<%} %>
		<%} %>
		<%if(currentPage != maxPage){ %>
		<a class="btn btn-sm btn-success" href="<%=contextPath %>/member/noticeList?p=<%=currentPage+1%>"> &gt; </a>
		<%} %>
            </div>
           
        </div>
<script>
      $(function(){
         $('.noti-a').click(function(){
            //행 클릭 되었을 때, 동작할 내용
            
            
            //글 번호 가져오기
            const num = $('#notiNo').text();
            console.log(num);
            //해당 번호 이용해서 요청 보내기
            location.href='<%=contextPath%>/notice/detail?num=' + num;
         });
      })
   </script>
    </main>
</html>