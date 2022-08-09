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
            border: 1px solid red;
            width: 500px; height: 550px;
            margin: 0 auto;
            font-size: 20px;
        }
       li{
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
       }
       #next{
        width: 60px;
        float: right;
       }
       ::placeholder{
        font-size: 15px;
       } 
      #check-btn{
        width: 250px;
        border: 1px solid lightgray;
      }
    </style>
</head>
<body>
<%@ include file="/WEB-INF/views/common/userHeader.jsp" %>
		
	
    <main>
        <div id="box"></div>
        <div id="join">
            
            <div id="join-h1"><h1>회원정보</h1></div>
           
            <div id="form">
                <form action="" method="post">
                   <ul>
                    <li>*E-mail</li>
                    <li><input type="email" name="memberEmail" placeholder="이메일 형식으로 입력하세요."> <button>중복확인</button></li>
                    <li>*비밀번호</li>
                    <li><input type="password" name="memberPwd" required placeholder="4글자 이상으로 입력하세요"></li>
                    <li>*비밀번호 확인</li>
                    <li><input type="password" name="memberPwd2" required></li>
                    <li>*이름</li>
                    <li><input type="text" name="memberName"></li>
                    <li>*닉네임</li>
                    <li><input type="text" name="memberNick" required></li>
                    <li><br> <input type="button" value="이전" id="pre"><input type="submit" value="다음" id="next"></li>
                   </ul>
                    
                </form>
               
            </div>
            
        </div>

    </main>
</body>
</html>