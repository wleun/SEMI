<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>

		#dashBoard {
            display: flex;
            flex-direction: row;
            width: 1632px;
            height: 972px;
        }

        

        .dashBoard>div {
            background-color: white;
            border: 1px solid #C3B091;;
            border-radius: 10px;
            /* filter: drop-shadow(0px 1px 2px #C3B091); */
        }

        .dashBoard{
            width: 33.333%;
            height: 100%;
            padding: 0px;
            display: flex;
            flex-direction: column;
            justify-content: space-evenly;
            text-align: center;
            padding: 50px;
        }

        #summary {
            width: 430px;
            height: 135px;
        }

        #summaryText {
            width: 100%;
            height: 35%;
            font-size: 18px;
        }
        

        #summaryTable {
            padding-top: 3px;
            padding-right: 15px;
        }

        #summaryTable >table {
            width: 100%;
            height: 100%;
            font-size: 14px;
            text-align: center;
        }

        #proposal {
            width: 430px;
            height: 240px;
        }

        #proposalText {
            width: 100%;
            height: 25%;
        }

        #proposalTable {
            width: 100%;
            height: 75%;
            border-top : 1px solid #C3B091;
        }
        
        #proposalTable>table {
        	width : 100%;
        	height : 100%;
        }

        

        #report {
            width: 430px;
            height: 240px;
        }

        #reportText {
            width: 100%;
            height: 22%;

        }
        
        #reportTable {
        	width : 100%;
        	height : 78%;
            border-top : 1px solid #C3B091;
        }

        #eventDashBoard {
            width: 430px;
            height: 415px;
        }

        #eventThumbnail {
            height: 51%;
            border-radius: 10px 10px 0px 0px;
            border: 0px;
        }

        #eventOngoing {
            height: 49%;
            border-radius: 0px 0px 10px 10px;
            border: 0px;
        }

        #eventOngoingText {
            width: 100%;
            height: 25%;

        }
        
        #eventOngoingTable {
        	width : 100%;
        	height : 75%;
            border-top : 1px solid #C3B091;
        }

        #noticeDashBoard {
            width: 430px;
            height: 250px;
        }

        #noticeDashBoardText {
            width: 100%;
            height: 25%;
        }
        
        #noticeDashBoardTable {
        	width: 100%;
            height: 75%;
            border-top : 1px solid #C3B091;
        }

        #beforeStartPrj {
            width: 430px;
            height: 200px;
        }

        #beforeStartPrjText {
            width: 100%;
            height: 23%;

        }
        
        #beforeStartPrjTable {
        
        	width: 100%;
            height: 77%;
            border-top : 1px solid #C3B091;
        }

        #todayPrj {
            width: 430px;
            height: 200px;
        }

        #todayPrjText {
            width: 100%;
            height: 23%;

        }
        
        #todayPrjTable {
        	width: 100%;
            height: 77%;
            border-top : 1px solid #C3B091;
        }

        #successproject{
            width: 430px;
            height: 200px;
        }

        #successprojectText {
            width: 100%;
            height: 23%;
        }
        
        #successprojectbeforeStart {
       		width: 100%;
            height: 77%;
            border-top : 1px solid #C3B091;
        }
        
        #successprojectTable {
            width: 100%;
            height: 77%;
            font-size: 18px;
            border-top : 1px solid #C3B091;
        }
        
        .animationHover>div>table {
        	width : 100%;
        	height : 100%;
        }

        .tableWrap {
            display: flex;
            flex-direction: column;
            justify-content: flex-start;
            align-items: center;
        }

        .tableWrap * {
            font-size: 15px;
         
        }

        .textWrap {
            
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            font-size: 18px;
            background-color: #F9F5EA;
            border-radius: 10px 10px 0px 0px;
        }

        #dashBoard a {
            width: 100%;
            height: 20%;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
        }
        .column {
            width: 95%;
            height: 95%;
            display: flex;
            flex-direction: row;
            justify-content: center;
            align-items: center;
        }
        
        .firstColumn:hover {
        	background-color: 
        }

        #dashBoard a:hover {
            background-color: #48CA7D;
            color: white;
            cursor: pointer;
        }

        .column:hover {
            color: white;
        }


        .column > div {
            text-align: center;
        }
        
        .firstColumn:hover {
        	background-color : #C3B091;
        	color : black;
        }

       

        /*신고*/

        .reportNo {
            width: 15%;
        }

        .reportMember {
            width: 30%;
        }

        .reportProject {
            width: 40%;
        }

        .reportStatus {
            width: 15%;
        }

        /*이벤트*/

        .eventNo {
            width: 15%;
        }

        .importantYn {
            width: 20%;
        }

        .eventName {
            width: 45%;
        }

        .eventEndDate {
            width: 20%;
        }


        /*공지사항*/

        .noticeNo {
            width: 15%;
        }

        .noticeName {
            width: 45%;
        }

        .noticeWriteDate {
            width: 20%;
        }


        /*프로젝트*/
        .prjNo {
            width: 15%;
        }

        .prjName {
            width: 40%;
        }

        .prjMaker {
            width: 25%;
        }

        .prjCategory {
            width: 20%;
        }
        
        
	
</style>
</head>
<body>

	<%@ include file="/WEB-INF/views/common/adminLayout.jsp" %>

	<content> 
            <div id="dashBoard">

                <div id="dashBoardDiv1" class="dashBoard">
                    <div id="summary" class="animationHover">
                        <div id="summaryText" class="textWrap">요약</div>
                        <div id="summaryTable" class="tableWrap">
                            <table>
                                <tr>
                                    <td>접수된 제안서</td>
                                    <td>${cntVo.proposalCnt}건</td>
                                    <td width="10px"></td>
                                    <td>|</td>
                                    <td>접수된 신고</td>
                                    <td>${cntVo.reportCnt}건</td>
                                </tr>
                                <tr>
                                    <td>진행중인 이벤트</td>
                                    <td>${cntVo.eventCnt}건</td>
                                    <td width="10px"></td>
                                    <td>|</td>
                                    <td>유효한 공지사항</td>
                                    <td>${cntVo.noticeCnt}건</td>
                                </tr>
                                <tr>
                                    <td>시작전 프로젝트</td>
                                    <td>${cntVo.beforePrjCnt}건</td>
                                    <td width="10px"></td>
                                    <td>|</td>
                                    <td>진행중 프로젝트</td>
                                    <td>${cntVo.prjCnt}건</td>
                                </tr>
                                
                            </table>
                        </div>
                    </div>
                   
                   
                   
                    <div id="proposal" class="animationHover">
                        <div id="proposalText" class="textWrap">제안서</div>
                        <div id="proposalTable" class="tableWrap">
                            <a>
	                            <div class="column" class="firstColumn">
	                                <div class="prjNo">번호</div>
	                                <div class="prjMaker">메이커</div>
	                                <div class="prjName">프로젝트명</div>
	                                <div class="prjCategory">카테고리</div>
	                            </div>
                            </a>
                           <c:forEach items="${proposalVoList}" var="item">
                            <a href="<%=contextPath%>/admin/proposal/detail?no=${item.no}">
	                            <div class="column">
	                                <div class="prjNo">${item.no}</div>
	                                <div class="prjMaker">${item.nick}</div>
	                                <div class="prjName">${item.name}</div>
	                                <div class="prjCategory">${item.categoryName}</div>
	                            </div>
                            </a>
                           </c:forEach>
                        </div>
                    </div>
                   
                   
                    <div id="report" class="animationHover">
                        <div id="reportText" class="textWrap" >접수된 신고</div>
                        <div id="reportTable" class="tableWrap">
                        	<a>
                        		<div class="column" class="firstColumn">
                                <div class="reportNo">번호</div>
                                <div class="reportMember">신고자</div>
                                <div class="reportProject">프로젝트</div>
                                <div class="reportStatus">처리상태</div>
                            </div>
                        	</a>
                            
                          <c:forEach items="${reportVoList}" var="item">
                            <a href="<%=contextPath%>/admin/report?p=1">
                            	<div class="column" >
                                <div class="reportNo">${item.no}</div>
                                <div class="reportMember">${item.memberNick}</div>
                                <div class="reportProject">${item.projectName}</div>
                                <div class="reportStatus">${item.reportAc}</div>
                            	</div>
                            </a>
                          </c:forEach>  
                        </div>
                    </div>
               
               
               
                </div>
                
                
                
                <div id="dashBoardDiv2" class="dashBoard">
                    <div id="eventDashBoard" class="animationHover">
                        <div id="eventThumbnail">
                     
                       
							<div id="demo" class="carousel slide" data-bs-ride="carousel">
							
							  
							  <div class="carousel-inner">
							  	<c:forEach items="${eventVoList}" var="item">
								    <div class="carousel-item active" id="thumbnail">
								      <img src="<%=contextPath %>/resources/admin/event/${item.thumbnailName}" alt="이벤트 섬네일" class="d-block w-100" width="428px" height="260px" onclick="location.href='<%=contextPath%>/admin/event/detail?no=${item.no}';" style="border-radius: 10px 10px 0px 0px; cursor: pointer;">
								    </div>
								</c:forEach>
							  </div>
							</div>
                        </div>
                       
                       
                        <div id="eventOngoing">
                            <div id="eventOngoingText" class="textWrap">진행중인 이벤트</div>
                            <div id="eventOngoingTable" class="tableWrap">
                                <a>
                                	<div class="column" class="firstColumn">
                                    <div class="eventNo">번호</div>
	                                <div class="importantYn">중요도</div>
	                                <div class="eventName">이벤트명</div>
	                                <div class="eventEndDate">마감일</div>
                                	</div>
                                </a>
                              <c:forEach items="${eventVoList}" var="item">
                                <a href="<%=contextPath%>/admin/event/detail?no=${item.no}">
                                	<div class="column">
                                        <div class="eventNo">${item.no}</div>
                                        <div class="importantYn">${item.importantYN}</div>
                                        <div class="eventName">${item.title}</div>
                                        <div class="eventEndDate">${item.endDate}</div>
                                	</div>
                                </a>
                              </c:forEach>   
                            </div>
                        </div>
                    
                    
                    </div>
                    
                    
                    <div id="noticeDashBoard" class="animationHover">
                        <div id="noticeDashBoardText" class="textWrap" >공지사항 관리</div>
                        <div id="noticeDashBoardTable" class="tableWrap">
                            <a>
                            	<div class="column" class="firstColumn">
                                <div class="noticeNo">번호</div>
                                <div class="importantYn">중요도</div>
                                <div class="noticeName">공지사항명</div>
                                <div class="noticeWriteDate">작성일</div>
                            	</div>
                            </a>
                          <c:forEach items="${noticeVoList}" var="item">
                            <a href="<%=contextPath%>/admin/notice/detail?no=${item.no}">
                            	<div class="column" >
                                <div class="noticeNo">${item.no}</div>
                                <div class="importantYn">${item.importantYn}</div>
                                <div class="noticeName">${item.title}</div>
                                <div class="noticeWriteDate">${item.writeDate}</div>
                            	</div>
                            </a>
                          </c:forEach>    
                            	
                        </div>
                    </div>
                </div>
                <div id="dashBoardDiv3" class="dashBoard">


                    <div id="beforeStartPrj" class="animationHover">
                        <div id="beforeStartPrjText" class="textWrap" >시작전 프로젝트</div>
                        <div id="beforeStartPrjTable" class="tableWrap">
                            <a>
                            	<div class="column" class="firstColumn">
                                <div class="prjNo">번호</div>
                                <div class="prjMaker">메이커</div>
                                <div class="prjName">프로젝트명</div>
                                <div class="prjCategory">카테고리</div>
                           		</div>
                            </a>
                          <c:forEach items="${beforePrjVoList}" var="item">  
                            <a href="<%=contextPath%>/project/view?num=${item.no}">
                            	<div class="column" >
                                <div class="prjNo">${item.no}</div>
                                <div class="prjMaker">${item.makerName}</div>
                                <div class="prjName">${item.projectName}</div>
                                <div class="prjCategory">${item.categoryName}</div>
                           		</div>
                            </a>
                          </c:forEach>  
                        </div>
                    </div>



                    <div id="todayPrj" class="animationHover">
                        <div id="todayPrjText" class="textWrap">진행중 프로젝트</div>
                        <div id="todayPrjTable" class="tableWrap">
                            <a>
                            	<div class="column" >
                                <div class="prjNo">번호</div>
                                <div class="prjMaker">메이커</div>
                                <div class="prjName">프로젝트명</div>
                                <div class="prjCategory">카테고리</div>
                           		</div>
                            </a>
                          <c:forEach items="${prjVoList}" var="item">  
                            <a href="<%=contextPath%>/project/view?num=${item.no}">
                            	<div class="column" >
                                <div class="prjNo">${item.no}</div>
                                <div class="prjMaker">${item.makerName}</div>
                                <div class="prjName">${item.projectName}</div>
                                <div class="prjCategory">${item.categoryName}</div>
                           		</div>
                            </a>
                          </c:forEach>   
                        </div>
                    </div>



                    <div id="successproject" class="animationHover">
                        <div id="successprojectText" class="textWrap">성공한 프로젝트</div>
                        <div id="successprojectTable" class="tableWrap">
                            <a>
                            	<div class="column" class="firstColumn">
                                <div class="prjNo">번호</div>
                                <div class="prjMaker">메이커</div>
                                <div class="prjName">프로젝트명</div>
                                <div class="prjCategory">카테고리</div>
                           		</div>
                            </a>
                           <c:forEach items="${successPrjVoList}" var="item">  
                            <a href="<%=contextPath%>/project/view?num=${item.no}">
                            	<div class="column" >
                                <div class="prjNo">${item.no}</div>
                                <div class="prjMaker">${item.makerName}</div>
                                <div class="prjName">${item.projectName}</div>
                                <div class="prjCategory">${item.categoryName}</div>
                           		</div>
                            </a>
                          </c:forEach> 
                            
                        </div>
                    </div>
                </div>
            </div>

            
        </content>

</body>
</html>