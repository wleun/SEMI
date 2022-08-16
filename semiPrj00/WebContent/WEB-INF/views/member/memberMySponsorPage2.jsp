<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>

        #wrapper{
            padding-top: 150px;
            padding-bottom: 150px;
        }

        #header{
            width: 1194px;
            height: 24px;
            left: 35%;
            margin-top: 200px;
            padding: 20px;

            margin: 0 auto;
            text-align: center;
        }

        #header a{
            padding: 15px;
            text-decoration: none;

            font-size: 1.3rem;
        }

        #header a:visited{
            color: black;
        }

        #header a:hover{
            color: #48CA7D;
        }

        section{
            display: flex;
            flex-direction: row;
            justify-content: flex-start;
            padding-top: 100px;
        }

        section button {
            color: white;
            border-radius: 50px;
            background-color: #48CA7D;
            border: 0px
        }

        #prj-info{
            display: flex;
        }

        #prj-img{
            width: 200px;
        }

        .area{
            margin-top: 50px;
        }

        #content-3 table{
            width: 90%;
            height: 90%;
        }

        #content-3{
            width: 800px;
            height: 250px;
            border: 5px solid #48CA7D;
            border-radius: 10px;
            text-align: center;
        }

        #content-4 table{
            width: 90%;
            height: 90%;
        }

        #content-4{
            width: 800px;
            height: 200px;
            border: 5px solid #48CA7D;
            border-radius: 10px;
            text-align: center;
        }

        #content-5 table{
            width: 90%;
            height: 90%;
        }

        #content-5{
            width: 800px;
            height: 300px;
            border: 5px solid #48CA7D;
            border-radius: 10px;
            text-align: center;
        }

        #content-6 table{
            width: 90%;
            height: 90%;
        }

        #content-6{
            width: 800px;
            height: 250px;
            border: 5px solid #48CA7D;
            border-radius: 10px;
            text-align: center;
        }

       /* ------------------content-1---------------------------- */

       .member-info{
            padding-left: 300px;
            padding-right: 100px;
        }

         #content-1 *{
            display: flex;
            flex-direction: column;
        }
        #content-1{
            display: flex;
            flex-direction: column;
            justify-content: space-evenly;
            align-items: center;
            font-size: 1rem;
            width: 300px;
            height: 500px;
        }

        #follow{
            text-align: center;
        }
        #member-name{
            font-size: 1.5rem;
            font-weight: 700;
        }
        #mall{
            font-size: 1.3rem;
            font-weight: 700;
        }
        #membership-img{
            width: 130px;
        }

    </style>
</head>
<body>

    <%@ include file="/WEB-INF/views/common/userHeader.jsp" %>

   <div id="wrapper">

        <div id="header">

            <a href="/semiPrj00/member/mypage">정보수정</a>
            <a href="/semiPrj00/member/myprj">나의 프로젝트</a>
            <a href="/semiPrj00/member/mysponsor">나의 후원내역</a>
            <a href="/semiPrj00/member/myfollow">팔로우</a>
            <a href="/semiPrj00/member/mylike">좋아요</a>
            <a href="/semiPrj00/member/mycoupon">쿠폰내역</a>
            <a href="/semiPrj00/member/qanda">문의&답변내역</a>

        </div>
            
        <section>

            <div class="member-info">
                <div id="content-1">

                    <div id="member-name">
                     <span>테스트 님</span>
                    </div>
                    <div id="mall">
                     <span>친환경몰</span>
                    </div>
                    <div id="follow">
                     <span>팔로우 200명</span>
                     <span>팔로워 200명</span>
                     <span>추천인 등록 수 200명</span>
                    </div>
                    <div>
                     <img src="<%=contextPath %>/resources/img/memberLevelGold.png" alt="멤버십 이미지" id="membership-img">
                     <span>회원등급 GOLD</span>
                     <span>개인사업자 회원</span>
                    </div>
                    <button>로그아웃</button>
         
                </div>
            </div>

            <div id="content-wrap">

                <div id="prj-info">
                    <img id="prj-img" src="" alt="프로젝트 이미지">
                    
                    <div id="content-2">
                        <table>
                            <tr>
                                <td>카테고리</td>
                            </tr>
                            <tr>
                                <td>프로젝트 명</td>
                            </tr>
                            <tr>
                                <td>달성 | 모인금액 | 남은날짜</td>
                            </tr>
                        </table>
                    </div>

                </div>
                
                <div class="area">후원 정보</div>
                <div id="content-3">
                    <table>
                        <tr>
                            <td>펀딩상태</td>
                            <td>진행중</td>
                        </tr>
                        <tr>
                            <td>후원날짜</td>
                            <td>2022-08-05</td>
                        </tr>
                        <tr>
                            <td>펀딩마감일</td>
                            <td>2022-12-25</td>
                        </tr>
                    </table>
                </div>

                <div class="area">선물 정보</div>
                <div id="content-4">
                    <table>
                        <tr>
                            <td>선물 구성</td>
                            <td>선물선물</td>
                        </tr>
                        <tr>
                            <td>후원 금액</td>
                            <td>50000원</td>
                        </tr>
                    </table>
                </div>

                <div class="area">배송지</div>
                <div id="content-5">
                    <table>
                        <tr>
                            <td>이름</td>
                            <td>테스트</td>
                        </tr>
                        <tr>
                            <td>주소</td>
                            <td>방구참아왕국</td>
                        </tr>
                        <tr>
                            <td>전화번호</td>
                            <td>010-1234-1234</td>
                        </tr>
                        <tr>
                            <td>배송상태</td>
                            <td>배송 준비중</td>
                        </tr>
                    </table>
                </div>

                <div class="area">결제 정보</div>
                <div id="content-6">
                    <table>
                        <tr>
                            <td>결제수단</td>
                            <td>카드</td>
                        </tr>
                        <tr>
                            <td>결제금액</td>
                            <td>50000원</td>
                        </tr>
                        <tr>
                            <td>결제상태</td>
                            <td>결제완료</td>
                        </tr>
                    </table>
                </div>

            </div>


        </section>
           
    </div>

</body>
</html>