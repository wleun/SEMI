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
            border-radius: 16px;
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
            border-radius: 16px;
        }
        
        #memberManageFirstColumn {
            background-color: #F9F5EA;
            border-radius: 16px 16px 0px 0px;
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
            width: 7%;
        }

        .memberNo {
            width: 7%;
        }

        .memberType {
            width: 8%;
        }

        .memberLevel {
            width: 11%;
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
            width: 8%;
        }

        .memberQuitDate {
            width: 8%;
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
                                </div>
                            
                                    <div class="memberManageColumn">
                                        <div class="check"><input type="checkbox"></div>
                                        <div class="memberNo">1</div>
                                        <div class="memberType">사업자회원</div>
                                        <div class="memberLevel">브론즈</div>
                                        <div class="memberName">와디즈</div>
                                        <div class="memberEmail">Wadiz@wadiz.com</div>
                                        <div class="memberPhone">010-000-0000</div>
                                        <div class="memberStatus">탈퇴</div>
                                        <div class="memberEnrollDate">2022-08-01</div>
                                        <div class="memberSuspendedDate">2022-08-05</div>
                                        <div class="memberQuitDate">2022-08-13</div>
                                        
                                    </div>


                                    <div class="memberManageColumn">
                                        <div class="check"><input type="checkbox"></div>
                                        <div class="memberNo">1</div>
                                        <div class="memberType">일반회원</div>
                                        <div class="memberLevel">일반</div>
                                        <div class="memberName">와디즈</div>
                                        <div class="memberEmail">Wadiz@wadiz.com</div>
                                        <div class="memberPhone">010-000-0000</div>
                                        <div class="memberStatus">정지</div>
                                        <div class="memberEnrollDate">2022-08-01</div>
                                        <div class="memberSuspendedDate">2022-08-10</div>
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
                            	<div><input type="button" value="회원정지" class="button"></div>
                            	<div><input type="button" value="정지해제" class="button"></div>
               </div>
    
            </div>
         </div>
    
      </div>

	</content>

</body>
</html>