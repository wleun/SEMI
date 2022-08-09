<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
  <style>
  
        #wrapper{
            padding-top: 120px;
        }

        #mypage-header{
            width: 1194px;
            height: 24px;
            left: 35%;
            margin-top: 200px;
            padding: 20px;

            margin: 0 auto;
            text-align: center;
        }

        a{
            text-decoration: none;
            color: black;
            padding: 10px;
        }

        #content-1{
            width: 300px;
        }

        #content-wrap{
            width: 30%;

            
        }

        #content-6 button{
            width: 300px;
            height: 50px;
        }

        button {
            color: white;
            margin-top: 10px;
            border-radius: 100px;
            background-color: #48CA7D;
            border: 0px
        }
        
        section{
            display: flex;
            flex-direction: row;
            justify-content: center;
        }

        input{
            width: 200px;
            height: 20px;
            font-size: 12px;
        }

         /* ------------------content-1---------------------------- */
         #content-1 *{
            display: flex;
            flex-direction: column;
        }
        #content-1{
            display: flex;
            flex-direction: column;
            justify-content: space-around;
            align-items: center;
            font-size: 1.2rem;
            height: 550px;
        }
        #follow{
            text-align: center;
        }
        #member-name{
            font-size: 1.7rem;
            font-weight: 700;
        }
        #mall{
            font-size: 1.4rem;
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

        <div id="mypage-header">

            <a href="">정보수정</a>
            <a href="">올린프로젝트</a>
            <a href="">나의후원내역</a>
            <a href="">팔로우</a>
            <a href="">쿠폰내역</a>
            <a href="">문의/답변내역</a>

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
                     <img src="" alt="멤버십 이미지" id="membership-img">
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
                             <td colspan="2">이메일</td>
                         </tr>
                         <tr>
                             <td colspan="2">KH12234@kh.com</td>
                         </tr>
                         <tr>
                             <td colspan="2">비밀번호 수정</td>
                         </tr>
                         <tr>
                             <td colspan="2"><input type="password" placeholder="비밀번호를 입력하세요."></td>
                         </tr>
                         <tr>
                             <td colspan="2"><input type="password" placeholder="비밀번호를 확인합니다."></td>
                         </tr>
                         <tr>
                             <td colspan="2">이름</td>
                         </tr>
                         <tr>
                             <td colspan="2">김누구</td>
                         </tr>
                         <tr>
                             <td colspan="2">닉네임</td>
                         </tr>
                         <tr>
                             <td colspan="2">테스트</td>
                         </tr>
                         <tr>
                             <td><input type="text" placeholder="변경하시려면, 닉네임을 입력하세요"></td>
                             <td><button>중복확인</button></td>
                         </tr>
                         <tr>
                             <td colspan="2">전화번호</td>
                         </tr>
                         <tr>
                             <td colspan="2">010-1234-1234</td>
                         </tr>
                         <tr>
                             <td colspan="2"><input type="tel" placeholder="변경하시려면, 전화번호를 입력하세요.('-'제외)"></td>
                         </tr>
         
                    </table>
         
                 </div>

                 <hr style="border:1px color= black;" width="100%">
         
                 <div id="content-3">
         
                     <table>
         
                         
                         <tr>
                             <td>배송지</td>
                             <td></td>
                             <td></td>
                             <td></td>
                         </tr>
                         <tr>
                             <td>주소1</td>
                             <td></td>
                             <td></td>
                             <td></td>
                         </tr>
                         <tr>
                             <td>12345</td>
                             <td></td>
                             <td></td>
                             <td></td>
                         </tr>
                         <tr>
                             <td colspan="3">대한민국 어딘가1</td>
                             <td><button>삭제</button></td>
                         </tr>
                         <tr>
                             <td>주소2</td>
                             <td></td>
                             <td></td>
                             <td></td>
                         </tr>
                         <tr>
                             <td>12345</td>
                             <td></td>
                             <td></td>
                             <td></td>
                         </tr>
                         <tr>
                             <td colspan="3">대한민국 어딘가2</td>
                             <td><button>삭제</button></td>
                         </tr>
                         <tr>
                             <td colspan="3"><input type="text" placeholder="배송지 입력버튼을 눌러주세요."></td>
                             <td><button>주소추가</button></td>
                         </tr>
                         <tr>
                             <td colspan="4">결제정보 등록</td>
                         </tr>
                         <tr>
                             <td colspan="4">BC카드 (기본)</td>
                         </tr>
                         <tr>
                             <td>****-****-****-1234</td>
                             <td><button>삭제</button></td>
                         </tr>
                         <tr>
                             <td colspan="4">BC카드</td>
                         </tr>
                         <tr>
                             <td>****-****-****-5678</td>
                             <td><button>삭제</button></td>
                         </tr>
                         <tr>
                             <td colspan="4">카드번호 0000-0000-0000-0000</td>
                         </tr>
                         <tr>
                             <td><input type="text" placeholder="MM"></td>
                             <td><input type="text" placeholder="YYYY"></td>
                             <td colspan="2"><input type="text" placeholder="카드비밀번호 앞 2자리"></td>
                         </tr>
                         <tr>
                             <td colspan="2"><input type="text" placeholder="생년월일 6자리"></td>
                             <td colspan="2"><input type="text" placeholder="결제비밀번호 6자리"></td>
                         </tr>
                         <tr>
                             <td></td>
                             <td></td>
                             <td></td>
                             <td><button>카드 등록</button></td>
                         </tr>
         
                     </table>
         
                 </div>

                 <hr style="border:1px color= black;" width="100%">
         
                 <div id="content-4">
         
                     <table>
         
                         <tr>
                             <td>사업자/법인 정보</td>
                         </tr>
                         <tr>
                             <td>012-34-56789</td>
                         </tr>
                         <tr>
                             <td><input type="text" placeholder="변경하시려면, 사업자번호 / 법인번호를 입력하세요."></td>
                         </tr>
                         <tr>
                             <td>친환경몰</td>
                         </tr>
                         <tr>
                             <td><input type="text" placeholder="변경하시려면, 상호/법인명을 입력해주세요."></td>
                         </tr>
         
                     </table>
         
                 </div>

                 <hr style="border:1px color= black;" width="100%">
         
                 <div id="content-5">
         
                     <table>
         
                         <tr>
                             <td colspan="2">등록한 추천인</td>
                         </tr>
                         <tr>
                             <td>테스트2님</td>
                             <td>ABCde6</td>
                         </tr>
                         <tr>
                             <td colspan="2">나의 추천코드</td>
                         </tr>
                         <tr>
                             <td>ABCde1</td>
                             <td>친구가 회원가입을 하면 추천인으로 등록할 수 있어요!</td>
                         </tr>
         
                     </table>
         
                 </div>

                 <hr style="border:1px color= black;" width="100%">
         
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
        

    </div>

</body>

</html>