<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>플젝명</title>
    /* 부트스트랩 */
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<style>
/* 공통 css */
    @font-face{font-family: 'twayair'; src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_tway@1.0/twayair.woff') format('woff');}
    a{text-decoration: none; color: black;}
    body, body button, body input{font-family: twayair;}
    div{box-sizing: border-box;}
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
        justify-content: center;
    }
    #btn-div1>*, #btn-div2>button{
    width: 100%;
    padding: 10px;
    background-color: white;
    border: 1px #48CA7D solid;
    border-radius: 10px;
    margin: 10px;
    }
    #btn-div1>button{
        width: 50px;
    }
    #btn-div1>input, #btn-div2>button:nth-child(2){
        background-color: #48CA7D;
        color: white;
    }
    
    #reward-btn{
        display: flex;
        flex-wrap: wrap;
        justify-content: center;
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
    /* 버튼효과 */
    #btn-div1>button,#btn-div1>input, #btn-div2>button,#reward-btn>button:hover{
        cursor: pointer;
    }
    #btn-div1>input:{
        background-color: #2fa15d;
    }
    #reward-btn>button:focus{
        background-color: #48CA7D;
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
        flex-wrap: wrap;
        justify-content: center;
        align-self: center;
    }
    #category{
        width: 100%;
        display: flex;
        justify-content: center;
        align-self: flex-end;
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
    #main-nav{
        position: sticky;
        top: 0px;
        width: 100%;
    }
    /* 메인-내비게이션바 */
    #main-nav{
        height: 50px;
        line-height: 40px;
        background-color: white;
        border-top: 1px lightgray solid;
        border-bottom: 1px lightgray solid;
    }
    .nav-text{
        margin-right: 20px;
    }
    /* 메인-상세페이지 */
    #main-prj{
        width: 70%;
    }
    .main-title{
       padding: 70px 100px 70px 0px;
    }
    /* 메인-창작자정보 및 리워드 영역 */
    #main-side{
        width: 30%;
        height: auto;
    }
    #creator-info{
        border: 1px solid rgba(214, 196, 196, 0.651);
        border-radius: 10px 10px 10px 10px;
        padding: 30px;
        margin: 30px 0px 30px 0px;
        height: 300px;
        display: flex;
        flex-wrap: wrap;
        flex-direction: column;
        justify-content: space-between;
    }
    #reward-option{
        position: sticky;
        top: 50px;
        width: 100%;
    }
    #reward-option-title{
        height: 50px;
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
    
    /* 커뮤니티 영역 */
    #comment{
        width: 100%;
    }
    #community-comment-wrap{
        display: flex;
        justify-content: end;
    }
    
    
    
</style>
</head>
<body>
    
    
    
    <div id="outer">

        <div class="desc-section" id="desc-head">
            <div id="head-title">
                <div id="category"><h4>푸드</h4></div>
                <div id="project-title"><h1>찐크림치즈에 옥수수를 더하다 글루텐프리, 옥수수치크케이크</h1></div>
            </div>
            <div id="head-img">
                <div id="img-section">
                    <img style="width:600px; height:600px" src="<%=request.getContextPath() %>/resources/main.JPG" alt="이미지왜안나옴?">
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
                    <button>
                        <img id="heart-btn" width="20px" src="<%=request.getContextPath() %>/resources/project_like.png" alt="??">
                    </button>
                    <input type="submit" value="이 프로젝트 후원하기">
                </div>
            </div>
        </div>
        <div class="desc-section" id="desc-main">
            <div id="main-nav">
                <table id="nav-table">
                    <tr>
                        <td><a class="nav-text" href="#introduce">프로젝트소개</a></td>
                        <td><a class="nav-text" href="#notice">공지사항</a></td>
                        <td><a class="nav-text" href="#community">커뮤니티</a></td>
                        <td><a class="nav-text" href="#etc">예상되는어려움</a></td>
                    </tr>
                </table>
            </div>
            <div id="main-prj">
                <div class="main-title" id="introduce">
                    <span>::프로젝트소개::</span>
                    <div>
                        <img style="width:100%; height:auto" src="<%=request.getContextPath() %>/resources/desc1.JPG" alt="?">
                        <img style="width:100%; height:auto" src="<%=request.getContextPath() %>/resources/desc2.JPG" alt="??">
                        <img style="width:100%; height:auto" src="<%=request.getContextPath() %>/resources/desc3.JPG" alt="???">
                    </div>
                </div>
                <div class="main-title" id="notice">
                    <span>::공지사항::</span>
                </div>
                <div class="main-title" id="community">
                    <span>::커뮤니티::</span>
                    <!-- 부트스트랩 -->
                    <div class="container mt-3">
                        <!-- Nav tabs -->
                        <ul class="nav nav-tabs" role="tablist">
                          <li class="nav-item">
                            <a class="nav-link active" data-bs-toggle="tab" href="#home">커뮤니티</a>
                          </li>
                          <li class="nav-item">
                            <a class="nav-link" data-bs-toggle="tab" href="#menu1">리뷰</a>
                          </li>
                        </ul>
                      
                        <!-- Tab panes -->
                        <div class="tab-content">
                          <div id="home" class="container tab-pane active"><br>
                            <form action="">
                                <div id="community-comment-wrap">
                                    <textarea name="community-comment" id="comment" cols="30" rows="10" ></textarea>
                                    <input type="submit" value="글작성하기">
                                </div>
                            </form>
                            <div id="">
                                <div id="">작성된 게시글이 없습니다. 글을 작성해주세요.</div>
                                <div id="">

                                </div>
                            </div>
                          </div>
                          <div id="menu1" class="container tab-pane fade"><br>
                            <form action="">
                                <textarea name="comment-community" id="comment" cols="30" rows="10"></textarea>
                                <input type="submit" value="리뷰작성하기">
                            </form>
                          </div>
                          
                        </div>
                      </div>
                
                <div class="main-title" id="etc">
                    <span>::예상되는어려움::</span>
                    <div>
                        <img style="width: 100%; height:auto" src="<%=request.getContextPath() %>/resources/etc.JPG" alt="">
                    </div>
                </div>
                <div>
                    <button></button>
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
                        <button>창작자에게 문의하기</button>
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


</body>
</html>