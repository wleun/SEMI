<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
                            
                                <a href="<%=contextPath%>/admin/noticeDetail">
                                    <div class="noticeColumn">
                                        <div class="check"><input type="checkbox" class="form-check-input"></div>
                                        <div class="important">중요</div>
                                        <div class="noticeNo">번호</div>
                                        <div class="noticeName">공지사항 이름</div>
                                        <div class="writeDate">작성일자</div>
                                        <div class="deleteYN">삭제여부</div>
                                    </div>
                                </a>
                                <a href="<%=contextPath%>/admin/noticeDetail">
                                    <div class="noticeColumn">
                                        <div class="check"><input type="checkbox" class="form-check-input"></div>
                                        <div class="important">중요</div>
                                        <div class="noticeNo">번호</div>
                                        <div class="noticeName">공지사항 이름</div>
                                        <div class="writeDate">작성일자</div>
                                        <div class="deleteYN">삭제여부</div>
                                    </div>
                                </a>
                               
                            </div>
                        </div>
                        <div id="noticeDiv3">
    
                            <div id="noticeDiv3_not_used"></div>
                            <div id="noticeDiv3_paging">
                                <div>◀</div>
                                <div>1</div>
                                <div>2</div>
                                <div>3</div>
                                <div>4</div>
                                <div>5</div>
                                <div>▶</div>
                            </div>
                            <div id="noticeDiv3_edit">
                            	<div><input type="button" value="작성하기" class="button" onclick="location.href='<%=contextPath%>/admin/noticeInstall';"></div>
                                <div><input type="button" value="삭제하기" class="button"></div>
               </div>
    
            </div>
         </div>
    
      </div>

	</content>

</body>
</html>