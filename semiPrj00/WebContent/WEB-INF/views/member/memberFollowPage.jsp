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

        hr{
            border: 1px black;
            width: 600px;
        }

        button {
            color: white;
            margin-top: 10px;
            border-radius: 100px;
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
            <a href="">팔로우</a>
            <a href="">좋아요</a>
            <a href="">관심카테고리</a>
            <a href="">쿠폰내역</a>
            <a href="">문의&답변내역</a>

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
    
                
    
            </div>
        </section>
        

    </div>

</body>

</html>