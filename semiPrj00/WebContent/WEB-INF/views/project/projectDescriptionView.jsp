<%@page import="com.kh.project.vo.ProjectVo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<%
	ProjectVo pvo = (ProjectVo)request.getAttribute("projectVo");
%>

<!DOCTYPE html>
<html lang="ko">
<head>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>플젝명</title>
    
<style>
/* 공통 css */
	#header-div{
        width: 1920px;
        height: 120px;
    }
    a{text-decoration: none; color: black;}
    
    #outer{
        width: 1344px;
        height: auto;
        margin: 0 auto;
        display: flex;
        flex-wrap: wrap;
    }
   
    /* 버튼부분 */
    #btn-div1,#btn-div2{
        display: flex;
        justify-content: space-evenly;
    }
    #btn-div1>*{
    width: 100%;
    padding: 10px;
    background-color: white;
    border: 1px #48CA7D solid;
    border-radius: 50px;
    margin: 10px;
    }
    #btn-div1>a:first-child{
        width: 50px;
    }
    #btn-div2>button{
        border: none;
        height: 30px;
        border-radius: 50px;
    }
    #btn-div1>a:last-child{
        text-align: center;
    }
    #btn-div1>a:last-child, #btn-div2>button:nth-child(2){
        background-color: #48CA7D;
        color: white;
    }
    #support-btn{
        text-decoration: none;
    }
    #support-btn:hover{
        color: burlywood;
    }
    
    #reward-btn-area{
        height: 690px;
        overflow: scroll;
        overflow-x: auto;
    }
    #reward-btn{
        background-color: white;
        display: flex;
        flex-wrap: wrap;
        padding: 20px;
        margin: 10px 10px 10px 0px;
        border: 1px solid rgba(214, 196, 196, 0.651);
        border-radius: 10px 10px 10px 10px;
    }
    #reward-btn>div>div:last-child{
        margin: 10px 0px 10px 0px;
    }
    #reward-btn:hover{
        border: 1px solid #48CA7D;
        cursor: pointer;
    }
    #reward-btn:focus{
        border: 2px solid #48CA7D;
    }
    #option-select-area{
        width: 100%;
        display: none;
        padding: 20px 10px 10px 10px;
        border-top: 1px solid #48CA7D;
    }
    #option-select-area input[type='number']{
        width: 20%;
        border: 1px solid #48CA7D;
        border-radius: 10px;
        padding-left: 10px;
        margin-left: 20px;
    }
    #option-select-area input[type='submit']{
        border: none;
        background-color: #48CA7D;
        color: white;
        border-radius: 50px;    
        margin-top: 20px;
        width: 100%;
        height: 2em;
        
    }
    /* 버튼효과 */
    #btn-div1>a, #btn-div2>button{
        cursor: pointer;
    }
    
    
    

/* 헤드와 메인으로 2분할 */
    #desc-head{
        width: 100%;
        height: 1000px;
        display: flex;
        flex-wrap: wrap;
        justify-content: center;
    }
    #desc-main{
        display: flex;
        flex-wrap: wrap;
        flex-direction: row;
        justify-content: flex-start;
        width: 100%;
        height: auto;
    }
    /* 헤드-타이틀 영역 */
    #head-title{
        width: 100%;
        height: 200px;
        display: flex;
        flex-direction: column;
        flex-wrap: wrap;
        justify-content: center;
        align-items: center;
    }
    #project-category{
        width: 150px;
        height: 40px;
        border-radius: 50px;
        margin: 10px;
        background-color: #48CA7D;
        text-align:center;
    }
    #project-category>a{
        display: inline-block;
        padding: 8px 20px 8px 20px;
        width: 100%;
        height: 100%;
        text-decoration: none;
        color: white;
    }
    #project-title{
        display: flex;
        justify-content: center;
        width: 100%;
        height: 50px;
    }
    #project-title>a{
        text-align: center;
        font-size: 40px;
        width: 100%;
        height: 100%;
    }

    /* 헤드-이미지 영역 */
    #head-img{
        width: 60%;
        height: 650px;
        display: flex;
        justify-content: center;
    }
    #img-section{
        width: 600px;
        height: 600px;
    }
    /* 헤드-정보 영역 */
    #head-info{
        width: 40%;
    }
    #info1{
        height: 400px;
        display: flex;
    }
    .prj-info{
        font-size: 50px;
        margin-right: 10px;
    }
    #prj-percent{
        display: inline-block;
        font-size: 20px;
        padding: 20px 20px 0px 20px;
    }
    #info2{
        height: 200px;
        display: flex;
    }
    .info2-title{
        padding-right: 20px;
    }
   
    
/* 메인영역 */
    

    /* 메인-내비게이션바 */
    #main-nav{
        position: sticky;
        top: 120px;
        width: 100%;
        height: 50px;
        line-height: 40px;
        background-color: #F9F5EA;
        border-top: 1px lightgray solid;
        border-bottom: 1px lightgray solid;
        z-index: 9;
    }
   
    .nav-text{
        margin-right: 40px;
        font-size: 18px;
        text-decoration: none;
        color: black;
    }
    .nav-text:hover{
        color: #48CA7D;
    }
    /* 메인-상세페이지 전체*/
    #main-prj{
        width: 70%;
    }
    .main-title{
       padding: 70px 100px 70px 0px;
       /* border-bottom: 1px solid gray; */
    }
    .main-title>div:first-child{
        background-color: white;
        padding: 10px 50px 10px 50px;
        margin: 100px 0px 50px 0px;
        display: inline-block;
        border-radius: 10px;
    }
    
    /* 공지사항 영역 */
    #notice-comment-wrap,#review-comment-wrap{
        margin-top: 40px;
        display: flex;
        flex-wrap: wrap;
        justify-content: end;
    }
    #notice-comment-wrap input{
        margin: 20px 0px 20px 20px;
        height: 50px;
        width: 150px;
        border: 0px;
        border-radius: 50px;
        background-color: #48CA7D;
        color: white;
    }
    #notice-comment-area{
        height: 200px;
    }

    /* 리뷰영역 */
    #review-comment-wrap>input{
        margin-top: 30px;
        margin-bottom: 30px;
    }
    .filebox{
        width: 320px;
        height: 110px;
        display: flex;
        flex-wrap: wrap;
        align-items: center;
    }
    .filebox .upload-name{
        display: inline-block;
        height: 50px;
        padding: 0 10px;
        vertical-align: middle;
        border: 1px solid #dddddd;
        /* width: 100%; */
        color: #999999;
    }
    .filebox label {
        display: inline-block;
        padding: 14px 20px;
        color: #fff;
        vertical-align: middle;
        background-color: #48CA7D;
        cursor: pointer;
        border-radius: 10px;
        height: 50px;
        margin-left: 10px;
    }
    .filebox input[type="file"] {
        position: absolute;
        width: 0;
        height: 0;
        padding: 0;
        overflow: hidden;
        border: 0;
    }

    #review-comment-wrap>input:last-child{
        width: 100px;
        height: 50px;
        border: none;
        border-radius: 50px;
        color: white;
        background-color: #48CA7D;
        margin-left: 30px;
    }

    /* 커뮤니티 영역 */
    #community-comment-wrap{
        position: relative;
        width: 100%;
        height: 100px;
        margin: 30px 0px 30px 0px;
    }
    .nav-link.nav-link:hover{
        color: gray;
    }
    #nav-link-active{
        background-color: #F9F5EA;
    }
    .navigation-item a{
        margin: 10px;
        font-size: 16px;
    }
    .comment{
        width: 100%;
        height: 80px;
        resize: none;
        padding: 10px 100px 10px 20px;
        background-color: rgb(230, 230, 230);
        border: none;
        box-decoration-break: unset;
    }
    #community-comment-wrap button{
        position: absolute;
        right: 30px;
        top: 24px;
        width: 30px;
        background-color: rgb(230, 230, 230);
        border: none;
    }
    .post-area-no-post{
        border-top: 1px solid lightgray;
        border-bottom: 1px solid lightgray;
        padding: 200px 200px 200px 200px;
        /* margin: 200px 200px 200px 200px; */
    }
    .post-area{
        padding: 10px;
        margin-top: 30px;
        margin-bottom: 30px;
        border-bottom: 1px solid lightgray;
        border-radius: 10px;
        background-color: white;
    }
    .post-writer-area{
        margin: 30px 0px 30px 0px;
    }
    #post-writer,#notice-writer,#review-writer{
        margin-right: 50px;
        font-weight: 600;
    }
    #post-date,#notice-date,#review-date{
        color: gray;
        font-weight: 100;
        font-size: 15px;
    }
    #post-content,#notice-content,#review-content{
        font-weight: 100;
        font-size: 15px;
    }
    .post-content-area{
        margin: 50px 0px 50px 0px;
        
    }

    

    /* 메인-창작자정보 및 리워드 영역 */
    #main-side{
        width: 30%;
        height: auto;
    }
    #creator-info{
        background-color: white;
        border-radius: 10px;
        padding: 30px;
        margin: 30px 30px 30px 0px;
        height: 300px;
        display: flex;
        flex-wrap: wrap;
        flex-direction: column;
        justify-content: space-between;
    }
    #creator-title{
        padding-bottom: 10px;
        font-weight: 600;
        border-bottom: 1px solid gray;
    }
    #creator-name{
        font-weight: 600;
        font-size: 16px;
        height: 30px;
    }
    #creator-desc{
        font-weight: 100;
        font-size: 14px;
        height: 100px;
    }
	#option-list-empty{
		text-align:center;
		height:690px;
		line-height:690px;
	}
	
    #reward-option{
        position: sticky;
        top: 190px;
        width: 100%;
    }
    #reward-option-title{
        height: 50px;
        font-weight: 900;
        line-height: 40px;
    }
    .option-attribute{
        color: gray;
        font-size: 14px;
    }
    #option-price{
        color: black;
        font-size: 25px;
    }
    
    /* 신고하기 부분 */
    #report-area{
        padding: 50px;
        margin: 50px 50px 50px 0px;
        border-top: 1px solid gray;
        border-bottom: 1px solid gray;
    }
    #report-area>a{
        color: black;
    }
    #report-area>a:hover{
        color: #48CA7D;
    }

    /* 상단이동 버튼 */
    #go-top-btn{
        position: fixed;
        top: 90%;
        left: 90%;
        width: 50px;
        height: 50px;
        padding: 10px;
        border: 1px solid #48CA7D;
        border-radius: 30px;
    }

    
</style>
</head>
<body>
    
    <div id="header-div">
        <%@ include file="/WEB-INF/views/common/userHeader.jsp" %>
    </div>
    
    <div id="outer">

        <div class="desc-section" id="desc-head">
            <div id="head-title">
                <div id="project-category">
                    <a href="/project/category">${projectVo.categoryNo}</a>
                </div>
                <div id="project-title">
                    <a>${projectVo.name}</a>
                </div>
            </div>
            <div id="head-img">
                <div id="img-section">
                    <img style="width:600px; height:600px" src="<%=contextPath%>/resources/img/main.PNG" alt="이미지왜안나옴?">
                </div>
            </div>
            <div id="head-info">
                <div id="info1">
                    <table>
                        <tr>
                            <td>모인금액</td>
                        </tr>
                        <tr>
                            <td><span class="prj-info">140,000,000</span>원</td>
                            <td><span id="prj-percent">200%</span></td>
                        </tr>
                        <tr>
                            <td>남은시간</td>
                        </tr>
                        <tr>
                            <td><span class="prj-info">1</span>일</td>
                        </tr>
                        <tr>
                            <td>후원자</td>
                        </tr>
                        <tr>
                            <td><span class="prj-info">40</span>명</td>
                        </tr>
                    </table>
                </div>
                <div id="info2">
                    <table>
                        <tr>
                            <td><b class="info2-title">목표금액</b></td>
                            <td><span class="info2">${projectVo.goal}</span>원</td>
                        </tr>
                        <tr>
                            <td><b class="info2-title">펀딩기간</b></td>
                            <td><span class="info2">${projectVo.startDate}</span>-<span class="info2">${projectVo.endDate}</span></td>
                        </tr>
                        <tr>
                            <td><b class="info2-title">배송</b></td>
                            <td>목표금액 달성 시 <span class="info2">${projectVo.shippingDate}</span> 배송 진행</td>
                        </tr>
                    </table>
                </div>
                <div class="btns" id="btn-div1">
                    <a id="like-btn">
                        <img id="heart-btn" width="20px" src="<%=contextPath%>/resources/img/project_like.png" alt="??">
                    </a>
                    <a id="support-btn" href="#reward-option">이 프로젝트 후원하기</a>
                </div>
            </div>`
        </div>
        <div class="desc-section" id="desc-main">
            <div id="main-nav">
                <table id="nav-table">
                    <tr>
                        <td><a id="a-introduce" class="nav-text" href="#introduce">프로젝트소개</a></td>
                        <td><a id="a-notice" class="nav-text" href="#notice">공지사항</a></td>
                        <td><a id="a-community" class="nav-text" href="#community">커뮤니티</a></td>
                        <td><a id="a-etc" class="nav-text" href="#project-etc">예상되는어려움</a></td>
                    </tr>
                </table>
            </div>
            <div id="main-prj">
                <div class="main-title" id="introduce">
                    <div><span>프로젝트소개</span></div>
                    <div>
                        <img style="width:100%; height:auto" src="<%=contextPath%>/resources/img/desc1.JPG" alt="?">
                        <img style="width:100%; height:auto" src="<%=contextPath%>/resources/img/desc2.JPG" alt="??">
                        <img style="width:100%; height:auto" src="<%=contextPath%>/resources/img/desc3.JPG" alt="???">
                    </div>
                </div>
                
                <div class="main-title" id="notice">
                    <div><span>새소식</span></div>
                    <div>
                        <form action="${pageContext.request.contextPath}/project/notice">
                            <div id="notice-comment-wrap">
                                <textarea name="notice-comment-area" class="comment" id="notice-comment-area" maxlength="500" placeholder="500자 이내로 입력해주세요."></textarea>
                                <input type="submit" value="작성하기">
                            </div>
                        </form>
                        <div id="">
                        	
                        	<c:if test="${empty noticeList}">
                            	<div class="post-area-no-post"><h5>작성된 새소식이 없습니다. 글을 작성해주세요.</h5></div>
                            </c:if>
                            
                            <c:if test="${not empty noticeList}">
                            	<c:forEach items="${noticeList}" var="nlist">
		                            <div class="post-area">
		                                <div class="post-writer-area"><span id="notice-writer">${nlist.memberNo}</span><span id="notice-date">${nlist.newsDate}</span></div>
		                                <div class="post-content-area">
		                                    <span id="notice-content">
		                                        ${nlist.content}
		                                    </span>
		                                </div>
		                                <div class="post-reply-area" id="notice-reply-area"><span id="notice-reply">답글</span></div>
		                                <c:if test="${nlist.memberNo} eq ${pvo.makerNo}">
			                                <a href="">수정</a>
			                                <a href="">삭제</a>
			                            </c:if>
		                            </div>
		                         </c:forEach>
                            </c:if>
                            
                        </div>
                    </div>
                </div>
                
                <div class="main-title" id="community">
                    <div><span>커뮤니티</span></div>

                    <!-- 부트스트랩 -->
                    <div class="container mt-3">
                        <!-- Nav tabs -->
                        <ul class="nav nav-tabs" role="tablist">
                          <li class="navigation-item">
                            <a class="nav-link active" id="nav-link-active" data-bs-toggle="tab" href="#home">게시판</a>
                          </li>
                          <li class="navigation-item">
                            <a class="nav-link" data-bs-toggle="tab" href="#menu1">리뷰</a>
                          </li>
                        </ul>
                      
                        <!-- Tab panes -->
                        <div class="tab-content">
                          <div id="home" class="container tab-pane active"><br>
                            <form action="">
                                <div id="community-comment-wrap">
                                    <form action="">
                                        <textarea name="community-comment-area" class="comment" maxlength="500" placeholder="500자 이내로 입력해주세요."></textarea>
                                        <button><img src="<%=contextPath%>/resources/img/send-button-371579.png" width="30px" alt="??"></button>
                                    </form>
                                </div>
                            </form>
                            <div id="">
                                <div class="post-area-no-post"><h5>작성된 게시글이 없습니다. 글을 작성해주세요.</h5></div>
                                <div class="post-area">
                                    <div class="post-writer-area"><span id="post-writer">작성자명</span><span id="post-date">2022/08/10</span></div>
                                    <div class="post-content-area">
                                        <span id="post-content">
                                            넵튠과 우라노스 향을 골랐는데,
                                        푸른 하늘 속 흐르는 구름과
                                        상냥한 바다의 조화.
                                        이름만 들어도 벌써 시원한 느낌이 들어요
                                        한번 믿고 기대해봅니다!</span></div>
                                    <div class="post-reply-area"><span id="post-reply">답글</span></div>
                                </div>
                                <div class="post-area">
                                    <div class="post-writer-area"><span id="post-writer">작성자명</span><span id="post-date">2022/08/10</span></div>
                                    <div class="post-content-area">
                                        <span id="post-content">
                                            넵튠과 우라노스 향을 골랐는데,
                                        푸른 하늘 속 흐르는 구름과
                                        상냥한 바다의 조화.
                                        이름만 들어도 벌써 시원한 느낌이 들어요
                                        한번 믿고 기대해봅니다!</span></div>
                                    <div class="post-reply-area"><span id="post-reply">답글</span></div>
                                </div>
                            </div>
                          </div>
                          <div id="menu1" class="container tab-pane fade"><br>
                            <form action="">
                                <div id="review-comment-wrap">
                                    <textarea name="review-comment-area" class="comment" maxlength="500" placeholder="500자 이내로 입력해주세요."></textarea>
                                    <div class="filebox">
                                        <input class="upload-name" value="첨부파일" placeholder="첨부파일">
                                        <label for="file">파일첨부</label> 
                                        <input type="file" id="file">
                                    </div>
                                    <input type="submit" value="작성하기">
                                </div>
                            </form>
                            <div id="">
                                <div class="post-area-no-post"><h5>작성된 리뷰가 없습니다. 리뷰를 작성해주세요.</h5></div>
                                <div class="post-area">
                                   
                                    <div class="post-writer-area"><span id="review-writer">회원명</span><span id="review-date">2022/08/11</span></div>
                                    <div class="post-content-area">
                                        <span id="review-content">
                                            좋아요~~
                                        </span>
                                    </div>
                                    <div class="post-reply-area" id="review-reply-area"><span id="review-reply">답글</span></div>
                                    <!-- 해당 작성자가 로그인 했을 때 -->
                                    <a href="">수정</a>
                                    <a href="">삭제</a>
                                </div>
                            </div>

                          </div>
                        </div>
                    </div>
                    <!-- 부트스트랩 -->
                    
                </div>
                
                <div class="main-title" id="project-etc">
                    <div><span>예상되는어려움</span></div>
                    <div>
                        <img style="width: 100%; height:auto" src="<%=contextPath%>/resources/img/etc.JPG" alt="">
                    </div>
                </div>
             	<div id="report-area">
                    <a href="">이 프로젝트 신고하기</a>
                </div>
                
                
            </div>
            <div id="main-side">
                <div id="creator-info">
                    <div id="creator-title">크리에이터 소개</div>
                    <div id="creator-name">${projectVo.makerNo}</div>
                    <div id="creator-desc">${projectVo.makerInfo}</div>
                    <div class="btns" id="btn-div2">
                        <button>+ 팔로우</button>
                        <button onclick="location.href='/semiPrj00/member/qdetail'">1:1 문의하기</button>
                    </div>
                </div>

                <div id="reward-option">
                    <div id="reward-option-title"><span>리워드 선택하기</span></div>
                    <div class="btns" id="reward-btn-area">

						<c:if test="${empty optionList}">
							<div id="option-list-empty">옵션이 존재하지 않습니다.</div>
						</c:if>
						<c:if test="${not empty optionList}">
							<c:forEach items="${optionList}" var="list">
	
		                        <div class="rwd-btn" id="reward-btn">
		                            <div id="reward-btn-on-display">
		                                <div><span class="option-attribute" id="option-name">${list.option }</span></div>
		                                <div><span class="option-attribute option-prc" id="option-price">${list.price}</span><span class="option-attribute" id="option-price"> 원</span></div>
		                                <div>
		                                    <span class="option-attribute" id="option-detail">
		                                        ${list.detail}
		                                    </span>
		                                </div>
		                                <div><span class="option-attribute">선택가능수량: </span><span class="option-attribute" id="option-quantity">${list.quantity}</span></div>
		                            </div>
		
		                            <div class="hide-div" id="option-select-area">
		                                <form action="<%=contextPath%>/project/support?pnum=${projectVo.prjectNo}&rnum=${list.no}&qty=&add=">
		                                    수량선택 <input type="number" class="reward-qty" id="reward-quantity" value="1" min='1'>
		                                    <input type="submit">
		                                </form>
		                            </div>
		                        </div>
		                        
						 	</c:forEach>
						</c:if>

                       

                                        

                        
                    </div>


                </div>
            </div>
        </div>
    </div>

    <div id="go-top-btn">
        <a href="#header-div">
            <img src="<%=contextPath%>/resources/img/go-top.png" alt="">
        </a>
    </div>
    


<script>
    $(function(){
    	
    	
        
        $("#file").on('change',function(){
            var fileName = $("#file").val();
            $(".upload-name").val(fileName);
        });
        
        

        $('#like-btn').click(function(){
        	
            <c:if test="${ empty loginMember}">
    			const confirmLogin = confirm('로그인이 필요한 서비스입니다. 로그인 하시겠습니까?');
    			if(confirmLogin){
	    			location.href='<%=contextPath%>/member/login';
    			}
   			</c:if>
    		
			<c:if test="${ not empty loginMember}">
				
                //버튼 토글 기능
                var src = ($('#btn-div1 img').attr('src') === '<%=contextPath%>/resources/img/project_like.png')
                    ? '<%=contextPath%>/resources/img/project_liked.png'
                    : '<%=contextPath%>/resources/img/project_like.png';
                $('#btn-div1 img').attr('src', src); 

                //누를 때마다 이미지 src 변경하며 flag값 전달 
                if($('#like-btn>img').attr('src') === '<%=contextPath%>/resources/img/project_liked.png'){   //하트 채워진 이미지
                    console.log("좋아요"); //확인용
                    $.ajax({
                        url : "<%=contextPath%>/project/like",
                        method : "get",
                        data : {
                            flag : 1, 
                            memberNo : <%=loginMember.getNo()%>,
                            projectNo : <%=pvo.getPrjectNo()%>
                            },
                        success : function(likeResult){
                            if(likeResult == 1){
                                console.log("좋아요 됨");
                            }
                        },
                        error : function(){

                        }
                    });
                }
                else if($('#like-btn>img').attr('src') === '<%=contextPath%>/resources/img/project_like.png'){   //빈 하트 (기존)이미지
                    console.log("좋아요취소");  //확인용
                    $.ajax({
                        url : "<%=contextPath%>/project/like",
                        method : "get",
                        data : {
                            flag : 2,
                            memberNo : <%=loginMember.getNo()%>,
                            projectNo : <%=pvo.getPrjectNo()%>
                            },
                        success : function(likeCancel){
                            if(likeCancel == 1){
                                alert("좋아요 취소됨");
                            }
                        },
                        error : function(){

                        }
                    });
                }
            </c:if>
          });
        
		$
        
        $('.rwd-btn').click(function(){
            const div = $('.hide-div');
            $(div).hide(); 
            
            $(this).children().last().show(); 
            
            $(this).find($('.hide-div input')).first().attr("max", $(this).find($('.option-attribute')).last().text() );

            const totalPrice = $(this).find($('.option-prc')).text() * $(this).find($('.reward-qty')).val();
            $(this).find($('.hide-div input')).last().val(totalPrice+"원 후원하기");
        });

    
    });
    </script>

    

</body>
</html>