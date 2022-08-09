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
        height: 200px;
        margin: 0 auto;
    }
   
    #find-id-form{
        margin-top: 40px;
        width: 400px;
        height: 200px;
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
        right: -45px;
        background-color: #48ca7d;
        border: 0px;
        border-radius: 8px;
        height: 30px;
    }
</style>
<head>
    <meta charset="UTF-8">
   
    <title>아이디 찾기</title>
</head>
<body>
   
    <div id="outer">
        <h1>아이디찾기</h1>
        <div id="find-id-form-div">
            <form action="" method="post" id="find-id-form">
                <ul>
                    <li>이름</li>
                    <li><input type="text" name="memberName" required></li>
                    <li>전화번호</li>
                    <li><input type="phone" name="memberPhone" required></li>
                    <br><li><input type="submit" value="아이디찾기" id="submit"></li>
                </ul>
            </form>   
                <a href="">회원가입</a>
            <span><a href="">비밀번호 찾기</a></span>
          
            
            
        </div>
        
    </div>

</body>
</html>