<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>
		#eventManage {
            display: flex;
            flex-direction: row;
            justify-content: center;
            width: 1632px;
            height: 972px;
        }

        #event {
            display: flex;
            flex-direction: column;
            align-self: center;
            width: 90%;
            height: 85%;
        }

        #eventDiv1 {
            width: 100%;
            height: 10%;
            display: flex;
            flex-direction: row;
            align-items: flex-start;
        }

        #eventDiv1_not_used {
            width: 80%;
            height: 100%;
        }


        #eventDiv1_search {
            width: 20%;
            height: 100%;
            display: flex;
            flex-direction: row;
            justify-content: space-evenly;
        }

        #eventDiv1_search * {
            height: 60%;
            font-size: 14px;
            display: flex;
            margin: 5px;
            align-self: center;
            text-align: center;
            border-radius: 16px;
        }

        #eventDiv2 {
            width: 100%;
            height: 80%;
            display: flex;
        }

        
        .eventWrap {
            width: 1469px;
            height: 100%;
            display: flex;
            flex-direction: row;
        }

        .eventArea {
            width: 33.33%;
            height: 100%;
            display: flex;
            flex-direction: column;
        }

        .eventArea>div {
            width: 100%;
            height: 33.33%;
            border : 1px solid black;
        }

        #eventFirstColumn {
            background-color: #F9F5EA;
            border-radius: 16px 16px 0px 0px;
            border-bottom: 1px solid #C3B091;
        }

        

        #eventDiv3 {
            width: 100%;
            height: 10%;
            display: flex;
            flex-direction: row;
        }



        #eventDiv3_not_used {
            width: 20%;
            height: 100%;
        }

        #eventDiv3_paging {
            width: 60%;
            height: 100%;
            display: flex;
            text-align: center;
            justify-content: center;
            align-items: center;
            font-size: 18px;
        }
        #eventDiv3_paging>div {
            padding: 10px;
        }

        #eventDiv3_edit {
            width: 20%;
            height: 100%;
            display : flex;
            text-align: center;
            align-items: center;
            flex-direction: row;
            justify-content: space-evenly;
            padding-right: 10px;
        }
        
        #eventDiv3_edit>div>input {
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
       <div id="eventManage">

         <div id="event">
             <div id="eventDiv1">
                 <div id="eventDiv1_not_used"></div>
                     <div id="eventDiv1_search">
                         <form action="">
    
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
                        <div id="eventDiv2">
                            <div class="eventWrap">

                                <div class="eventArea">
                                    <div></div>
                                    <div></div>
                                    <div></div>
                                </div>
                                <div class="eventArea">
                                    <div></div>
                                    <div></div>
                                    <div></div>
                                </div>
                                <div class="eventArea">
                                    <div></div>
                                    <div></div>
                                    <div></div>
                                </div>
                                
                            </div>
                        </div>
                        <div id="eventDiv3">
    
                            <div id="eventDiv3_not_used"></div>
                            <div id="eventDiv3_paging">
                                <div>◀</div>
                                <div>1</div>
                                <div>2</div>
                                <div>3</div>
                                <div>4</div>
                                <div>5</div>
                                <div>▶</div>
                            </div>
                            <div id="eventDiv3_edit">
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