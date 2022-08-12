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
            justify-content: flex-end;
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

        
        #eventDiv1_search select {
            width: 80px;
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
            width: 50%;
            height: 100%;
            display: flex;
            flex-direction: column;
        }

        .eventBox {
            width: 100%;
            height: 50%;
            display: flex;
            flex-direction: row;
            border-radius: 16px;
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
            width: 15%;
            height: 100%;
        }

        #eventDiv3_paging {
            width: 70%;
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
            width: 15%;
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

        .imgArea {
            width: 288px;
            height: 164px;
            margin: 0 auto;
            border-radius: 16px;
            border: 1px solid #C3B091;;
        }
        
        .half {
            width: 50%;
            height: 100%;
            display: flex;
            align-items: center;
            text-align: center;
            justify-content: center;
            flex-direction: column;
        }


        .eventTitle {
            width: 100%;
            height: 25%;
            align-items: center;
            text-align: center;
        }

        .eventPeriod {
            width: 100%;
            height: 20%;
            align-items: center;
            text-align: center;
        }

        .importantBox {
            width: 100%;
            height: 15%;
            display: flex;
            flex-direction:column;
            align-items: flex-start;
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
                        <div id="eventDiv2">
                            <div class="eventWrap">

                                <div class="eventArea">
                                    <div class="eventBox">
                                        <div class="half">
                                            <div class="eventTitle"><h2>이벤트6</h2></div>
                                            <div class="eventPeriod">2022-10-11~2022-11-10</div>
                                            <div class="eventStatus">진행예정</div>
                                        </div>
                                        <div class="half">
                                            <div class="imgArea"><img style="border-radius: 16px 16px 0px 0px;" width="100%" height="100%" src="<%=contextPath %>/resources/img/adminDashboard_img.jpg" alt="이벤트 섬네일"></div>
                                        </div>
                                    </div>
                                    <div class="eventBox">
                                        <div class="half">
                                            <div class="eventTitle"><h2>이벤트5</h2></div>
                                            <div class="eventPeriod">2022-08-11~2022-09-10</div>
                                            <div class="eventStatus">진행중</div>
                                        </div>
                                        <div class="half">
                                            <div class="imgArea"><img style="border-radius: 16px 16px 0px 0px;" width="100%" height="100%" src="<%=contextPath %>/resources/img/adminDashboard_img.jpg" alt="이벤트 섬네일"></div>
                                        </div>
                                    </div>
                                    <div class="eventBox">
                                        <div class="half">
                                            <div class="eventTitle"><h2>이벤트4</h2></div>
                                            <div class="eventPeriod">2022-04-11~2022-05-10</div>
                                            <div class="eventStatus">종료됨</div>
                                        </div>
                                        <div class="half">
                                            <div class="imgArea"><img style="border-radius: 16px 16px 0px 0px;" width="100%" height="100%" src="<%=contextPath %>/resources/img/adminDashboard_img.jpg" alt="이벤트 섬네일"></div>
                                        </div>
                                    </div>
                                </div>
                                <div class="eventArea">
                                    <div class="eventBox">
                                        <div class="half">
                                            <div class="eventTitle"><h2>이벤트3</h2></div>
                                            <div class="eventPeriod">2022-03-11~2022-04-10</div>
                                            <div class="eventStatus">종료됨</div>
                                        </div>
                                        <div class="half">
                                            <div class="imgArea"><img style="border-radius: 16px 16px 0px 0px;" width="100%" height="100%" src="<%=contextPath %>/resources/img/adminDashboard_img.jpg" alt="이벤트 섬네일"></div>
                                        </div>
                                    </div>
                                    <div class="eventBox">
                                        <div class="half">
                                            <div class="eventTitle"><h2>이벤트2</h2></div>
                                            <div class="eventPeriod">2022-02-10~2022-02-10</div>
                                            <div class="eventStatus">종료됨</div>
                                        </div>
                                        <div class="half">
                                            <div class="imgArea"><img style="border-radius: 16px 16px 0px 0px;" width="100%" height="100%" src="<%=contextPath %>/resources/img/adminDashboard_img.jpg" alt="이벤트 섬네일"></div>
                                        </div>
                                    </div>
                                    <div class="eventBox">
                                        <div class="half">
                                            <div class="eventTitle"><h2>이벤트1</h2></div>
                                            <div class="eventPeriod">2022-01-11~2022-02-10</div>
                                            <div class="eventStatus">종료됨</div>
                                        </div>
                                        <div class="half">
                                            <div class="imgArea"><img style="border-radius: 16px 16px 0px 0px;" width="100%" height="100%" src="<%=contextPath %>/resources/img/adminDashboard_img.jpg" alt="이벤트 섬네일"></div>
                                        </div>
                                    </div>
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
                                <div><input type="button" value="삭제하기"></div>
               </div>
    
            </div>
         </div>
    
      </div>

	</content>
	
	
	


</body>
</html>