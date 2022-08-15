<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    #box{height: 150px;width: 1920px;}
    #login-outer{
        /*border: 1px solid blue;*/
        width: 700px;
        height: 800px;
        margin: 0px auto;
    }
    #login-form-div{
        /*border: 1px solid red;*/
        margin: 20px auto;
        
    }
   
    #login-form{
        margin-top: 40px;
        width: 100%;
        height: 300px;
        /* border: 1px solid gray; */
        margin: 0px auto;
        background-color: rgba(255, 255, 255, 0.675);
        border-radius: 8px;
    }

    #form-ul{
        position: relative;
        bottom: -80px;
        right:-145px;

    }
    .login-li{
        list-style-type: none;
        line-height: 29px;
        margin-bottom: 5px;
        font-size: 20px;
    }
    input{
        border: 0px;
        height: 40px;
        width: 230px;
        border-bottom: 2px solid darkgray;
        background-color: rgba(255, 255, 255, 0.675);
        
    }
    #submit input{
        background-color: #48ca7d;
        width: 70px;
        height: 55px;
        border: 0;
        border-radius: 8px;
        font-size: 19px;
    }
    #submit{
        position:relative;
        left: 510px;
        bottom: 5px;
        box-sizing: border-box;
    }
    #login-h1{
       text-align: center;
       font-size: 40px;
    }
   
    .join-find-a{
        text-decoration: none;
        color: black;
        text-align: center;
       
    }
    .join-find-a:hover{
        color: #48ca7d;
    }
    .join-find{float: right; font-size: 18px;}
    ::placeholder{font-size: 15px;}
</style>
<head>
    <meta charset="UTF-8">
   
    <title>로그인</title>
</head>
<body>
<%@ include file="/WEB-INF/views/common/userHeader.jsp" %>
   <main>
    <div id="box"></div>
    <div id="login-outer">
        <h1 id="login-h1">로그인</h1>
        
        <div id="login-form-div">
        
            <form action="" method="post" id="login-form">
               
                <ul id="form-ul">
                    <li class="login-li">E - mail&nbsp; <input type="email" name="memberEmail" required placeholder="이메일을 입력하세요."></li>
                    <li class="login-li">비밀번호&nbsp;&nbsp;<input type="password" name="memberPwd" required placeholder="비밀번호를 입력하세요." id="inputPwd"></li>
                </ul>
                <div id="submit"><input type="submit" value="로그인"></div>
                <br><br><br><br>
                <li class="join-find login-li"> <a href="<%=contextPath %>/member/join" class="join-find-a">회원가입 | </a><a href="<%=contextPath %>/member/findId" class="join-find-a">아이디/비밀번호 찾기 &nbsp;</a></li>
               
            </form>
            
            
        </div>
        
    </div>
   </main>
    
    

</body>
</html>