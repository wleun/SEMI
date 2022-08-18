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

        #content-wrap{
            height: 100%;
        }

        hr{
            border: 1px black;
            width: 600px;
        }

        section button {
            color: white;
            border-radius: 50px;
            background-color: #48CA7D;
            border: 0px
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

        <form action="/semiPrj00/member/mypage" method="post">

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
        
                    <div id="content-2">
        
                        <table>
             
                            <tr>
                                <th>* 이메일</th>
                            </tr>
                            <tr>
                                <td><input type="text" name="memberEmail" value="${loginMember.getEmail}" required readonly></td>
                            </tr>
                            <tr>
                                <th>비밀번호 수정</th>
                            </tr>
                            <tr>
                                <td><input type="password" name="memberPwdNew" placeholder="비밀번호를 입력하세요."></td>
                            </tr>
                            <tr>
                                <td><input type="password" name="memberPwdNew2" placeholder="비밀번호를 확인합니다."></td>
                            </tr>
                            <tr>
                                <th>* 이름</th>
                            </tr>
                            <tr>
                                <td><input type="text" name="memberName" value="" required></td>
                            </tr>
                            <tr>
                                <th>* 닉네임</th>
                            </tr>
                            <tr>
                                <td><input type="text" name="memberNick" value="" required></td>
                            </tr>
                            <tr>
                                <th>* 전화번호</th>
                            </tr>
                            <tr>
                                <td><input type="tel" name="memberPhone"></td>
                            </tr>
             
                        </table>
             
                     </div>
    
                     <hr>
             
                     <div id="content-3">
             
                         <table>
             
                             
                             <tr>
                                 <th>배송지</th>
                                 <td></td>
                                 <td></td>
                             </tr>
                             <tr>
                                 <td>주소1</td>
                                 <td></td>
                                 <td></td>
                             </tr>
                             <tr>
                                 <td>12345</td>
                                 <td></td>
                                 <td></td>
                             </tr>
                             <tr>
                                 <td colspan="2">대한민국 어딘가1</td>
                                 <td><button>삭제</button></td>
                             </tr>
                             <tr>
                                 <td></td>
                                 <td></td>
                                 <td onclick="location.href='/semiPrj00/member/addrRegister'"><button>배송지 등록</button></td>
                             </tr>
                             <tr>
                                 <th>결제정보 등록</th>
                                 <td></td>
                                 <td></td>
                             </tr>
                             <tr>
                                 <td>BC카드 (기본)</td>
                                 <td></td>
                                 <td></td>
                             </tr>
                             <tr>
                                 <td>****-****-****-1234</td>
                                 <td></td>
                                 <td><button>삭제</button></td>
                             </tr>
                             <tr>
                                 <td></td>
                                 <td></td>
                                 <td><button onclick="location.href='/semiPrj00/member/paymentRegister'">카드 등록</button></td>
                             </tr>
             
                         </table>
             
                     </div>
    
                     <hr>
             
                     <div id="content-4">
             
                         <table>
             
                             <tr>
                                 <th>사업자/법인 정보</th>
                             </tr>
                             <tr>
                                 <td><input type="text" name="memberRegistration"></td>
                             </tr>
                             
                         </table>
             
                     </div>
    
                     <hr>
             
                     <div id="content-5">
             
                         <table>
             
                             <tr>
                                 <th colspan="2">등록한 추천인</th>
                             </tr>
                             <tr>
                                 <td>테스트2님</td>
                                 <td>ABCde6</td>
                             </tr>
                             <tr>
                                 <th colspan="2">나의 추천코드</th>
                             </tr>
                             <tr>
                                 <td>ABCde1</td>
                                 <td>친구가 회원가입을 하면 추천인으로 등록할 수 있어요!</td>
                             </tr>
             
                         </table>
             
                     </div>
    
                     <hr>
             
                     <div id="content-6">
             
                         <table>
             
                             <tr>
                                 <td><button>수정하기</button></td>
                             </tr>
                             <tr>
                                 <td><button>회원탈퇴</button></td>
                             </tr>
             
                         </table>
             
                     </div>
        
                </div>
            </section>

        </form>
        

    </div>
    
    <%@ include file="/WEB-INF/views/common/userFooter.jsp" %>

</body>

</html>