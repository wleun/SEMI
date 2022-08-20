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
	#memberManage {
            display: flex;
            flex-direction: row;
            justify-content: center;
            width: 1632px;
            height: 972px;
        }

        #memberManageDivWrap {
            display: flex;
            flex-direction: column;
            align-self: center;
            width: 90%;
            height: 85%;
        }

        #memberManageDiv1 {
            width: 100%;
            height: 10%;
            display: flex;
            flex-direction: row;
            align-items: flex-start;
        }

        #memberManageDiv1_not_used {
            width: 50%;
            height: 100%;
        }


        #memberManageDiv1_search {
            width: 50%;
            height: 100%;
            display: flex;
            flex-direction: row;
            justify-content:flex-end;
        }

        #memberManageDiv1_search * {
            height: 60%;
            font-size: 14px;
            display: flex;
            margin: 5px;
            align-self: center;
            text-align: center;
            border-radius: 50px;
        }

        
        #memberManageDiv1_search select {
            width: 80px;
        }

        #memberManageDiv2 {
            width: 100%;
            height: 80%;
            display: flex;
        }

        
        .memberManageWrap {
            width: 1469px;
            height: 100%;
            display: flex;
            flex-direction: column;
            border: 1px solid #C3B091;
            border-radius: 10px;
        }
        
        #memberManageFirstColumn {
            background-color: #F9F5EA;
            border-radius: 10px 10px 0px 0px;
            border-bottom: 1px solid #C3B091;
            width: 100%;
            height: 9%;
        }


        .memberManageColumn {
            width: 100%;
            height: 9%;
            font-size: 18px;
            display: flex;
            flex-direction: row;   
            text-align: center;
            align-items: center;
        }

        .text_align_center {
            text-align: center;
        }

        .check {
            width: 6%;
        }

        .memberNo {
            width: 6%;
        }

        .memberType {
            width: 7%;
        }

        .memberLevel {
            width: 10%;
        }

        .memberName {
            width: 13%;
        }

        .memberEmail {
            width: 13%;
        }

        .memberPhone {
            width : 10%;
        }

        
        .memberStatus {
            width : 7%;
        }
        
        .memberSuspendedDate {
            width: 7%;
        }

        .memberEnrollDate {
            width: 7%;
        }

        .memberQuitDate {
            width: 7%;
        }
        
        .memberReport {
        	width : 7%
        }

        #memberManageDiv3 {
            width: 100%;
            height: 10%;
            display: flex;
            flex-direction: row;
        }



        #memberManageDiv3_not_used {
            width: 15%;
            height: 100%;
        }

        #memberManageDiv3_paging {
            width: 70%;
            height: 100%;
            display: flex;
            text-align: center;
            justify-content: center;
            align-items: center;
            font-size: 18px;
        }
        #memberManageDiv3_paging>div {
            padding: 10px;
        }

        #memberManageDiv3_edit {
            width: 15%;
            height: 100%;
            display : flex;
            text-align: center;
            align-items: center;
            flex-direction: row;
            justify-content: space-evenly;
            padding-right: 10px;
        }
        
        #memberManageDiv3_edit>div>input {
        	width: 80px; 
        	height: 30px; 
        }
</style>
</head>
<body>

	<%@ include file="/WEB-INF/views/common/adminLayout.jsp" %>
	
	
	<content>
       <div id="memberManage">

         <div id="memberManageDivWrap">
             <div id="memberManageDiv1">
                 <div id="memberManageDiv1_not_used"></div>
                     <div id="memberManageDiv1_search">
                         <form action="">
                            
                            <select name="status" id="searchWhat">
                                <option value="normal">활동</option>
                                <option value="suspend">정지</option>
                                <option value="quit">탈퇴</option>
                             </select>
                           <select name="what" id="searchWhat">
                              <option value="normal">일반회원</option>
                              <option value="business">사업자회원</option>
                               <option value="juridicalPerson">기업회원</option>
                           </select>
    
                                <input type="search" name="search">
                                <input type="IMAGE" src="<%=contextPath %>/resources/img/search_icon_pse.png" alt="검색 이미지">
                               </form>
                            </div>
                        </div>
                        <div id="memberManageDiv2">
                            <div class="memberManageWrap">
                                <div id="memberManageFirstColumn" class="memberManageColumn">
                                    <div class="check">선택</div>
                                    <div class="memberNo">회원번호</div>
                                    <div class="memberType">회원타입</div>
                                    <div class="memberLevel">회원등급</div>
                                    <div class="memberName">이름</div>
                                    <div class="memberEmail">이메일</div>
                                    <div class="memberPhone">전화번호</div>
                                    <div class="memberStatus">상태</div>
                                    <div class="memberEnrollDate">가입일</div>
                                    <div class="memberSuspendedDate">정지일</div>
                                    <div class="memberQuitDate">탈퇴일</div>
                                    <div class="memberReport">신고횟수</div>
                                </div>
                            
                                  <c:forEach items="${list}" var="item"> 
                                    <div class="memberManageColumn">
                                        <div class="check"><input type="checkbox" class="form-check-input"></div>
                                        <div class="memberNo">${item.no}</div>
                                        <div class="memberType">${item.type}</div>
                                        <div class="memberLevel">${item.mLevel}</div>
                                        <div class="memberName">${item.nick}</div>
                                        <div class="memberEmail">${item.email}</div>
                                        <div class="memberPhone">${item.phone}</div>
                                        <div class="memberStatus">${item.status}</div>
                                        <div class="memberEnrollDate">${item.enrollDate}</div>
                                        <div class="memberSuspendedDate">${item.suspendDate}</div>
                                        <div class="memberQuitDate">${item.quitDate}</div>
                                        <div class="memberReport">${item.reportCnt}</div>
                                    </div>
                                  </c:forEach> 


                               
                            </div>
                        </div>
                        <div id="memberManageDiv3">
    
                            <div id="memberManageDiv3_not_used"></div>
                            <div id="memberManageDiv3_paging">
                                <% if (currentPage>10) { %>
								<div> <a href="<%=contextPath %>/admin/memberManage?p=<%=startPage-10 %>"> ◀ </a> </div>
								<%} %>
								<% for(int i = startPage; i <= endPage; ++i) { %>
									<% if(i == currentPage) {%>
										<div> <a><%=i%></a></div>
									<%} else { %>
									<div> <a href="<%=contextPath %>/admin/memberManage?p=<%=i%>"><%=i%></a></div>
									<%} %>
								<%} %>
								<% if (currentPage != maxPage) { %>
									<% if (maxPage< currentPage+10) { %>
										<div> <a href="<%=contextPath %>/admin/memberManage?p=<%=maxPage%>"> ▶ </a></div>
									<%} else if (maxPage>10) { %>
											<div> <a href="<%=contextPath %>/admin/memberManage?p=<%=startPage+10%> "> ▶ </a></div>									<%} %>
									<%} %>
								
								<% if (currentPage != maxPage) { %>
									<% if (maxPage>10) { %>
								<div> <a href="<%=contextPath %>/admin/memberManage?p=<%=maxPage%> "> ▶▶ </a></div>
									<%} %>
								<%} %>
                            </div>
                            <div id="memberManageDiv3_edit">
                            	<div><input type="button" value="회원정지" class="button"></div>
                            	<div><input type="button" value="정지해제" class="button"></div>
               </div>
    
            </div>
         </div>
    
      </div>

	</content>

</body>
</html>