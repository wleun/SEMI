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

            <a href="/semiPrj00/member/mypage">????????????</a>
            <a href="/semiPrj00/member/myprj">?????? ????????????</a>
            <a href="/semiPrj00/member/mysponsor">?????? ????????????</a>
            <a href="/semiPrj00/member/myfollow">?????????</a>
            <a href="/semiPrj00/member/mylike">?????????</a>
            <a href="/semiPrj00/member/mycoupon">????????????</a>
            <a href="/semiPrj00/member/qanda">??????&????????????</a>

        </div>
            
        <input type="hidden" name="memberNo" value="<%= loginMember.getNo() %>">

            <section>
            
                <div class="member-info">
                    <div id="content-1">
    
                        <div id="member-name">
                         <span><%= loginMember.getNick() %></span>
                        </div>
                        <div id="mall">
                         <span>????????????</span>
                        </div>
                        <div id="follow">
                         <span>????????? 200???</span>
                         <span>????????? 200???</span>
                        </div>
                        <div>
                         <img src="<%=contextPath %>/resources/img/memberLevelGold.png" alt="????????? ?????????" id="membership-img">
                         <span name="mLevel"><%= loginMember.getmLevel() %></span>
                         <span name="memberType"><%= loginMember.getType() %></span>
                        </div>
             
                    </div>
                </div>

            <div id="content-wrap">

                <div id="prj-info">
                    <img id="prj-img" src="" alt="???????????? ?????????">
                    
                    <div id="content-2">
                        <table>
                            <tr>
                                <td>????????????</td>
                            </tr>
                            <tr>
                                <td>???????????? ???</td>
                            </tr>
                            <tr>
                                <td>?????? | ???????????? | ????????????</td>
                            </tr>
                        </table>
                    </div>

                </div>
                
                <div class="area">?????? ??????</div>
                <div id="content-3">
                    <table>
                        <tr>
                            <td>????????????</td>
                            <td>?????????</td>
                        </tr>
                        <tr>
                            <td>????????????</td>
                            <td>2022-08-05</td>
                        </tr>
                        <tr>
                            <td>???????????????</td>
                            <td>2022-12-25</td>
                        </tr>
                    </table>
                </div>

                <div class="area">?????? ??????</div>
                <div id="content-4">
                    <table>
                        <tr>
                            <td>?????? ??????</td>
                            <td>????????????</td>
                        </tr>
                        <tr>
                            <td>?????? ??????</td>
                            <td>50000???</td>
                        </tr>
                    </table>
                </div>

                <div class="area">?????????</div>
                <div id="content-5">
                    <table>
                        <tr>
                            <td>??????</td>
                            <td>?????????</td>
                        </tr>
                        <tr>
                            <td>??????</td>
                            <td>??????????????????</td>
                        </tr>
                        <tr>
                            <td>????????????</td>
                            <td>010-1234-1234</td>
                        </tr>
                        <tr>
                            <td>????????????</td>
                            <td>?????? ?????????</td>
                        </tr>
                    </table>
                </div>

                <div class="area">?????? ??????</div>
                <div id="content-6">
                    <table>
                        <tr>
                            <td>????????????</td>
                            <td>??????</td>
                        </tr>
                        <tr>
                            <td>????????????</td>
                            <td>50000???</td>
                        </tr>
                        <tr>
                            <td>????????????</td>
                            <td>????????????</td>
                        </tr>
                    </table>
                </div>

            </div>


        </section>
           
    </div>
    
    <%@ include file="/WEB-INF/views/common/userFooter.jsp" %>

</body>
</html>