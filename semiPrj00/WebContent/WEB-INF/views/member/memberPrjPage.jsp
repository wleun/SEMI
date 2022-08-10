<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>

        #wrapper{
            padding-top: 200px;
        }

        #header{
            width: 1194px;
            height: 24px;
            left: 35%;
            top: 100px;
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

        #content-2{
            width: 930px;
            height: 400px;
            font-size: 3rem;
            font-weight: 900;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
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

        <div id="header">

            <a href="">정보수정</a>
            <a href="">올린프로젝트</a>
            <a href="">나의후원내역</a>
            <a href="">팔로우</a>
            <a href="">쿠폰내역</a>
            <a href="">문의/답변내역</a>

        </div>
            
        <section>

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

            <div id="content-2">

                <p>작성한 프로젝트가 없습니다.</p>
                <button>프로젝트 올리기</button>

            </div>


        </section>
           
    </div>

</body>
</html>