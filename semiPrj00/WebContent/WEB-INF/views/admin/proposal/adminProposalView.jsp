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
    #proposalManage {
            display: flex;
            flex-direction: row;
            justify-content: center;
            width: 1632px;
            height: 972px;
        }

        #proposalManageDivWrap {
            display: flex;
            flex-direction: column;
            align-self: center;
            width: 90%;
            height: 85%;
        }

        #proposalManageDiv1 {
            width: 100%;
            height: 10%;
            display: flex;
            flex-direction: row;
            align-items: flex-start;
        }

        #proposalManageDiv1_not_used {
            width: 80%;
            height: 100%;
        }


        #proposalManageDiv1_search {
            width: 20%;
            height: 100%;
            display: flex;
            flex-direction: row;
            justify-content: space-evenly;
        }

        #proposalManageDiv1_search * {
            height: 60%;
            font-size: 14px;
            display: flex;
            margin: 3px;
            align-self: center;
            text-align: center;
            border-radius: 50px;
        }
        
        #proposalManageDiv1_search select {
        	width : 80px;
        }

        #proposalManageDiv2 {
            width: 100%;
            height: 80%;
            display: flex;
        }

        
        .proposalManageWrap {
            width: 1469px;
            height: 100%;
            display: flex;
            flex-direction: column;
            border: 1px solid #C3B091;
            border-radius: 10px;
        }

        .proposalManageWrap>a {
            width: 100%;
            height: 9%;
        }

        #proposalManageFirstColumn {
            background-color: #F9F5EA;
            border-radius: 10px 10px 0px 0px;
            border-bottom: 1px solid #C3B091;
            width: 100%;
            height: 9%;
        }

        .proposalManageColumn {
            width: 100%;
            height: 100%;
            font-size: 18px;
            display: flex;
            flex-direction: row;   
            text-align: center;
            align-items: center;
        }

        .text_align_center {
            text-align: center;
        }

        .proposalNo {
            width: 10%;
        }

        .proposalMember {
            width: 15%;
        }

        .proposalPrjCategory {
            width: 15%;
        }

        .proposalPrjName {
            width: 35%;
        }

        .proposalDate {
            width: 15%;
        }
        
        .proposalStatus {
        	width : 10%;
        }


        #proposalManageDiv3 {
            width: 100%;
            height: 10%;
            display: flex;
            flex-direction: row;
        }



        #proposalManageDiv3_not_used {
            width: 20%;
            height: 100%;
        }

        #proposalManageDiv3_paging {
            width: 60%;
            height: 100%;
            display: flex;
            text-align: center;
            justify-content: center;
            align-items: center;
            font-size: 18px;
        }
        #proposalManageDiv3_paging>div {
            padding: 10px;
        }

        #proposalManageDiv3_delete {
            width: 20%;
            height: 100%;
            display : flex;
            text-align: center;
            align-items: center;
            flex-direction: row;
            justify-content: flex-end;
            padding-right: 10px;
        }
        
        #proposalManageDiv3_delete>div>input {
        	width: 80px; 
        	height: 30px; 
        }
</style>
</head>
<body>

    <%@ include file="/WEB-INF/views/common/adminLayout.jsp" %>
	
	
	<content>
       <div id="proposalManage">

         <div id="proposalManageDivWrap">
             <div id="proposalManageDiv1">
                 <div id="proposalManageDiv1_not_used"></div>
                     <div id="proposalManageDiv1_search">
                         <form action="">
    
                           <select name="what" id="searchWhat">
                              <option value="receipt">접수</option>
                              <option value="assessing">검토중</option>
                              <option value="return">반려</option>
                              <option value="approve">승인</option>
                           </select>
    
                                <input type="search" name="search">
                                <input type="IMAGE" src="<%=contextPath %>/resources/img/search_icon_pse.png" alt="검색 이미지">
                               </form>
                            </div>
                        </div>
                        <div id="proposalManageDiv2">
                            <div class="proposalManageWrap">
                                <div id="proposalManageFirstColumn" class="proposalManageColumn">
                                    
                                    <div class="proposalNo">제안서번호</div>
                                    <div class="proposalMember">제안 회원</div>
                                    <div class="proposalPrjCategory">프로젝트 카테고리</div>
                                    <div class="proposalPrjName">프로젝트 이름</div>
                                    <div class="proposalDate">접수날짜</div>
                                    <div class="proposalStatus">처리상태</div>
                                </div>
                                
                                <c:forEach items="${list}" var="item">
                                    <a href="<%=contextPath%>/admin/proposalDetail?no=${item.no}">
	                                    <div class="proposalManageColumn">
	                                        <div class="proposalNo">${item.no}</div>
	                                        <div class="proposalMember">${item.nick}</div>
	                                        <div class="proposalPrjCategory">${item.categoryName}</div>
	                                        <div class="proposalPrjName">${item.name }</div>
	                                        <div class="proposalDate">${item.registerDate}</div>
	                                        <div class="proposalStatus">${item.status}</div>
	                                    </div>
                                	</a>
                                </c:forEach>

                           

                                
                            
                                
                               
                            </div>
                        </div>
                        <div id="proposalManageDiv3">
    
                            <div id="proposalManageDiv3_not_used"></div>
                            <div id="proposalManageDiv3_paging">
                                <% if (currentPage>10) { %>
                                    <div> <a href="<%=contextPath %>/admin/proposal?p=<%=startPage-10 %>"> ◀ </a> </div>
                                    <%} %>
                                    <% for(int i = startPage; i <= endPage; ++i) { %>
                                        <% if(i == currentPage) {%>
                                            <div> <a><%=i%></a></div>
                                        <%} else { %>
                                        <div> <a href="<%=contextPath %>/admin/proposal?p=<%=i%>"><%=i%></a></div>
                                        <%} %>
                                    <%} %>
                                    <% if (currentPage != maxPage) { %>
                                        <% if (maxPage< currentPage+10) { %>
                                            <div> <a href="<%=contextPath %>/admin/proposal?p=<%=maxPage%>"> ▶ </a></div>
                                        <%} else if (maxPage>10) { %>
                                                <div> <a href="<%=contextPath %>/admin/proposal?p=<%=startPage+10%> "> ▶ </a></div>									<%} %>
                                        <%} %>
                                    
                                    <% if (currentPage != maxPage) { %>
                                        <% if (maxPage>10) { %>
                                    <div> <a href="<%=contextPath %>/admin/proposal?p=<%=maxPage%> "> ▶▶ </a></div>
                                        <%} %>
                                    <%} %>
                            </div>
                           
    
            </div>
         </div>
    
      </div>

	</content>


</body>
</html>