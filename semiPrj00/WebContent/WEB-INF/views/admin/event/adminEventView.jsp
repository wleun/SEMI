<%@page import="com.kh.admin.event.repository.AdminEventDao"%>
<%@page import="java.util.List"%>
<%@page import="com.kh.common.vo.PageVo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	PageVo pv = (PageVo) request.getAttribute("pv");
	
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
    
		#eventManage {
            display: flex;
            flex-direction: row;
            justify-content: center;
            width: 1632px;
            height: 972px;
        }

        #event {
            display: flex;
            flex-direction: column;
            align-self: center;
            width: 90%;
            height: 85%;
        }

        #eventDiv1 {
            width: 100%;
            height: 10%;
            display: flex;
            flex-direction: row;
            align-items: flex-start;
        }

        #eventDiv1_not_used {
            width: 80%;
            height: 100%;
        }


        #eventDiv1_search {
            width: 20%;
            height: 100%;
            display: flex;
            flex-direction: row;
            justify-content: flex-end;
        }

        #eventDiv1_search * {
            height: 60%;
            font-size: 14px;
            display: flex;
            margin: 5px;
            align-self: center;
            text-align: center;
            border-radius: 16px;
        }
        
        #eventArea>a {
        width:100%
        height:100%
        }

        
        #eventDiv1_search select {
            width: 80px;
        }

        #eventDiv2 {
            width: 100%;
            height: 80%;
            display: flex;
        }

        
        .eventWrap {
            width: 1469px;
            height: 100%;
            display: flex;
            flex-direction: row;
        }

        .eventArea {
            width: 50%;
            height: 100%;
            display: flex;
            flex-direction: column;
            justify-content: space-evenly;
        }


        .eventBox {
            width: 100%;
            height: 100%;
            display: flex;
            flex-direction: row;
            border-radius: 16px;
        }


        

        #eventDiv3 {
            width: 100%;
            height: 10%;
            display: flex;
            flex-direction: row;
        }



        #eventDiv3_not_used {
            width: 15%;
            height: 100%;
        }

        #eventDiv3_paging {
            width: 70%;
            height: 100%;
            display: flex;
            text-align: center;
            justify-content: center;
            align-items: center;
            font-size: 18px;
        }
        #eventDiv3_paging>div {
            padding: 10px;
        }

        #eventDiv3_edit {
            width: 15%;
            height: 100%;
            display : flex;
            text-align: center;
            align-items: center;
            flex-direction: row;
            justify-content: space-evenly;
            padding-right: 10px;
        }
        
        #eventDiv3_edit>div>input {
        	width: 80px; 
        	height: 30px; 
        }

        .imgArea {
            width: 288px;
            height: 164px;
            margin: 0 auto;
            border-radius: 10px;
            border: 1px solid #C3B091;;
        }
        
        .half {
            width: 50%;
            height: 100%;
            display: flex;
            align-items: center;
            text-align: center;
            justify-content: center;
            flex-direction: column;
        }


        .eventTitle {
            width: 100%;
            height: 25%;
            align-items: center;
            text-align: center;
        }

        .eventPeriod {
            width: 100%;
            height: 20%;
            align-items: center;
            text-align: center;
        }

        .importantBox {
            width: 100%;
            height: 15%;
            display: flex;
            flex-direction:column;
            align-items: flex-start;
        }

        .hoverCss {
            background-color: #48CA7D;
            color: white;
        }

        .hoverOutCss {
            background-color: white;
            color: black;
        }

</style>
</head>
<body>

<%@ include file="/WEB-INF/views/common/adminLayout.jsp" %>

<content>
       <div id="eventManage">

         <div id="event">
             <div id="eventDiv1">
                 <div id="eventDiv1_not_used"></div>
                     <div id="eventDiv1_search">
                         <form action="">


                            <select name="status" id="searchWhat">
                                <option value="N">일반</option>
                                <option value="Y">삭제된</option>
                                </select>
    
                           <select name="what" id="searchWhat">
                              <option value="title">제목</option>
                              <option value="content">내용</option>
                               <option value="titleContent">제목+내용</option>
                           </select>
    
                                <input type="search" name="search">
                                <input type="IMAGE" src="<%=contextPath %>/resources/img/search_icon_pse.png" alt="검색 이미지">
                         </form>
                            </div>
                        </div>
                        <div id="eventDiv2">
                            <div class="eventWrap">

                                <div class="eventArea">
                                    <c:forEach items="${list}" var="item" begin="0" end="2" step="1">
                                    	<a href="<%=contextPath%>/admin/eventDetail?no=${item.no}">
	                                        <div class="eventBox">
	                                            <div class="half textBox">
	                                                <div class="eventTitle"><h2>${item.title}</h2></div>
	                                                <div class="eventPeriod">${item.startDate} ~ ${item.endDate}</div>
	                                                <div class="eventStatus">진행예정</div>
	                                            </div>
	                                            <div class="half">
	                                                <div class="imgArea"><img style="border-radius: 10px 10px 0px 0px;" width="100%" height="100%" src="<%=contextPath %>/resources/img/adminDashboard_img.jpg" alt="이벤트 섬네일"></div>
	                                            </div>
	                                        </div>
                                    	</a>
                                    </c:forEach>
                                </div>   
                                <div class="eventArea">
                                    <c:forEach items="${list}" var="item" begin="3" end="5" step="1">
                                    	<a href="<%=contextPath%>/admin/eventDetail?no=${item.no}">
	                                        <div class="eventBox">
	                                            <div class="half textBox">
	                                                <div class="eventTitle"><h2>${item.title}</h2></div>
	                                                <div class="eventPeriod">${item.startDate} ~ ${item.endDate}</div>
	                                                <div class="eventStatus">진행예정</div>
	                                            </div>
	                                            <div class="half">
	                                                <div class="imgArea"><img style="border-radius: 10px 10px 0px 0px;" width="100%" height="100%" src="<%=contextPath %>/resources/img/adminDashboard_img.jpg" alt="이벤트 섬네일"></div>
	                                            </div>
	                                        </div>
                                    	</a>
                                    </c:forEach>
                                </div>
                                
                            </div>
                        </div>
                        <div id="eventDiv3">
    
                            <div id="eventDiv3_not_used"></div>
                            <div id="eventDiv3_paging">
                                
                                <% if (currentPage>10) { %>
								<div> <a href="<%=contextPath %>/admin/event?p=<%=startPage-10 %>"> ◀ </a> </div>
								<%} %>
								<% for(int i = startPage; i <= endPage; ++i) { %>
									<% if(i == currentPage) {%>
										<div> <a><%=i%></a></div>
									<%} else { %>
									<div> <a href="<%=contextPath %>/admin/event?p=<%=i%>"><%=i%></a></div>
									<%} %>
								<%} %>
								<% if (currentPage != maxPage) { %>
									<% if (maxPage< currentPage+10) { %>
										<div> <a href="<%=contextPath %>/admin/event?p=<%=maxPage%>"> ▶ </a></div>
									<%} else if (maxPage>10) { %>
											<div> <a href="<%=contextPath %>/admin/event?p=<%=startPage+10%> "> ▶ </a></div>									<%} %>
									<%} %>
								
								<% if (currentPage != maxPage) { %>
									<% if (maxPage>10) { %>
								<div> <a href="<%=contextPath %>/admin/event?p=<%=maxPage%> "> ▶▶ </a></div>
									<%} %>
								<%} %>
                            </div>
                            <div id="eventDiv3_edit">
                            	<div><input type="button" value="작성하기" class="button" onclick="location.href='<%=contextPath%>/admin/eventInstall';"></div>
               </div>
    
            </div>
         </div>
    
      </div>

	</content>
	
	


</body>
</html>