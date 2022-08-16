<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
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
    
    #reward-btn{
        height: 700px;
        display: flex;
        flex-wrap: wrap;
        justify-content: center;
        overflow: scroll;
        overflow-x: auto;
    }
    #reward-btn>button{
        width: 100%;
        padding: 10px;
        margin: 10px 10px 10px 0px;
        text-align: start;
        background-color: white;
        border: 1px solid rgba(214, 196, 196, 0.651);
        border-radius: 10px 10px 10px 10px;
    }
    #reward-btn>button>div{ 
        margin: 10px;
    }
    #option-select-area{
        width: 100%;
    }

    /* 버튼효과 */
    #btn-div1>a, #btn-div2>button,#reward-btn>button:hover{
        cursor: pointer;
    }
    #reward-btn>button:hover{
        border: 1px solid #48CA7D;
    }
    #option-select-area>input[type='number']{
        width: 20%;
        border: 1px solid #48CA7D;
        border-radius: 10px;
        padding-left: 10px;
        margin-left: 20px;
    }
    #option-select-area>input[type='submit']{
        border: none;
        background-color: #48CA7D;
        color: white;
        border-radius: 50px;    
        margin-top: 20px;
        width: 100%;
        height: 2em;
        
    }
    
    #option-select-area{
        display: none;
        padding: 20px 10px 10px 10px;
        border-top: 1px solid #48CA7D;
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
        width: 70px;
        height: 40px;
        border-radius: 50px;
        margin: 10px;
        background-color: #48CA7D;
    }
    #project-category>a{
        display: inline-block;
        padding: 8px 8px 8px 20px;
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
        margin-bottom: 50px;
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
                    <a href="/project/category">푸드</a>
                </div>
                <div id="project-title">
                    <a>찐크림치즈에 옥수수를 더하다 글루텐프리, 옥수수치크케이크 찐크림치즈에 옥수수를 더하다 글루텐프리, 옥수수치크케이크</a>
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
                            <td><span class="info2">100,000</span>원</td>
                        </tr>
                        <tr>
                            <td><b class="info2-title">펀딩기간</b></td>
                            <td><span class="info2">220303</span>-<span class="info2">220303</span></td>
                        </tr>
                        <tr>
                            <td><b class="info2-title">결제</b></td>
                            <td>플젝 성공 시 <span class="info2">220303</span> 결제 진행</td>
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
                    <div><span>공지사항</span></div>
                    <div>
                        <form action="">
                            <div id="notice-comment-wrap">
                                <textarea name="notice-comment-area" class="comment" id="notice-comment-area" maxlength="500" placeholder="500자 이내로 입력해주세요."></textarea>
                                <input type="submit" value="작성하기">
                            </div>
                        </form>
                        <div id="">
                            <div class="post-area-no-post"><h5>작성된 공지사항이 없습니다. 글을 작성해주세요.</h5></div>
                            <div class="post-area">
                               
                                <div class="post-writer-area"><span id="notice-writer">크리에이터명</span><span id="notice-date">2022/08/11</span></div>
                                <div class="post-content-area">
                                    <span id="notice-content">
                                        EVENT <br>
                                        10위권 랭킹 기념 및 후원자님들의 멋진 의견과
                                        기대평을 듣고 더욱 성장할 수 있는 시간을 갖고자
                                        소소한 EVENT를 준비하였어요.

                                    </span>
                                </div>
                                <div class="post-reply-area" id="notice-reply-area"><span id="notice-reply">답글</span></div>
                                <!-- 해당 크리에이터가 로그인 했을 때 -->
                                <a href="">수정</a>
                                <a href="">삭제</a>
                              
                            </div>
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
                    <div id="creator-name">이코믹스</div>
                    <div id="creator-desc">이코믹스는 만화 출판사입니다.
                        글로벌 시장을 대상으로 다양한 만화를 제작, 출판, 유통하고 있습니다.</div>
                    <div class="btns" id="btn-div2">
                        <button>+ 팔로우</button>
                        <button>1:1 문의하기</button>
                    </div>
                </div>

                <div id="reward-option">
                    <div id="reward-option-title"><span>리워드 선택하기</span></div>
                    <div class="btns" id="reward-btn">
                        <button>
                            <div><span class="option-attribute" id="option-name">옵션1</span></div>
                            <div><span class="option-attribute" id="option-price">25,000</span><span class="option-attribute" id="option-price"> 원</span></div>
                            <div><span class="option-attribute" id="option-detail">옵션설명</span></div>
                            <div><span class="option-attribute" id="option-quantity">선택가능수량: </span><span class="option-attribute" id="option-quantity">2</span></div>
                            <form action="<%=contextPath%>/project/support">
                                <div id="option-select-area">
                                    수량선택 <input type="number" id="reward-quantity">
                                    <input type="submit" value="후원하기">
                                </div>
                            </form>
                        </button>
                        <button>
                            <div><span class="option-attribute" id="option-name">옵션2</span></div>
                            <div><span class="option-attribute" id="option-price">25,000</span><span class="option-attribute" id="option-price"> 원</span></div>
                            <div><span class="option-attribute" id="option-detail">옵션설명</span></div>
                            <div><span class="option-attribute" id="option-quantity">선택가능수량: </span><span class="option-attribute" id="option-quantity">2</span></div>
                            <form action="">
                                <div id="option-select-area">
                                    sss
                                    <input type="submit">
                                </div>
                            </form>
                        </button>
                        <button>
                            <div><span class="option-attribute" id="option-name">옵션1</span></div>
                            <div><span class="option-attribute" id="option-price">25,000</span><span class="option-attribute" id="option-price"> 원</span></div>
                            <div><span class="option-attribute" id="option-detail">옵션설명</span></div>
                            <div><span class="option-attribute" id="option-quantity">선택가능수량: </span><span class="option-attribute" id="option-quantity">2</span></div>
                        </button>
                        <button>
                            <div><span class="option-attribute" id="option-name">옵션1</span></div>
                            <div><span class="option-attribute" id="option-price">25,000</span><span class="option-attribute" id="option-price"> 원</span></div>
                            <div><span class="option-attribute" id="option-detail">옵션설명</span></div>
                            <div><span class="option-attribute" id="option-quantity">선택가능수량: </span><span class="option-attribute" id="option-quantity">2</span></div>
                        </button>
                        
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
        $("#file").on('change',function(){
            var fileName = $("#file").val();
            $(".upload-name").val(fileName);
        });
    </script>

    <script>
        $(function(){
            
            $('#btn-div1>#like-btn').on({
                'click': function() {
                    var src = ($('#btn-div1 img').attr('src') === '<%=contextPath%>/resources/img/project_like.png')
                        ? '<%=contextPath%>/resources/img/project_liked.png'
                        : '<%=contextPath%>/resources/img/project_like.png';
                    $('#btn-div1 img').attr('src', src);    

                    if($(this).children().attr('src') === '<%=contextPath%>/resources/img/project_like.png'){
                        location.href='<%=contextPath%>/project/like?flag=1'
                        console.log('좋아요');
                    }else if($(this).children().attr('src') === '<%=contextPath%>/resources/img/project_liked.png'){
                        location.href='<%=contextPath%>/project/like?flag=2'
                       	console.log('좋아요취소');
                    }

                }
            });

        });
    </script>

    <script>
        $(function(){
            $('#reward-btn button').click(function(){
                console.log(this);
                const div = $(this).find('#option-select-area');
                
                if(div.css('display') == 'none')  {
                    $(div).show();    
                // }else {
                //     $(div).hide();
                }
                // $('#reward-btn button').off('click');
            });
        });
    </script>

</body>
</html>