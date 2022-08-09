<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    #outer{
        border: 1px solid blue;
        width: 700px;
        height: 800px;
        margin: 0 auto;
    }
    #find-id-form-div{
        border: 1px solid red;
        margin: 0 auto;
        width: 400px;
        height: 400px;
        margin: 0 auto;
    }
   
    #find-id-form{
        margin-top: 40px;
        width: 400px;
        height: 400px;
        border: 1px solid gray;
        margin: 0 auto;
    }

    ul{
        position: relative;
        bottom: -10px;
        right:-80px;
    }
    li{
        list-style: none;
        line-height: 27px;
        font-size: small;
        height: 28px;
    }
    input{
        border: 0px;
        border-bottom: 2px solid darkgray;
    }
    h1{text-align: center;}
    span{float: right;}
    a{
        font-size: small;
        text-decoration: none;
        color: #48ca7d;
        font-weight: bold;
    }
    #submit{
        position: relative;
        right: -65px;
        background-color: #48ca7d;
        border: 0px;
        border-radius: 8px;
        height: 25px;
    }
    #check{
        position: relative;
        right: -65px;
        background-color: #48ca7d;
        border: 0px;
        border-radius: 8px;
        height: 25px;
    }
</style>
<head>
    <meta charset="UTF-8">
   
    <title>비밀번호 찾기</title>
</head>
<body>
   
    <div id="outer">
        <h1>비밀번호 찾기</h1>
        <div id="find-id-form-div">
            <form action="" method="post" id="find-id-form">
                <ul>
                    <li>E-mail</li>
                    <li><input type="text" name="memberName" required></li>
                    <li>전화번호</li>
                    <li><input type="phone" name="memberPhone" required></li>
                    <br><li><input type="submit" value="인증" id="check"></li>
                    <br>
                    <li>새 비밀번호</li>
                    <li><input type="password" name="memberNewPwd" required></li>
                    <li>비밀번호 재확인</li>
                    <li><input type="password" name="memberNewPwd2" required></li>
                    <br><li><input type="submit" value="완료" id="submit"></li>
                </ul>
            </form>   
                <a href="">메인화면</a>
            <span><a href="">로그인 화면</a></span>
          
            
            
        </div>
        
    </div>

</body>
</html>