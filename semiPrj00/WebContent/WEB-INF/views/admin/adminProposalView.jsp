<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
            border-radius: 16px;
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
            border-radius: 16px;
        }

        .proposalManageWrap>a {
            width: 100%;
            height: 9%;
        }

        #proposalManageFirstColumn {
            background-color: #F9F5EA;
            border-radius: 16px 16px 0px 0px;
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
        	border-radius: 16px; 
        	background-color: white
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
                              <option value="processing">처리중</option>
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

                                <a href="">
                                    <div class="proposalManageColumn">
                                        <div class="proposalNo">1</div>
                                        <div class="proposalMember">텀블벅</div>
                                        <div class="proposalPrjCategory">IT테크</div>
                                        <div class="proposalPrjName">프로젝트1111</div>
                                        <div class="proposalDate">2022-08-10</div>
                                        <div class="proposalStatus">처리중</div>
                                    </div>
                                </a>

                                <a href="">
                                    <div class="proposalManageColumn">
                                        <div class="proposalNo">2</div>
                                        <div class="proposalMember">와디즈</div>
                                        <div class="proposalPrjCategory">웰빙</div>
                                        <div class="proposalPrjName">프로젝트2222</div>
                                        <div class="proposalDate">2022-08-11</div>
                                        <div class="proposalStatus">반려</div>
                                    </div>
                                </a>
                            
                                
                               
                            </div>
                        </div>
                        <div id="proposalManageDiv3">
    
                            <div id="proposalManageDiv3_not_used"></div>
                            <div id="proposalManageDiv3_paging">
                                <div>◀</div>
                                <div>1</div>
                                <div>2</div>
                                <div>3</div>
                                <div>4</div>
                                <div>5</div>
                                <div>▶</div>
                            </div>
                            <div id="proposalManageDiv3_delete">
                                <div><input type="button" value="삭제하기"></div>
               </div>
    
            </div>
         </div>
    
      </div>

	</content>


</body>
</html>