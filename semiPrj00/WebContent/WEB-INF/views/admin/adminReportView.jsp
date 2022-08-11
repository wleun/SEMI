<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	    #reportManage {
            display: flex;
            flex-direction: row;
            justify-content: center;
            width: 1632px;
            height: 972px;
        }

        #reportManageDivWrap {
            display: flex;
            flex-direction: column;
            align-self: center;
            width: 90%;
            height: 85%;
        }

        #reportManageDiv1 {
            width: 100%;
            height: 10%;
            display: flex;
            flex-direction: row;
            align-items: flex-start;
        }

        #reportManageDiv1_not_used {
            width: 80%;
            height: 100%;
        }


        #reportManageDiv1_search {
            width: 20%;
            height: 100%;
            display: flex;
            flex-direction: row;
            justify-content: space-evenly;
        }

        #reportManageDiv1_search * {
            height: 60%;
            font-size: 14px;
            display: flex;
            margin: 3px;
            align-self: center;
            text-align: center;
            border-radius: 16px;
        }
        
        #reportManageDiv1_search select {
        	width : 80px;
        }

        #reportManageDiv2 {
            width: 100%;
            height: 80%;
            display: flex;
        }

        
        .reportManageWrap {
            width: 1469px;
            height: 100%;
            display: flex;
            flex-direction: column;
            border: 1px solid #C3B091;
            border-radius: 16px;
        }

        #reportManageFirstColumn {
            background-color: #F9F5EA;
            border-radius: 16px 16px 0px 0px;
            border-bottom: 1px solid #C3B091;
        }

        .reportManageColumn {
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
            width: 7%;
        }

        .reportNo {
            width: 7%;
        }

        .reportMember {
            width: 13%;
        }

        .reportPrj {
            width: 13%;
        }

        .reportContent {
            width : 20%;
        }

        .reportDate {
            width: 10%;
        }
        
        .reportStatus {
        	width : 10%;
        }

        .reportAction {
        	width : 13%;
        }

        .reportQuitYN {
            width: 7%;
        }

        #reportManageDiv3 {
            width: 100%;
            height: 10%;
            display: flex;
            flex-direction: row;
        }



        #reportManageDiv3_not_used {
            width: 20%;
            height: 100%;
        }

        #reportManageDiv3_paging {
            width: 60%;
            height: 100%;
            display: flex;
            text-align: center;
            justify-content: center;
            align-items: center;
            font-size: 18px;
        }
        #reportManageDiv3_paging>div {
            padding: 10px;
        }

        #reportManageDiv3_delete {
            width: 20%;
            height: 100%;
            display : flex;
            text-align: center;
            align-items: center;
            flex-direction: row;
            justify-content: flex-end;
            padding-right: 10px;
        }
        
        #reportManageDiv3_delete>div>input {
        	width: 80px; 
        	height: 30px; 
        	border-radius: 16px; 
        	background-color: white
        }
</style>
</head>
<body>

	<%@ include file="/WEB-INF/views/common/adminLayout.jsp" %>
	
	
	<content>
       <div id="reportManage">

         <div id="reportManageDivWrap">
             <div id="reportManageDiv1">
                 <div id="reportManageDiv1_not_used"></div>
                     <div id="reportManageDiv1_search">
                         <form action="">
    
                           <select name="what" id="searchWhat">
                              <option value="receipt">접수</option>
                              <option value="processing">처리중</option>
                               <option value="completion">조치완료</option>
                           </select>
    
                                <input type="search" name="search">
                                <input type="IMAGE" src="<%=contextPath %>/resources/img/search_icon_pse.png" alt="검색 이미지">
                               </form>
                            </div>
                        </div>
                        <div id="reportManageDiv2">
                            <div class="reportManageWrap">
                                <div id="reportManageFirstColumn" class="reportManageColumn">
                                    <div class="check">선택</div>
                                    <div class="reportNo">신고번호</div>
                                    <div class="reportMember">신고자</div>
                                    <div class="reportPrj">신고 프로젝트</div>
                                    <div class="reportContent">신고내용</div>
                                    <div class="reportDate">접수날짜</div>
                                    <div class="reportStatus">처리상태</div>
                                    <div class="reportAction">조치내용</div>
                                    <div class="reportQuitYN">탈퇴여부</div>
                                </div>
                            
                                <div class="reportManageColumn">
                                    <div class="check"><input type="checkbox"></div>
                                    <div class="reportNo">1</div>
                                    <div class="reportMember">신고자1</div>
                                    <div class="reportPrj">신고 프로젝트11</div>
                                    <div class="reportContent">신고내용1111111</div>
                                    <div class="reportDate">2022-08-09</div>
                                    <div class="reportStatus">접수</div>
                                    <div class="reportAction"></div>
                                    <div class="reportQuitYN">N</div>
                                    
                                </div>
                                <div class="reportManageColumn">
                                    <div class="check"><input type="checkbox"></div>
                                    <div class="reportNo">2</div>
                                    <div class="reportMember">신고자2</div>
                                    <div class="reportPrj">신고 프로젝트22</div>
                                    <div class="reportContent">신고내용2222222</div>
                                    <div class="reportDate">2022-08-09</div>
                                    <div class="reportStatus">조치완료</div>
                                    <div class="reportAction">신고 프로젝트 삭제</div>
                                    <div class="reportQuitYN">N</div>
                                    
                                </div>
                               
                            </div>
                        </div>
                        <div id="reportManageDiv3">
    
                            <div id="reportManageDiv3_not_used"></div>
                            <div id="reportManageDiv3_paging">
                                <div>◀</div>
                                <div>1</div>
                                <div>2</div>
                                <div>3</div>
                                <div>4</div>
                                <div>5</div>
                                <div>▶</div>
                            </div>
                            <div id="reportManageDiv3_delete">
                                <div><input type="button" value="삭제하기"></div>
               </div>
    
            </div>
         </div>
    
      </div>

	</content>

</body>
</html>