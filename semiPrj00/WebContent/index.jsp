<%@page import="com.kh.project.vo.ProjectVo"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
  	  List<ProjectVo> recommendList = (List<ProjectVo>)request.getAttribute("recommendList");
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
    /* 헤더 차지할 부분 */
    #header-div{
        width: 1920px;
        height: 120px;
    }
    /* 페이지 전체 틀(패딩작업) */
    #category-body{
        width: 1920px;
        height: 100%;
        padding-top: 120px;
        padding-left: 192px;
        padding-right: 192px;
        border-color:1px solid black;
    }
    /* 안쪽 틀(래퍼 작성) */
	#category-content-wrap{
        height: 100%;
        width: 100%;
        display: flex;
        /* flex-wrap: wrap; */
        /* justify-content: flex-start; */
        /* border:1px solid red; */
        overflow-x:scroll ;
        /* background-color: rgba(255, 255, 255, 0.675); */
        border-radius: 10px;
    }
    #category-content-wrap::-webkit-scrollbar{height: 6px;}
    #category-content-wrap::-webkit-scrollbar-thumb{background-color: #48CA7D;}
    #category-content-wrap::-webkit-scrollbar-track{background-color: lightgray;}
    /* 프로젝트 한개 당 래퍼 */
    .prj-wrap{
        height: 350px;
        width: 300px;
        margin: 30px;
        /* border:1px solid blue; */
    }
    .prj-img{
    	background-color: gray;
        height: 200px;
        width: 300px;
    }
    .prj-content{
        margin: 5px 0px;
    }
    .gage-div{
        height: 10%;
        width: 100%;
        display: flex;
        flex-wrap: wrap;
        justify-content: space-between;
        margin-top: 15px;
    }
    .gage-bar{
        width: 100%;
        height: 50%;
        display: flex;
    }
    .percentage{
        font-size: 18px;
    }
    .d-day, .percentage{
        color: #48CA7D;
    }
    .amount{
        color: gray;
    }
    .btn-success{
        background-color: #48CA7D!important;
        border: 0px!important;
    }
   
    .carousel{
        width: 1920px;
    }

    .submenu {
     list-style-type: none;
    position: right;
    display: none; 
    padding: 0px;
    margin: 0px;
    }
    #menu{
        padding: 0;
        margin: 0;
    }
    #menu li{
    list-style: none;
    padding: 0;
    margin: 0;
    }   
    #submenu-div{
    /* border: 1px solid black; */
    width: 150px;
    text-align: center;
    margin-top: 50px;
    margin-left: 1750px;
    position: fixed;
    margin-bottom: 100px;
    
    }
    #submenu-div a{
        color: black;
        text-decoration: none;
    }
    #subtop{
    height: 70px;
    width: 70px;
    font-size: 30px;
    border-radius: 50%;
    background-color: #48CA7D;
    padding-top: 15px;
    margin: 0 auto;
    }
    .submenu a{
        font-size: 20px;
        margin-top: 10px;
    }
    .slidebtn{
        background-color: #48CA7D;
        border-radius: 50px;
        border: 0px;
        color:white
    }
   .btndiv{
    float: right;
   }
</style>

<!--로드했을 때 submenu가 안보이게 하기 위함 -->

<body>

	<%@ include file="/WEB-INF/views/common/userHeader.jsp" %>
	
 <div id="header-div"></div>
	
    <!--배너-->
    <div id="carouselExampleIndicators" class="carousel slide" data-bs-ride="carousel">
        <div class="carousel-indicators">
          <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
          <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="1" aria-label="Slide 2"></button>
          <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="2" aria-label="Slide 3"></button>
        </div>
        <div class="carousel-inner">
          <div class="carousel-item active">
            <img src="resources/img/banner2.png" class="d-block w-100" alt="...">
          </div>
          <div class="carousel-item">
            <img src="resources/img/banner3.png" class="d-block w-100" alt="...">
          </div>
          <div class="carousel-item">
            <img src="resources/img/banner1.png" class="d-block w-100" alt="...">
          </div>
        </div>
        <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="prev">
          <span class="carousel-control-prev-icon" aria-hidden="true"></span>
          <span class="visually-hidden">Previous</span>
        </button>
        <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="next">
          <span class="carousel-control-next-icon" aria-hidden="true"></span>
          <span class="visually-hidden">Next</span>
        </button>
      </div>

      <!--메뉴-->
      <div id="submenu-div">
        <ul id="menu">
            <li style="font-size: 20px;" id="top-menu">
                <ul class="submenu" style="left:20px ;">
                    <li><a href="<%=contextPath %>/member/mypage">마이페이지</a></li>
                    <li><a href="<%=contextPath %>/member/myLike">좋아요</a></li>
                    <%if(loginMember != null){ %>
                    <li><a href="<%=contextPath %>/member/logout">로그아웃</a></li>
                    <%}else{ %>
                    <li><a href="<%=contextPath %>/member/login">로그인</a></li>
                    <%} %>
                </ul>
                click!
            </li>
            <li><a href=""><div id="subtop">TOP</div></a></li>
        </ul>
      </div>

<script>
$('#top-menu').click(function () {
    if ($(this).hasClass("active")) {
      $(this).children().css("display", "none");
      $(this).removeClass();
    } else {
      $(this).addClass("active");
      $(this).children().css("display", "block");
    }
  });

</script>

    <!-- 페이지 전체 틀 -->
    <div id="category-body">
        <!-- 카테고리 내용 래퍼 -->
        <h2>추천 프로젝트</h2> <h5>여러 카테고리의 프로젝트를 추천해드려요!</h5>
        <div id="category-content-wrap">
            <!-- 프로젝트 하나 당 래퍼 -->
            <%if(recommendList!=null){ %>
           <%for(ProjectVo p : recommendList){ %> 
            <div class="prj-wrap">
                <div class="prj-content prj-img">
                    <img src="<%=contextPath%>/resources/upload/<%=p.getThumbnailName()%>" alt="프로젝트 메인 사진">
                </div>
                <div class="prj-content prj-category">
                    <span><%=p.getCategoryNo()%></span> | <span><%=p.getMakerNo() %></span>
                </div>
                <div class="prj-content prj-title">
                    <%=p.getName() %>
                </div>
                <!-- 프로젝트 달성도 부분 -->
                <div class="prj-content gage-div">
                    <div class="prj-content">
                        <span class="percentage" id="percentage"></span>
                        <span class="amount"><%=p.getEtc()%></span>
                    </div>
                    <div class="prj-content d-day" id="<%=p.getPrjectNo()%>">
                         <!-- 남은 날짜 계산 -->
	                    <script>
	            			var startDateStr = "<%=p.getStartDate()%>";
					    	var endDateStr = "<%=p.getEndDate()%>";
					    	var date = new Date();
					    	var startDate = new Date(startDateStr);
					    	var endDate = new Date(endDateStr);
					    	var differenceMsec = endDate.getTime() - date.getTime();
					    	var differenceDay = differenceMsec/1000/60/60/24;
					    	$("#<%=p.getPrjectNo()%>").text(Math.floor(differenceDay) + "일 남음");
					    	if(Math.floor(differenceDay)<0){
					    		$("#<%=p.getPrjectNo()%>").text("마감");
					    	}
					    	if(date<startDate){
					    		$("#<%=p.getPrjectNo()%>").text("공개 예정");
					    	}
					    </script>
                    </div>
                    <div class="prj-content gage-bar progress" style="height: 5px;">
                        <div class="progress-bar" id="progress" style=" height: 5px; background-color: #48CA7D!important;"></div>
                    </div>
                </div>
            </div>
           <!-- 달성률 계산 -->
            <script>
                var goal = "<%=p.getGoal()%>";
                var total = "<%=Integer.parseInt(p.getEtc())%>";

                var goalPercentage = (total *100)/goal;
                $("#percentage").text(Math.floor(goalPercentage) + "%");
                $("#progress").css({"width" : Math.floor(goalPercentage)+"%"});
            </script>
            <%} %>
 			<%} %>
            <div class="prj-wrap">
                <div class="prj-content prj-img">
                    <img src="" alt="프로젝트 메인 사진">
                </div>
                <div class="prj-content prj-category">
                    <span>프로젝트 카테고리</span> | <span>프로젝트 메이커</span>
                </div>
                <div class="prj-content prj-title">
                    프로젝트 타이틀
                </div>
                <!-- 프로젝트 달성도 부분 -->
                <div class="prj-content gage-div">
                    <div class="prj-content">
                        <span class="percentage">달성률</span>
                        <span class="amount">모인 금액</span>
                    </div>
                    <div class="prj-content d-day">
                        남은 날짜
                    </div>
                    <div class="prj-content gage-bar progress" style="height: 5px;">
                        <div class="progress-bar" style="width: 50%; height: 5px; background-color: #48CA7D!important;"></div>
                    </div>
                </div>
            </div>

            <div class="prj-wrap">
                <div class="prj-content prj-img">
                    <img src="" alt="프로젝트 메인 사진">
                </div>
                <div class="prj-content prj-category">
                    <span>프로젝트 카테고리</span> | <span>프로젝트 메이커</span>
                </div>
                <div class="prj-content prj-title">
                    프로젝트 타이틀
                </div>
                <!-- <div class="prj-content prj-subscribe">
                    프로젝트 설명
                </div> -->
                <!-- 프로젝트 달성도 부분 -->
                <div class="prj-content gage-div">
                    <div class="prj-content">
                        <span class="percentage">달성률</span>
                        <span class="amount">모인 금액</span>
                    </div>
                    <div class="prj-content d-day">
                        남은 날짜
                    </div>
                    <div class="prj-content gage-bar progress" style="height: 5px;">
                        <div class="progress-bar" style="width: 50%; height: 5px; background-color: #48CA7D!important;"></div>
                    </div>
                </div>
            </div>

            <div class="prj-wrap">
                <div class="prj-content prj-img">
                    <img src="" alt="프로젝트 메인 사진">
                </div>
                <div class="prj-content prj-category">
                    <span>프로젝트 카테고리</span> | <span>프로젝트 메이커</span>
                </div>
                <div class="prj-content prj-title">
                    프로젝트 타이틀
                </div>
                <!-- <div class="prj-content prj-subscribe">
                    프로젝트 설명
                </div> -->
                <!-- 프로젝트 달성도 부분 -->
                <div class="prj-content gage-div">
                    <div class="prj-content">
                        <span class="percentage">달성률</span>
                        <span class="amount">모인 금액</span>
                    </div>
                    <div class="prj-content d-day">
                        남은 날짜
                    </div>
                    <div class="prj-content gage-bar progress" style="height: 5px;">
                        <div class="progress-bar" style="width: 50%; height: 5px; background-color: #48CA7D!important;"></div>
                    </div>
                </div>
            </div>

            <div class="prj-wrap">
                <div class="prj-content prj-img">
                    <img src="" alt="프로젝트 메인 사진">
                </div>
                <div class="prj-content prj-category">
                    <span>프로젝트 카테고리</span> | <span>프로젝트 메이커</span>
                </div>
                <div class="prj-content prj-title">
                    프로젝트 타이틀
                </div>
                <!-- <div class="prj-content prj-subscribe">
                    프로젝트 설명
                </div> -->
                <!-- 프로젝트 달성도 부분 -->
                <div class="prj-content gage-div">
                    <div class="prj-content">
                        <span class="percentage">달성률</span>
                        <span class="amount">모인 금액</span>
                    </div>
                    <div class="prj-content d-day">
                        남은 날짜
                    </div>
                    <div class="prj-content gage-bar progress" style="height: 5px;">
                        <div class="progress-bar" style="width: 50%; height: 5px; background-color: #48CA7D!important;"></div>
                    </div>
                </div>
            </div>
        </div>
        <!--첫번째 추천 스크롤버튼-->
        <div class="btndiv"><button class="rightbtn slidebtn" onclick="moveScrollLeft()"><<<</button><button class="leftbtn slidebtn" onclick="moveScrollRight()">>>></button></div>

        <script>
            moveScrollLeft=function(){
                var scrollLeft = $('#category-content-wrap').scrollLeft();
                $('#category-content-wrap').scrollLeft(scrollLeft - 800);
                

            };
            moveScrollRight=function(){
                var scrollRight = $('#category-content-wrap').scrollLeft();
                $('#category-content-wrap').scrollLeft(scrollRight + 800);
            };

        </script>

        <!-- 2번째 추천 -->

         <!-- 카테고리 내용 래퍼 -->
         <br><br>
         <h2>신규 프로젝트</h2>  <h5>신제품을 빠르게 만나보세요!</h5>
         <div id="category-content-wrap">
             <!-- 프로젝트 하나 당 래퍼 -->
             <div class="prj-wrap">
                 <div class="prj-content prj-img">
                     <img src="" alt="프로젝트 메인 사진">
                 </div>
                 <div class="prj-content prj-category">
                     <span>프로젝트 카테고리</span> | <span>프로젝트 메이커</span>
                 </div>
                 <div class="prj-content prj-title">
                     프로젝트 타이틀
                 </div>
                 <!-- <div class="prj-content prj-subscribe">
                     프로젝트 설명
                 </div> -->
                 <!-- 프로젝트 달성도 부분 -->
                 <div class="prj-content gage-div">
                     <div class="prj-content">
                         <span class="percentage">달성률</span>
                         <span class="amount">모인 금액</span>
                     </div>
                     <div class="prj-content d-day">
                         남은 날짜
                     </div>
                     <div class="prj-content gage-bar progress" style="height: 5px;">
                         <div class="progress-bar" style="width: 50%; height: 5px; background-color: #48CA7D!important;"></div>
                     </div>
                 </div>
             </div>
             
             <div class="prj-wrap">
                 <div class="prj-content prj-img">
                     <img src="" alt="프로젝트 메인 사진">
                 </div>
                 <div class="prj-content prj-category">
                     <span>프로젝트 카테고리</span> | <span>프로젝트 메이커</span>
                 </div>
                 <div class="prj-content prj-title">
                     프로젝트 타이틀
                 </div>
                 <!-- <div class="prj-content prj-subscribe">
                     프로젝트 설명
                 </div> -->
                 <!-- 프로젝트 달성도 부분 -->
                 <div class="prj-content gage-div">
                     <div class="prj-content">
                         <span class="percentage">달성률</span>
                         <span class="amount">모인 금액</span>
                     </div>
                     <div class="prj-content d-day">
                         남은 날짜
                     </div>
                     <div class="prj-content gage-bar progress" style="height: 5px;">
                         <div class="progress-bar" style="width: 50%; height: 5px; background-color: #48CA7D!important;"></div>
                     </div>
                 </div>
             </div>
            
             <div class="prj-wrap">
                 <div class="prj-content prj-img">
                     <img src="" alt="프로젝트 메인 사진">
                 </div>
                 <div class="prj-content prj-category">
                     <span>프로젝트 카테고리</span> | <span>프로젝트 메이커</span>
                 </div>
                 <div class="prj-content prj-title">
                     프로젝트 타이틀
                 </div>
                 <!-- <div class="prj-content prj-subscribe">
                     프로젝트 설명
                 </div> -->
                 <!-- 프로젝트 달성도 부분 -->
                 <div class="prj-content gage-div">
                     <div class="prj-content">
                         <span class="percentage">달성률</span>
                         <span class="amount">모인 금액</span>
                     </div>
                     <div class="prj-content d-day">
                         남은 날짜
                     </div>
                     <div class="prj-content gage-bar progress" style="height: 5px;">
                         <div class="progress-bar" style="width: 50%; height: 5px; background-color: #48CA7D!important;"></div>
                     </div>
                 </div>
             </div>
 
             <div class="prj-wrap">
                 <div class="prj-content prj-img">
                     <img src="" alt="프로젝트 메인 사진">
                 </div>
                 <div class="prj-content prj-category">
                     <span>프로젝트 카테고리</span> | <span>프로젝트 메이커</span>
                 </div>
                 <div class="prj-content prj-title">
                     프로젝트 타이틀
                 </div>
                 <!-- <div class="prj-content prj-subscribe">
                     프로젝트 설명
                 </div> -->
                 <!-- 프로젝트 달성도 부분 -->
                 <div class="prj-content gage-div">
                     <div class="prj-content">
                         <span class="percentage">달성률</span>
                         <span class="amount">모인 금액</span>
                     </div>
                     <div class="prj-content d-day">
                         남은 날짜
                     </div>
                     <div class="prj-content gage-bar progress" style="height: 5px;">
                         <div class="progress-bar" style="width: 50%; height: 5px; background-color: #48CA7D!important;"></div>
                     </div>
                 </div>
             </div>
 
             <div class="prj-wrap">
                 <div class="prj-content prj-img">
                     <img src="" alt="프로젝트 메인 사진">
                 </div>
                 <div class="prj-content prj-category">
                     <span>프로젝트 카테고리</span> | <span>프로젝트 메이커</span>
                 </div>
                 <div class="prj-content prj-title">
                     프로젝트 타이틀
                 </div>
                 <!-- <div class="prj-content prj-subscribe">
                     프로젝트 설명
                 </div> -->
                 <!-- 프로젝트 달성도 부분 -->
                 <div class="prj-content gage-div">
                     <div class="prj-content">
                         <span class="percentage">달성률</span>
                         <span class="amount">모인 금액</span>
                     </div>
                     <div class="prj-content d-day">
                         남은 날짜
                     </div>
                     <div class="prj-content gage-bar progress" style="height: 5px;">
                         <div class="progress-bar" style="width: 50%; height: 5px; background-color: #48CA7D!important;"></div>
                     </div>
                 </div>
             </div>
         </div>

         <!--세번째 추천-->
         <!-- 카테고리 내용 래퍼 -->
         <br><br>
         <h2>마감 임박 프로젝트</h2>  <h5>놓치지 말고 막차탑승!</h5>
         <div id="category-content-wrap">
             <!-- 프로젝트 하나 당 래퍼 -->
             <div class="prj-wrap">
                 <div class="prj-content prj-img">
                     <img src="" alt="프로젝트 메인 사진">
                 </div>
                 <div class="prj-content prj-category">
                     <span>프로젝트 카테고리</span> | <span>프로젝트 메이커</span>
                 </div>
                 <div class="prj-content prj-title">
                     프로젝트 타이틀
                 </div>
              
                 <!-- 프로젝트 달성도 부분 -->
                 <div class="prj-content gage-div">
                     <div class="prj-content">
                         <span class="percentage">달성률</span>
                         <span class="amount">모인 금액</span>
                     </div>
                     <div class="prj-content d-day">
                         남은 날짜
                     </div>
                     <div class="prj-content gage-bar progress" style="height: 5px;">
                         <div class="progress-bar" style="width: 50%; height: 5px; background-color: #48CA7D!important;"></div>
                     </div>
                 </div>
             </div>
             
             <div class="prj-wrap">
                 <div class="prj-content prj-img">
                     <img src="" alt="프로젝트 메인 사진">
                 </div>
                 <div class="prj-content prj-category">
                     <span>프로젝트 카테고리</span> | <span>프로젝트 메이커</span>
                 </div>
                 <div class="prj-content prj-title">
                     프로젝트 타이틀
                 </div>
                 <!-- <div class="prj-content prj-subscribe">
                     프로젝트 설명
                 </div> -->
                 <!-- 프로젝트 달성도 부분 -->
                 <div class="prj-content gage-div">
                     <div class="prj-content">
                         <span class="percentage">달성률</span>
                         <span class="amount">모인 금액</span>
                     </div>
                     <div class="prj-content d-day">
                         남은 날짜
                     </div>
                     <div class="prj-content gage-bar progress" style="height: 5px;">
                         <div class="progress-bar" style="width: 50%; height: 5px; background-color: #48CA7D!important;"></div>
                     </div>
                 </div>
             </div>
            
             <div class="prj-wrap">
                 <div class="prj-content prj-img">
                     <img src="" alt="프로젝트 메인 사진">
                 </div>
                 <div class="prj-content prj-category">
                     <span>프로젝트 카테고리</span> | <span>프로젝트 메이커</span>
                 </div>
                 <div class="prj-content prj-title">
                     프로젝트 타이틀
                 </div>
                 <!-- <div class="prj-content prj-subscribe">
                     프로젝트 설명
                 </div> -->
                 <!-- 프로젝트 달성도 부분 -->
                 <div class="prj-content gage-div">
                     <div class="prj-content">
                         <span class="percentage">달성률</span>
                         <span class="amount">모인 금액</span>
                     </div>
                     <div class="prj-content d-day">
                         남은 날짜
                     </div>
                     <div class="prj-content gage-bar progress" style="height: 5px;">
                         <div class="progress-bar" style="width: 50%; height: 5px; background-color: #48CA7D!important;"></div>
                     </div>
                 </div>
             </div>
 
             <div class="prj-wrap">
                 <div class="prj-content prj-img">
                     <img src="" alt="프로젝트 메인 사진">
                 </div>
                 <div class="prj-content prj-category">
                     <span>프로젝트 카테고리</span> | <span>프로젝트 메이커</span>
                 </div>
                 <div class="prj-content prj-title">
                     프로젝트 타이틀
                 </div>
                 <!-- <div class="prj-content prj-subscribe">
                     프로젝트 설명
                 </div> -->
                 <!-- 프로젝트 달성도 부분 -->
                 <div class="prj-content gage-div">
                     <div class="prj-content">
                         <span class="percentage">달성률</span>
                         <span class="amount">모인 금액</span>
                     </div>
                     <div class="prj-content d-day">
                         남은 날짜
                     </div>
                     <div class="prj-content gage-bar progress" style="height: 5px;">
                         <div class="progress-bar" style="width: 50%; height: 5px; background-color: #48CA7D!important;"></div>
                     </div>
                 </div>
             </div>
 
             <div class="prj-wrap">
                 <div class="prj-content prj-img">
                     <img src="" alt="프로젝트 메인 사진">
                 </div>
                 <div class="prj-content prj-category">
                     <span>프로젝트 카테고리</span> | <span>프로젝트 메이커</span>
                 </div>
                 <div class="prj-content prj-title">
                     프로젝트 타이틀
                 </div>
                 <!-- <div class="prj-content prj-subscribe">
                     프로젝트 설명
                 </div> -->
                 <!-- 프로젝트 달성도 부분 -->
                 <div class="prj-content gage-div">
                     <div class="prj-content">
                         <span class="percentage">달성률</span>
                         <span class="amount">모인 금액</span>
                     </div>
                     <div class="prj-content d-day">
                         남은 날짜
                     </div>
                     <div class="prj-content gage-bar progress" style="height: 5px;">
                         <div class="progress-bar" style="width: 50%; height: 5px; background-color: #48CA7D!important;"></div>
                     </div>
                 </div>
             </div>
         </div>

         <!---->

         <!--공지사항 확인-->
          <!-- 카테고리 내용 래퍼 -->
          <br><br>
          <h2>200% 소식</h2> 
          <div id="category-content-wrap">
            공지사항??이벤트?? 슬라이드효과..?
            </div>
              
            
             
              
  
              
          </div>
          <div>임시div  <br><br><br><br></div>



    </div>

	
<%@ include file="/WEB-INF/views/common/userFooter.jsp" %>
</body>
</html>