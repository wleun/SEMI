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
			color:black;
            font-size: 1.3rem;
        }

        #header a:visited{
            color: #48CA7D;
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

        input[type=password] {font-family:'Malgun gothic', dotum, sans-serif; width: 250px;}

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
	/*회원탈퇴*/
	 .back {
	 	box-sizing:border-box;
        display: none;
        position: absolute;
        content: "";
        width: 100%;
        height: 1600px;
        background-color: rgba(0,0,0,0.5);
        top: 0;
        left: 0;
        z-index: 1;
    }
	.modal_wrap{
		box-sizing:border-box;
        display: none;
        width: 500px;
        height: 300px;
        position: absolute;
        top: 90%;
        margin:0 auto;
        left:35%;
        border-radius: 10px;
        background: #F9F5EA;
        z-index: 2;
    }
     .modal_close {
        width: 26px;
        height: 26px;
        position: absolute;
        bottom: 30px;
        right: 50px;
        border-radius: 50px;
        color: white;
    }
    #submit{
    color:white;border:none;  border-radius: 50px; background-color:#48CA7D;}
    #modal_btn{
    	background-color: lightgray;
    }
    #modal-btn-div{
    	margin-left:460px;
    }
    .btn-style{
    color:white;border:none;  border-radius: 50px; background-color:#48CA7D;
    }
    </style>
</head>
<body>

        <%@ include file="/WEB-INF/views/common/userHeader.jsp" %>
	
    <div id="wrapper">

        <div id="header">

            <a href="/semiPrj00/member/mypage">정보수정</a>
            <a href="/semiPrj00/member/myprj">나의 프로젝트</a>
            <a href="/semiPrj00/member/mysponsor?p=1">나의 후원내역</a>
            <a href="/semiPrj00/member/myfollow">팔로우</a>
            <a href="/semiPrj00/member/mylike">좋아요</a>
            <a href="/semiPrj00/member/mycoupon">쿠폰내역</a>
            <a href="/semiPrj00/member/qanda">문의&답변내역</a>

        </div>

        <form action="/semiPrj00/member/mypage" method="post">

			<input type="hidden" name="memberNo" value="<%= loginMember.getNo() %>">

            <section>
            
                <div class="member-info">
                    <div id="content-1">
    
                        <div id="member-name">
                         <span><%= loginMember.getNick() %></span>
                        </div>
                        
                        <div>
                         <img src="<%=contextPath %>/resources/img/memberLevelGold.png" alt="멤버십 이미지" id="membership-img">
                         <span name="mLevel"><%= loginMember.getmLevel() %></span>
                         <span name="memberType"><%= loginMember.getType() %></span>
                        </div>
             
                    </div>
                </div>
        
                <div id="content-wrap">
        
                    <div id="content-2">
        
                        <table>
             
                            <tr>
                                <th>* 이메일</th>
                            </tr>
                            <tr>
                                <td><input type="text" name="memberEmail" value="<%= loginMember.getEmail() %>" required readonly></td>
                            </tr>
                            <tr>
                                <th>비밀번호 수정</th>
                            </tr>
                            <tr>
                                <td><input class="inputPwd" type="password" name="memberPwd" placeholder="기존 비밀번호를 입력하세요."></td>
                            </tr>
                            <tr>
                                <td><input class="inputPwd" type="password" name="memberPwdNew" placeholder="비밀번호를 입력하세요."></td>
                            </tr>
                            <tr>
                                <td><input class="inputPwd" type="password" name="memberPwdNew2" placeholder="비밀번호를 확인합니다."></td>
                            </tr>
                            <tr>
                                <th>* 이름</th>
                            </tr>
                            <tr>
                                <td><input type="text" name="memberName" value="<%= loginMember.getName() %>" required></td>
                            </tr>
                            <tr>
                                <th>* 닉네임</th>
                            </tr>
                            <tr>
                                <td><input type="text" name="memberNick" value="<%= loginMember.getNick() %>" required></td>
                            </tr>
                            <tr>
                                <th>* 전화번호</th>
                            </tr>
                            <tr>
                                <td><input type="tel" name="memberPhone" value="<%= loginMember.getPhone() %>"></td>
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
                                 <td>
                                 <input class="btn-style" type="button" value="배송지등록" onclick="location.href='<%=contextPath %>/member/addrRegister'">
                                 </td>
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
                                 <td>
                                 <input class="btn-style" type="button" onclick="location.href='<%=contextPath %>/member/paymentRegister'" value="카드등록">
                                 </td>
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
                                 <td>
                                 <input type="text" name="memberRegistration" 
                                 <% if(loginMember.getRegistration()==null){%>
                                 value=""
                                 <% ;}else{%>
                                 value="<%= loginMember.getRegistration() %>">
                                 <%}%>
                                 </td>
                             </tr>
                             
                         </table>
             
                     </div>
    
                     <hr>
             
                     <!--<div id="content-5">
             
                         <table>
             
                             <tr>
                                 <th colspan="2">나의 추천코드</th>
                             </tr>
                             <tr>
                                 <td>ABCde1</td>
                                 <td>친구가 회원가입을 하면 추천인으로 등록할 수 있어요!</td>
                             </tr>
             
                         </table>
             
                     </div>  
                     <hr>-->
    
             
                     <div id="content-6">
             
                         <table>
             
                             <tr>
                                 <td><button type="submit">수정하기</button></td>
                                 <td><div id="modal-btn-div"><button type="button" id="modal_btn">회원탈퇴</button></div></td>
                             </tr>
                             <tr>
                             </tr>
             
                         </table>
             
                     </div>
        
                </div>
            </section>

        </form>
        <div class="back"></div>
         <div class="modal_wrap" style="text-align: center; vertical-align: center;">
                    <div>
                        <br> <h3 style="text-align: center;color:red;">회원탈퇴를 진행하시겠습니까?</h1>
                         <form action="<%=contextPath %>/member/quit" method="post">
                         <span style="display:block; margin-right:120px; margin-top:50px; font-size: 20px;"></span>
                         <input type="password" name="pwd" required="required" placeholder="*비밀번호를 입력하세요">
                         <input type="submit" value="탈퇴하기" id="submit">
                         <br><br><span>회원탈퇴 후 같은 이메일로 재가입이 불가합니다.</span>
                         </form>
                        
                    </div>
                    <div class="modal_close"><button style="color:white;border:none;  border-radius: 50px; background-color:#48CA7D; ">close</button></div>
                </div>
        
<script>
window.onload=function(){
    function onClick(){
        document.querySelector('.modal_wrap').style.display='block';
        document.querySelector('.back').style.display='block';
    }
    function offClick(){
        document.querySelector('.modal_wrap').style.display='none';
        document.querySelector('.back').style.display='none';
    }

    document.getElementById('modal_btn').addEventListener('click',onClick);
    document.querySelector('.modal_close').addEventListener('click',offClick);
}
</script>

    </div>
    
    <%@ include file="/WEB-INF/views/common/userFooter.jsp" %>

</body>

</html>