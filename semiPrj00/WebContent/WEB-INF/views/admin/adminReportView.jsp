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
            border-radius: 50px;
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
            border-radius: 10px;
        }

        .reportManageWrap>a {
            width: 100%;
            height: 9%;
        }

        #reportManageFirstColumn {
            background-color: #F9F5EA;
            border-radius: 10px 10px 0px 0px;
            border-bottom: 1px solid #C3B091;
            width: 100%;
            height: 9%;
        }

        .reportManageColumn {
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


        .reportNo {
            width: 9%;
        }

        .reportMember {
            width: 13%;
        }

        .reportPrj {
            width: 20%;
        }

        .reportContent {
            width : 20%;
        }

        .reportDate {
            width: 13%;
        }
        
        .reportStatus {
        	width : 10%;
        }

        .reportAction {
        	width : 15%;
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
        	border-radius: 50px; 
        	background-color: white
        }

        .modalBodyFlex {
            font-size: 17px;
            display: flex;
            flex-direction: column;
            justify-content: flex-start;
            text-align: justify;
        }

        .modalBodyFlex>* {
            padding : 3px;
        }

        .modalTextarea {
            width: 100%;
            height: 250px;
            border-radius: 10px;
            border: 1px solid #C3B091;
            display: flex;
            justify-content: center;
            align-items: center;
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
                                    <div class="reportNo">신고번호</div>
                                    <div class="reportMember">신고자</div>
                                    <div class="reportPrj">신고 프로젝트</div>
                                    <div class="reportContent">신고내용</div>
                                    <div class="reportDate">접수날짜</div>
                                    <div class="reportStatus">처리상태</div>
                                    <div class="reportAction">조치내용</div>
                                </div>
                            
                                <a data-bs-toggle="modal" href="#myModal">
                                    <div class="reportManageColumn">

                                        <div class="reportNo">1</div>
                                        <div class="reportMember">신고자1</div>
                                        <div class="reportPrj">신고 프로젝트11</div>
                                        <div class="reportContent">신고내용1111111</div>
                                        <div class="reportDate">2022-08-09</div>
                                        <div class="reportStatus">접수</div>
                                        <div class="reportAction"></div>
                                        
                                    </div>
                                </a>
                                
                                <a href="">
                                    <div class="reportManageColumn" >
                                        <div class="reportNo">2</div>
                                        <div class="reportMember">신고자2</div>
                                        <div class="reportPrj">신고 프로젝트22</div>
                                        <div class="reportContent">신고내용2222222</div>
                                        <div class="reportDate">2022-08-09</div>
                                        <div class="reportStatus">조치완료</div>
                                        <div class="reportAction">신고 프로젝트 삭제</div>
                                    </div>
                                </a>
                               
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
                 
    
            </div>
         </div>
    
      </div>

	</content>

    
    <!-- The Modal -->
    <div class="modal" id="myModal">
    <div class="modal-dialog modal-dialog-centered">
      <div class="modal-content">
  
        <!-- Modal Header -->
        <div class="modal-header ">
          <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
        </div>
  
        <!-- Modal body -->
        <div class="modal-body">
          <div class="modalBodyFlex">
            <div class="modalNo">신고번호 :</div>
            <div class="modalName">신고자 : </div>
            <div class="modalPrj">신고 프로젝트 : </div>
            <div class="modalStatus">상태 : </div>
            <div class="modaldate">접수날짜 : </div>
            <div class="modalText">
                내용
            </div>
            <div class="modalTextarea">
            </div>
          </div>
        </div>
  
        <!-- Modal footer -->
        <div class="modal-footer">
          <button>처리완료</button>
        </div>
  
      </div>
    </div>
  </div>


</body>
</html>