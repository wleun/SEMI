<%@page import="com.kh.admin.event.vo.AdminEventVo"%>
<%@page import="com.kh.admin.notice.vo.AdminNoticeVo"%>
<%@page import="java.util.List"%>
<%@page import="com.kh.common.vo.PageVo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	List<AdminEventVo> voList = (List<AdminEventVo>)request.getAttribute("list");
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
       .event-a:hover{
       	color:#48CA7D;
       	cursor: pointer;
       }
       .event-info{
        /* border: 1px solid blue; */
        height: 130px;
       }
       .event-img{
        /*border: 1px solid black;*/
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
        <div id="event">
            <div id="event-h1"><h1>이벤트 EVENT</h1></div>
            <ul>
                <li>
                    <hr>
                </li>
            <%for(int i = 0; i <voList.size(); i++){ %>
                <li >
                    <div  class="event-a">
                        <div class="event-info">
                            <div class="event-img"><img src="<%=contextPath%>/resources/admin/event/<%=voList.get(i).getThumbnailName()%>" alt="<%=voList.get(i).getThumbnailName()%>"></div>
                            <h3 class="event-title"><%=voList.get(i).getTitle() %></h3>
                            <span class="event-date">NO.<span id="eventNo"><%=voList.get(i).getNo()%></span> &nbsp;<%=voList.get(i).getWriteDate() %></span>
                        </div>
                    </div>
                    <hr>
                </li>
                <%} %>
                
            </ul>

            <div id="page-area">
                <%if(currentPage != 1){ %>
		<a class="btn btn-sm btn-success" href="<%=contextPath %>/member/eventList?p=<%=currentPage-1%>"> &lt; </a>
		<%} %>
		
		<% for(int i = startPage; i <= endPage; i++){ %>
			<%if(i==currentPage){ %>
				<a class="btn btn-sm btn-success"><%=i %><a>
			<%}else{ %>
				<a class="btn btn-sm" href="<%=contextPath %>/member/eventList?p=<%=i%>"><%=i %><a>
			<%} %>
		<%} %>
		<%if(currentPage != maxPage){ %>
		<a class="btn btn-sm btn-success" href="<%=contextPath %>/member/eventList?p=<%=currentPage+1%>"> &gt; </a>
		<%} %>
            </div>
        </div>
        
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script>
      $(function(){
         $('.event-a').click(function(){
            //행 클릭 되었을 때, 동작할 내용
            
            //글 번호 가져오기
            const num = $('#eventNo').text();
            console.log(num);
            //해당 번호 이용해서 요청 보내기
            location.href='<%=contextPath%>/event/detail?num=' + num;
         });
      })
   </script>
    </main>

</body>
</html>