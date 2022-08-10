<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
            width: 80%;
            height: 100%;
        }


        #memberManageDiv1_search {
            width: 20%;
            height: 100%;
            display: flex;
            flex-direction: row;
            justify-content: space-evenly;
        }

        #memberManageDiv1_search * {
            height: 60%;
            font-size: 14px;
            display: flex;
            margin: 5px;
            align-self: center;
            text-align: center;
            border-radius: 16px;
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
            border-radius: 16px;
        }

        #memberManageFirstColumn {
            background-color: #F9F5EA;
            border-radius: 16px 16px 0px 0px;
            border-bottom: 1px solid #C3B091;
        }

        .memberManageColumn {
            width: 100%;
            height: 8%;
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

        .memberNo {
            width: 7%;
        }

        .memberType {
            width: 7%;
        }

        .memberLevel {
            width: 7%;
        }

        .memberName {
            width: 13%;
        }

        .memberEmail {
            width: 12%;
        }

        .memberPhone {
            width : 11%;
        }

        .memberEnrollDate {
            width: 10%;
        }
        
        .memberSuspendYN {
        	width : 7%;
        }

        .memberQuitYN {
            width: 7%;
        }

        .memberQuitDate {
            width: 10%;
        }

        #memberManageDiv3 {
            width: 100%;
            height: 10%;
            display: flex;
            flex-direction: row;
        }



        #memberManageDiv3_not_used {
            width: 20%;
            height: 100%;
        }

        #memberManageDiv3_paging {
            width: 60%;
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
            width: 20%;
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
        	border-radius: 16px; 
        	background-color: white
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
                                    <div class="memberSuspendYN">정지여부</div>
                                    <div class="memberQuitYN">탈퇴여부</div>
                                    <div class="memberEnrollDate">가입일</div>
                                    <div class="memberQuitDate">탈퇴일</div>
                                </div>
                            
                                <div class="memberManageColumn">
                                    <div class="check"><input type="checkbox"></div>
                                    <div class="memberNo">1</div>
                                    <div class="memberType">개인사업자</div>
                                    <div class="memberLevel">브론즈</div>
                                    <div class="memberName">와디즈</div>
                                    <div class="memberEmail">Wadiz@wadiz.com</div>
                                    <div class="memberPhone">010-000-0000</div>
                                    <div class="memberSuspendYN">N</div>
                                    <div class="memberQuitYN">N</div>
                                    <div class="memberEnrollDate">2022-08-01</div>
                                    <div class="memberQuitDate">X</div>
                                    
                                </div>
                                <div class="memberManageColumn">
                                    <div class="check"><input type="checkbox"></div>
                                    <div class="memberNo">1</div>
                                    <div class="memberType">개인사업자</div>
                                    <div class="memberLevel">브론즈</div>
                                    <div class="memberName">와디즈</div>
                                    <div class="memberEmail">Wadiz@wadiz.com</div>
                                    <div class="memberPhone">010-000-0000</div>
                                    <div class="memberSuspendYN">N</div>
                                    <div class="memberQuitYN">N</div>
                                    <div class="memberEnrollDate">2022-08-01</div>
                                    <div class="memberQuitDate">X</div>
                                    
                                </div>
                               
                            </div>
                        </div>
                        <div id="memberManageDiv3">
    
                            <div id="memberManageDiv3_not_used"></div>
                            <div id="memberManageDiv3_paging">
                                <div>◀</div>
                                <div>1</div>
                                <div>2</div>
                                <div>3</div>
                                <div>4</div>
                                <div>5</div>
                                <div>▶</div>
                            </div>
                            <div id="memberManageDiv3_edit">
                            	<div><input type="button" value="작성하기"></div>
                            	<div><input type="button" value="수정하기"></div>
                                <div><input type="button" value="삭제하기"></div>
               </div>
    
            </div>
         </div>
    
      </div>

	</content>

</body>
</html>