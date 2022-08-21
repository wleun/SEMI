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
	#prjManage {
            display: flex;
            flex-direction: row;
            justify-content: center;
            width: 1632px;
            height: 972px;
        }

        #board {
            display: flex;
            flex-direction: column;
            align-self: center;
            width: 90%;
            height: 85%;
        }

        #boardDiv1 {
            width: 100%;
            height: 10%;
            display: flex;
            flex-direction: row;
            align-items: flex-start;
        }

        #boardDiv1_not_used {
            width: 70%;
            height: 100%;
        }


        #boardDiv1_search {
            width: 30%;
            height: 100%;
            display: flex;
            flex-direction: row;
            justify-content: space-evenly;
        }

        #boardDiv1_search * {
            height: 60%;
            font-size: 14px;
            display: flex;
            margin: 5px;
            align-self: center;
            text-align: center;
            border-radius: 50px;
        }
        

        #boardDiv1_search select {
            width: 80px;
        }

        #boardDiv2 {
            width: 100%;
            height: 80%;
            display: flex;
        }

        
        .boardWrap {
            width: 1469px;
            height: 100%;
            display: flex;
            flex-direction: column;
            border: 1px solid #C3B091;
            border-radius: 10px;
        }

        .boardWrap>a {
            width: 100%;
            height: 9%;
            display: flex;
            flex-direction: row;   
        }

        #boardFirstColumn {
            background-color: #F9F5EA;
            border-radius: 10px 10px 0px 0px;
            border-bottom: 1px solid #C3B091;
            width: 100%;
            height: 9%;
        }

        .boardColumn {
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
            width: 6%;
        }

        .status {
            width: 8%;
        }
        
        .statusVal {
            width: 8%;
        }

        .prjNo {
            width: 6%;
        }

        .category {
            width: 13%;
        }

        .percent {
            width: 8%;
        }

        .prjName {
            width: 22%;
        }

        .makerName {
            width: 15%;
        }

        .period {
            width: 15%;

        }

        .reportCnt {
            width: 7%;
        }


        #boardDiv3 {
            width: 100%;
            height: 10%;
            display: flex;
            flex-direction: row;
        }



        #boardDiv3_not_used {
            width: 20%;
            height: 100%;
        }

        #boardDiv3_paging {
            width: 60%;
            height: 100%;
            display: flex;
            text-align: center;
            justify-content: center;
            align-items: center;
            font-size: 18px;
        }
        #boardDiv3_paging>div {
            padding: 10px;
        }

        #boardDiv3_delete {
            width: 20%;
            height: 100%;
            display : flex;
            text-align: center;
            align-items: center;
            flex-direction: row;
            justify-content: flex-end;
            padding-right: 10px;
        }

        #boarderDiv3_delete div {
            border: 1px solid #C3B091;
        }

</style>
</head>
<body>

	<%@ include file="/WEB-INF/views/common/adminLayout.jsp" %>

	<content>
                <div id="prjManage">

                    <div id="board">
                        <div id="boardDiv1">
                            <div id="boardDiv1_not_used"></div>
                            <div id="boardDiv1_search">
                               <form action="">
                                <select name="status" id="searchStatus">
                                    <option value="plan">진행예정</option>
                                    <option value="doing">진행중</option>
                                    <option value="done">종료된</option>
                                    <option value="success">성공한</option>
                                    <option value="deleted">삭제된</option>
                                </select>
    
                                <select name="what" id="searchWhat">
                                    <option value="title">제목</option>
                                    <option value="content">내용</option>
                                    <option value="titleContent">제목+내용</option>
                                    <option value="maker">메이커</option>
                                </select>
    
                                <input type="search" name="search">
                                <input type="IMAGE" src="<%=contextPath %>/resources/img/search_icon_pse.png" name="submit" vlaue="submit">

                               </form>
                            </div>
                        </div>
                        <div id="boardDiv2">
                            <div class="boardWrap">
                                <div id="boardFirstColumn" class="boardColumn">
                                    <div class="check">선택</div>
                                    <div class="prjNo">번호</div>
                                    <div class="status">상태</div>
                                    <div class="category">카테고리</div>
                                    <div class="percent">달성률</div>
                                    <div class="prjName">프로젝트 이름</div>
                                    <div class="makerName">메이커 이름</div>
                                    <div class="period">기간</div>
                                    <div class="reportCnt">신고횟수</div>
                                </div>
                            
                            <c:forEach items="${list}" var="item">
                                <a href="<%=contextPath%>/admin/projectDetail?no=${item.no}">
                                    <div class="boardColumn">
                                        <div class="check"><input type="checkbox" class="form-check-input" name="boardCheck" value=${item.no} ></div>
                                        <div class="prjNo">${item.no}</div>
                                        <div class="statusVal">${item.status}</div>
                                        <div class="category">${item.categoryName}</div>
                                        <div class="percent">X</div>
                                        <div class="prjName">${item.projectName}</div>
                                        <div class="makerName">${item.makerName}</div>
                                        <div class="period">${item.startDate} ~ ${item.endDate}</div>
                                        <div class="reportCnt">${item.reportCnt}</div>
                                    </div>
                                </a>
                            </c:forEach>
                            
                                
                            </div>
                        </div>
                        <div id="boardDiv3">
    
                            <div id="boardDiv3_not_used"></div>
                            <div id="boardDiv3_paging">
                                <% if (currentPage>10) { %>
								<div> <a href="<%=contextPath %>/admin/project?p=<%=startPage-10 %>"> ◀ </a> </div>
								<%} %>
								<% for(int i = startPage; i <= endPage; ++i) { %>
									<% if(i == currentPage) {%>
										<div> <a><%=i%></a></div>
									<%} else { %>
									<div> <a href="<%=contextPath %>/admin/project?p=<%=i%>"><%=i%></a></div>
									<%} %>
								<%} %>
								<% if (currentPage != maxPage) { %>
									<% if (maxPage< currentPage+10) { %>
										<div> <a href="<%=contextPath %>/admin/project?p=<%=maxPage%>"> ▶ </a></div>
									<%} else if (maxPage>10) { %>
											<div> <a href="<%=contextPath %>/admin/project?p=<%=startPage+10%> "> ▶ </a></div>									<%} %>
									<%} %>
								
								<% if (currentPage != maxPage) { %>
									<% if (maxPage>10) { %>
								<div> <a href="<%=contextPath %>/admin/project?p=<%=maxPage%> "> ▶▶ </a></div>
									<%} %>
								<%} %>
                            </div>
                            <div id="boardDiv3_delete">
                                <div><input id="submit" type="submit" value="삭제하기" class="button"></div>
                            </div>
    
                        </div>
                    </div>
    
                </div>
                
                
                <script>
                
                
                    $('#submit').click(function() {
                        const checkBoxArr = [];
                        $("input:checkbox[name='boardCheck']:checked").each(function() {
                        	checkBoxArr.push($(this).val());
                        	
                        })
                       	
                        console.log(checkBoxArr);
                        $.ajax({
                        	url : "<%=contextPath%>/admin/project/delete" ,
                        	type:"POST",
                        	traditional : true,
                        	data : {
                        		key : checkBoxArr
                        	},
                        	success:function(result) {
                        		console.log(result); //새로고침으로 인해서 출력이 안됨
                        	//	$(".statusVal").empty();
                        	//	$(".statusVal").load(location.href + "  .statusVal");
                        		document.location.reload();
                        	},
                        	error:function(error) {
                        		alert("삭제에 실패하였습니다.");
                        	}
                        });
                    });
                
                
                </script>

            
	</content>
</body>
</html>