<%@page import="com.kh.common.vo.PageVo"%>
<%@page import="com.kh.project.vo.ProjectVo"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	List<ProjectVo> prjList = (List<ProjectVo>)request.getAttribute("prjList");
	PageVo pageVo = (PageVo)request.getAttribute("pageVo");
	String sort = (String)request.getAttribute("sort");
	String searching = (String)request.getAttribute("searching");
	
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
    #search-voca{
        height: 100%;
        margin: auto;
        font-size: 20px;
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
    	height: 75px
    }
    .prj-subscribe{
    	color : gray;
    	height: 25px;
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
        margin-top: 50px;
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
        <div id="search-voca">
            <%=searching%> 의 검색결과
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
	                    <%if(vo.getText().length() > 50){ %>
	                    	<%=vo.getText().substring(0, 50)%> ...
	                    <%}else{ %>
	                    	<%=vo.getText()%>
	                    <%} %>
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
	                        <div class="progress-bar" style="width: <%=percentArr[idx]%>%; height: 5px; background-color: #48CA7D!important;"></div>
	                    </div>
	                </div>
	            </div>
	            
                <%idx++;%>
	            <%}%>
        	<%} %>
            
        </div>
        <div id="page-area">
            <%if(currentPage!=1){ %>
            	<%if(sort != null){ %>
				<a class="btn btn-sm btn-success" href="<%=contextPath%>/project/search?searching=<%=searching%>&sort=<%=sort%>&p=<%=currentPage-1%>"> &lt; </a></a>				
				<%}else{%>
				<a class="btn btn-sm btn-success" href="<%=contextPath%>/project/search?searching=<%=searching%>&p=<%=currentPage-1%>"> &lt; </a>	
				<%}%>
				
			<%} %>
			
			<% for(int i=startPage; i<=endPage;i++){ %>
				<%if(i==currentPage){%>
					<a class="btn btn-sm btn-success"><%=i%></a>
				<%}else{%>
					<%if(sort != null){ %>
					<a class="btn btn-sm" href="<%=contextPath%>/project/search?searching=<%=searching%>&sort=<%=sort%>&p=<%=i%>"><%=i%></a>				
					<%}else{%>
					<a class="btn btn-sm" href="<%=contextPath%>/project/search?searching=<%=searching%>&p=<%=i%>"><%=i%></a>	
					<%}%>
				<%}%>
			<% } %>
			
			<% if(currentPage!=maxPage){ %>
				<%if(sort != null){ %>
				<a class="btn btn-sm btn-success" href="<%=contextPath%>/project/search?searching=<%=searching%>&sort=<%=sort%>&p=<%=currentPage+1%>"> &gt; </a>				
				<%}else{%>
				<a class="btn btn-sm btn-success" href="<%=contextPath%>/project/search?searching=<%=searching%>&p=<%=currentPage+1%>"> &gt; </a>	
				<%}%>
			<% }%>
        </div>
    </div>
    
    <%@ include file="/WEB-INF/views/common/userFooter.jsp" %>s

</body>
</html>