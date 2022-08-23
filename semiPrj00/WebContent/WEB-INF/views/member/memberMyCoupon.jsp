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
            justify-content: flex-start;
            padding-top: 100px;
        }

        section button {
            color: white;
            border-radius: 100px;
            background-color: #48CA7D;
            border: 0px
        }

        
        /*----------------coupon-------------*/
        #content-wrap{
            display: inline-flex;
            flex-direction: row;
            justify-content: center;
            align-items: center;
            flex-wrap: wrap;
            width: 930px;
            height: auto;
            max-height: auto;
        }
        .coupon-wrap{
            width: 370px;
            height: 130px;
            background-color: white;
            display: flex;
            flex-direction: row;
            text-align: center;
            margin: 30px;
        }
        .coupon-name{
            display: flex;
            flex-direction: column;
            width: 50%;
            font-weight: 600;
        }
        .coupon-name :first-child{
            font-size: 1.3rem;
            margin: 35px;
            text-align: center;
            font-weight: 900;
        }
        .coupon-name :last-child{
            font-size: 0.4rem;
        }
        .sale{
            width: 50%;
            font-size: 2.2rem;
            font-weight: 800;
            display: inline-flex;
            align-items: center;
            justify-content: center;
        }
        .line{
            border-right: 1px solid darkgray;
            height: 80%;
            align-self: center;
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
            
        <input type="hidden" name="memberNo" value="<%= loginMember.getNo() %>">

            <section>
            
                <div class="member-info">
                    <div id="content-1">
    
                        <div id="member-name">
                         <span><%= loginMember.getNick() %></span>
                        </div>
                        <div id="mall">
                         <span>친환경몰</span>
                        </div>
                        <div id="follow">
                         <span>팔로우 200명</span>
                         <span>팔로워 200명</span>
                        </div>
                        <div>
                         <img src="<%=contextPath %>/resources/img/memberLevelGold.png" alt="멤버십 이미지" id="membership-img">
                         <span name="mLevel"><%= loginMember.getmLevel() %></span>
                         <span name="memberType"><%= loginMember.getType() %></span>
                        </div>
             
                    </div>
                </div>

            <div id="content-wrap">

                <div class="coupon-wrap">
                    <div class="coupon-name">
                        <span>생일 쿠폰</span>
                        <span>2022.08.01~2022.08.01 까지 사용가능</span>
                    </div>
                    <div class="line"></div>
                    <div class="sale">
                        <span>50%할인</span>
                    </div>
                </div>   

                <div class="coupon-wrap">
                    <div class="coupon-name">
                        <span>생일 쿠폰</span>
                        <span>2022.08.01~2022.08.01 까지 사용가능</span>
                    </div>
                    <div class="line"></div>
                    <div class="sale">
                        <span>50%할인</span>
                    </div>
                </div>  

                <div class="coupon-wrap">
                    <div class="coupon-name">
                        <span>생일 쿠폰</span>
                        <span>2022.08.01~2022.08.01 까지 사용가능</span>
                    </div>
                    <div class="line"></div>
                    <div class="sale">
                        <span>50%할인</span>
                    </div>
                </div>  

                <div class="coupon-wrap">
                    <div class="coupon-name">
                        <span>생일 쿠폰</span>
                        <span>2022.08.01~2022.08.01 까지 사용가능</span>
                    </div>
                    <div class="line"></div>
                    <div class="sale">
                        <span>50%할인</span>
                    </div>
                </div>  

                <div class="coupon-wrap">
                    <div class="coupon-name">
                        <span>생일 쿠폰</span>
                        <span>2022.08.01~2022.08.01 까지 사용가능</span>
                    </div>
                    <div class="line"></div>
                    <div class="sale">
                        <span>50%할인</span>
                    </div>
                </div>  

                
                
                

            </div>

            


        </section>
           
    </div>
    
    <%@ include file="/WEB-INF/views/common/userFooter.jsp" %>

</body>
</html>