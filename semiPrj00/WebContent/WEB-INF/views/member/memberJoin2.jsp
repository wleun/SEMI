<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
    <style>
       
        #box{height: 150px;width: 1920px;}
        #join{
            border: 2px solid blue;
            width: 700px;
            height: 800px;
            margin: 0 auto;
        }
        #join-h1{
            text-align: center;
        }
        #content{
        border: 1px solid black;
        width: 500px;
        height: 200px;
        overflow: scroll;
        margin: 0 auto;
        }
        #check{
        position: relative;
        text-align: center;
        bottom: -10px;
        }
        #form{
            /* border: 1px solid red; */
            width: 500px; height: 550px;
            margin: 0 auto;
            font-size: 20px;
            background-color: rgba(255, 255, 255, 0.675);
            margin-top: 20px;
        }
        .join-li{
        list-style-type: none;
        line-height: 28px;
        margin-bottom: 20px;
    
       }
       #form-ul{
        padding: 0px;
        padding-left: 120px;
       }
       input{
        width: 250px;
        background-color: white;
       }
       #pre{
        width: 60px;
        float: left;
        border: 1px solid gray ;
        border-radius: 8px;
        background-color: #48CA7D;
       }
       #next{
        width: 60px;
        float: right;
        border: 1px solid gray ;
        border-radius: 8px;
        background-color: #48CA7D;
       }
       ::placeholder{
        font-size: 15px;
       } 
      #check-btn{
        width: 250px;
        border: 1px solid lightgray;
      }
      .img-join{
        width: 70px;
        height: 70px;
  
        margin-left: 75px;
        margin-bottom: -50px;
        /* left: 80px;
        bottom: -27px; */
      }
    </style>
</head>
<body>
<%@ include file="/WEB-INF/views/common/userHeader.jsp" %>
		
	
    <main>
        <div id="box"></div>
        <div id="join">
            <div class="img-join">
                <img src="<%=contextPath%>/resources/img/join2.png" alt="" class="img-join">
            </div>
            <div id="join-h1"><h1>회원 정보 입력</h1></div>
           
            <div id="form">
                <form action="<%=contextPath%>/member/join2" method="post">
                   <ul id="form-ul">
                    <br>
                    <li class="join-li">*E-mail <br><input type="email" name="memberEmail" placeholder="이메일 형식으로 입력하세요."> <button id="check-btn">중복확인</button></li>
                    <li class="join-li">*비밀번호 <br><input type="password" name="memberPwd" required placeholder="4글자 이상으로 입력하세요"></li>
                    <li class="join-li">*비밀번호 확인<br><input type="password" name="memberPwd2" required></li>
                    <li class="join-li">*사용할 이름<br><input type="text" name="memberName"></li>
                   
                   
                   </ul>
                   <br><input type="button" value="이전" id="pre" onclick="history.go(-1)"><input type="submit" value="다음" id="next">
                </form>
               
            </div>
            
        </div>

    </main>
</body>
</html>