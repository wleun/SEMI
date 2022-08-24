<%@page import="java.util.List"%>
<%@page import="com.kh.category.vo.CategoryVo"%>
<%@page import="com.kh.project.vo.ProjectVo"%>
<%@page import="com.kh.common.vo.PageVo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%

	List<ProjectVo> prjList = (List<ProjectVo>)request.getAttribute("prjList");
	CategoryVo categoryVo = (CategoryVo)request.getAttribute("categoryVo");
	PageVo pageVo = (PageVo)request.getAttribute("pageVo");
	String sort = (String)request.getAttribute("sort");
	
	int[] totalDonateArr = (int[])request.getAttribute("totalDonateArr");
	long[] percentArr = (long[])request.getAttribute("percentArr");
	
	int currentPage = pageVo.getCurrentPage();
	int startPage = pageVo.getStartPage();
	int endPage = pageVo.getEndPage();
	int maxPage = pageVo.getMaxPage();
	
%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>200%</title>
<style>

    #header-div{
        width: 1920px;
        height: 120px;
    }

    #category-body{
        width: 1920px;
        height: 100%;
        padding-top: 120px;
        padding-left: 192px;
        padding-right: 192px;
    }
    #category-name{
        height: 100%;
        margin: auto;
        font-size: 30px;
        font-weight: 900;
    }
    #category-sort{
        float: right;
    }
    #sort-btn{
        font-size: 20px;
        font-weight: 900;
    }
    #sort-btn:hover{
        color: #48CA7D;
    }
    #quantity-div{
        clear: both;
        font-size: 18px;
    }
    #quantity{
        font-size: 18px;
    }
    #category-content-wrap{
        height: 100%;
        width: 100%;
        display: flex;
        flex-wrap: wrap;
        justify-content: flex-start;
    }
    .prj-wrap{
        height: 400px;
        width: 300px;
        margin: 42px;
    }
    .prj-wrap:hover{
        cursor: pointer;
    }
    .prj-img{
    	background-color: gray;
        height: 200px;
        width: 300px;
    }
    .prj-content{
        margin: 5px 0px;
    }
    .prj-category{
    	color : #48CA7D;
    }
    .prj-title{
    	font-size : 18px;
    }
    .prj-subscribe{
    	color : gray;
    }
    .gage-div{
        height: 10%;
        width: 100%;
        display: flex;
        flex-wrap: wrap;
        justify-content: space-between;
        margin-top: 60px;
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
    .btn{
        border-radius: 50px !important;
    }
    #page-area{
        text-align: center;
        padding: 30px;
    }
    #page-area a{
        width: 35px;
        font-size: 18px;
    }
</style>
</head>
<body>
    

    <div id="header-div">
        <%@ include file="/WEB-INF/views/common/userHeader.jsp" %>
    </div>


    <div id="category-body">
        <div id="category-name">
            <%=categoryVo.getCategoryName()%>
        </div>
        <div id="category-sort" class="dropdown">
            <button type="button" id="sort-btn" class="btn btn-light dropdown-toggle" data-bs-toggle="dropdown">
                상태
            </button>
                <ul class="dropdown-menu">
                    <li><a class="dropdown-item" href="<%=contextPath%>/project/category?category=<%=categoryVo.getCategoryNo()%>&sort=all">전체 프로젝트</a></li>
                    <li><a class="dropdown-item" href="<%=contextPath%>/project/category?category=<%=categoryVo.getCategoryNo()%>&sort=ongoing">진행중인 프로젝트</a></li>
                    <li><a class="dropdown-item" href="<%=contextPath%>/project/category?category=<%=categoryVo.getCategoryNo()%>&sort=complete">성사된 프로젝트</a></li>
                    <li><a class="dropdown-item" href="<%=contextPath%>/project/category?category=<%=categoryVo.getCategoryNo()%>&sort=intended">공개예정 프로젝트</a></li>
                </ul>
        </div>
        <div id="quantity-div">
            <span id="quantity"><%=pageVo.getListCount()%></span>개의 프로젝트가 있습니다
        </div>
        <div id="category-content-wrap">
        	<%if(prjList!=null){ %>
        		<%int idx = 0;%>
        		<%for(ProjectVo vo : prjList){%>
	            <div class="prj-wrap" onclick="location.href='<%=contextPath%>/project/view?num=<%=vo.getPrjectNo()%>'">
	                <div class="prj-content prj-img">
	                    <img src="<%=contextPath%>/resources/upload/<%=vo.getThumbnailName()%>" alt="<%=vo.getThumbnailName()%>">
	                </div>
	                <div class="prj-content prj-category">
	                    <span><%=vo.getCategoryNo()%></span> | <span><%=vo.getMakerNo()%></span>
	                </div>
	                <div class="prj-content prj-title">
	                    <%=vo.getName()%>
	                </div>
	                <div class="prj-content prj-subscribe">
	                    <%=vo.getText()%>
	                </div>
	                <div class="prj-content gage-div">
	                    <div class="prj-content">
	                        <span class="percentage"><%=percentArr[idx]%>%</span>
	                        <span class="amount">모인 금액 <%=totalDonateArr[idx]%>원</span>
	                    </div>
	                    <div class="prj-content d-day" id="<%=vo.getPrjectNo()%>">
	                    <!-- 남은 날짜 계산 -->
	                    <script>
	                    	var startDateStr = "<%=vo.getStartDate()%>";
					    	var endDateStr = "<%=vo.getEndDate()%>";
					    	var date = new Date();
					    	var startDate = new Date(startDateStr);
					    	var endDate = new Date(endDateStr);
					    	var differenceMsec = endDate.getTime() - date.getTime();
					    	var differenceDay = differenceMsec/1000/60/60/24;
					    	$("#<%=vo.getPrjectNo()%>").text(Math.floor(differenceDay) + "일 남음");
					    	if(Math.floor(differenceDay)<0){
					    		$("#<%=vo.getPrjectNo()%>").text("마감");
					    	}
					    	if(date<startDate){
					    		$("#<%=vo.getPrjectNo()%>").text("공개 예정");
					    	}
					    </script>
	                    </div>
	                    <div class="prj-content gage-bar progress" style="height: 5px;">
	                        <div class="progress-bar" style="width: 50%; height: 5px; background-color: #48CA7D!important;"></div>
	                    </div>
	                </div>
	            </div>
	            
                <%idx++;%>
	            <%}%>
        	<%} %>
            
        </div>
        <div id="page-area">
            <%if(currentPage!=1){ %>
				<a class="btn btn-sm btn-success" href="<%=contextPath%>/project/category?category=<%=categoryVo.getCategoryNo()%>&sort=<%=sort%>&p=<%=currentPage-1%>"> &lt; </a>
			<%} %>
			
			<% for(int i=startPage; i<=endPage;i++){ %>
				<%if(i==currentPage){%>
					<a class="btn btn-sm btn-success"><%=i%></a>
				<%}else{%>
					<a class="btn btn-sm" href="<%=contextPath%>/project/category?category=<%=categoryVo.getCategoryNo()%>&sort=<%=sort%>&p=<%=i%>"><%=i%></a>				
				<%}%>
			<% } %>
			
			<% if(currentPage!=maxPage){ %>
				<a class="btn btn-sm btn-success" href="<%=contextPath%>/project/category?category=<%=categoryVo.getCategoryNo()%>&sort=<%=sort%>&p=<%=currentPage+1%>"> &gt; </a>
			<% }%>
        </div>
    </div>

</body>
</html>