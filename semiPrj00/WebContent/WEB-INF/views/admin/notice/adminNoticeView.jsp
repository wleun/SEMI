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
		#noticeManage {
            display: flex;
            flex-direction: row;
            justify-content: center;
            width: 1632px;
            height: 972px;
        }

        #notice {
            display: flex;
            flex-direction: column;
            align-self: center;
            width: 90%;
            height: 85%;
        }

        #noticeDiv1 {
            width: 100%;
            height: 10%;
            display: flex;
            flex-direction: row;
            align-items: flex-start;
        }

        #noticeDiv1_not_used {
            width: 80%;
            height: 100%;
        }


        #noticeDiv1_search {
            width: 20%;
            height: 100%;
            display: flex;
            flex-direction: row;
            justify-content: flex-end;
        }

        #noticeDiv1_search * {
            height: 60%;
            font-size: 14px;
            display: flex;
            margin: 5px;
            align-self: center;
            text-align: center;
            border-radius: 50px;
        }

        #noticeDiv1_search select {
            width: 80px;
        }


        #noticeDiv2 {
            width: 100%;
            height: 80%;
            display: flex;
        }

        
        .noticeWrap {
            width: 1469px;
            height: 100%;
            display: flex;
            flex-direction: column;
            border: 1px solid #C3B091;
            border-radius: 10px;
        }

        .noticeWrap>a {
            width: 100%;
            height: 9%;
            display: flex;
            flex-direction: row; 
        }

        #noticeFirstColumn {
            background-color: #F9F5EA;
            border-radius: 10px 10px 0px 0px;
            border-bottom: 1px solid #C3B091;
            width: 100%;
            height: 9%;
        }

        .noticeColumn {
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

        .check {
            width: 10%;
        }

        .important {
            width: 10%;
        }

        .noticeNo {
            width: 10%;
        }

        .noticeName {
            width: 40%;
        }

        .writeDate {
            width: 20%;
        }

        .deleteYN {
            width: 10%;
        }
        
        .deleteYNVal {
            width: 10%;
        }

        #noticeDiv3 {
            width: 100%;
            height: 10%;
            display: flex;
            flex-direction: row;
        }



        #noticeDiv3_not_used {
            width: 15%;
            height: 100%;
        }

        #noticeDiv3_paging {
            width: 70%;
            height: 100%;
            display: flex;
            text-align: center;
            justify-content: center;
            align-items: center;
            font-size: 18px;
        }
        #noticeDiv3_paging>div {
            padding: 10px;
        }

        #noticeDiv3_edit {
            width: 15%;
            height: 100%;
            display : flex;
            text-align: center;
            align-items: center;
            flex-direction: row;
            justify-content: space-evenly;
            padding-right: 10px;
        }
        
        #noticeDiv3_edit>div>input {
        	width: 80px; 
        	height: 30px; 
        }
        

</style>
</head>
<body>

	<%@ include file="/WEB-INF/views/common/adminLayout.jsp" %>
	
	
	<content>
       <div id="noticeManage">

         <div id="notice">
             <div id="noticeDiv1">
                 <div id="noticeDiv1_not_used"></div>
                     <div id="noticeDiv1_search">
                         <form action="">
                             
                            <select name="deleteYN" id="searchWhat">
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
                        <div id="noticeDiv2">
                            <div class="noticeWrap">
                                <div id="noticeFirstColumn" class="noticeColumn">
                                    <div class="check">선택</div>
                                    <div class="important">중요</div>
                                    <div class="noticeNo">번호</div>
                                    <div class="noticeName">공지사항 이름</div>
                                    <div class="writeDate">작성일자</div>
                                    <div class="deleteYN">삭제여부</div>
                               </div>
                               
                            	<c:forEach items="${list}" var="item">
                                    	<a href="<%=contextPath%>/admin/notice/detail?no=${item.no}">
	                                        <div class="noticeColumn">
	                                           <div class="check"><input type="checkbox" class="form-check-input" name="boardCheck" value=${item.no}></div>
			                                   <div class="important">${item.importantYn}</div>
			                                   <div class="noticeNo">${item.no}</div>
			                                   <div class="noticeName">${item.title}</div>
			                                   <div class="writeDate">${item.writeDate}</div>
			                                   <div class="deleteYNVal">${item.deleteYn}</div>
	                                           
	                                        </div>
                                    	</a>
                                </c:forEach>
                                    
                                
                               
                            </div>
                        </div>
                        <div id="noticeDiv3">
    
                            <div id="noticeDiv3_not_used"></div>
                            <div id="noticeDiv3_paging">
                                <% if (currentPage>10) { %>
								<div> <a href="<%=contextPath %>/admin/notice?p=<%=startPage-10 %>"> ◀ </a> </div>
								<%} %>
								<% for(int i = startPage; i <= endPage; ++i) { %>
									<% if(i == currentPage) {%>
										<div> <a><%=i%></a></div>
									<%} else { %>
									<div> <a href="<%=contextPath %>/admin/notice?p=<%=i%>"><%=i%></a></div>
									<%} %>
								<%} %>
								<% if (currentPage != maxPage) { %>
									<% if (maxPage< currentPage+10) { %>
										<div> <a href="<%=contextPath %>/admin/notice?p=<%=maxPage%>"> ▶ </a></div>
									<%} else if (maxPage>10) { %>
											<div> <a href="<%=contextPath %>/admin/notice?p=<%=startPage+10%> "> ▶ </a></div>									<%} %>
									<%} %>
								
								<% if (currentPage != maxPage) { %>
									<% if (maxPage>10) { %>
								<div> <a href="<%=contextPath %>/admin/notice?p=<%=maxPage%> "> ▶▶ </a></div>
									<%} %>
								<%} %>
                            </div>
                            <div id="noticeDiv3_edit">
                            	<div><input type="button" value="작성하기" class="button" onclick="location.href='<%=contextPath%>/admin/notice/install';"></div>
                                <div><input id="deleteBtn" type="button" value="삭제하기" class="button"></div>
               </div>
    
            </div>
         </div>
    
      </div>

	</content>
	
	 <script>
                
				 $(document).ready(function(){
                    $('#deleteBtn').click(function() {
                        const checkBoxArr = [];
                        $("input:checkbox[name='boardCheck']:checked").each(function() {
                        	checkBoxArr.push($(this).val());
                        	
                        })
                        
                       	
                        console.log(checkBoxArr);
                        $.ajax({
                        	url : "<%=contextPath%>/admin/notice/delete" ,
                        	type:"POST",
                        	traditional : true,
                        	data : {
                        		key : checkBoxArr
                        	},
                        	success:function(result) {
                        		document.location.reload();
                        	},
                        	error:function(error) {
                        		alert("삭제에 실패하였습니다.");
                        	}
                        });
                    });
				 });
                
                </script>

</body>
</html>