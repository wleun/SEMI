<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
   <style>
       
        #box{height: 150px;width: 1920px;}
        #join-outer{
         border: 1px solid blue;
         width: 700px;
         height: 800px;
         margin: 0px auto;
        }
        #join{
            border: 2px solid red;
            width: 90%;
            height: 800px;
            margin: 0 auto;
        }
        #join-h1{
            text-align: center;
        }
       #content{
        border: 1px solid black;
        width: 100%;
        height: 200px;
        overflow: scroll;
        margin: 0 auto;
       }
       #check{
        position: relative;
        text-align: center;
        bottom: -10px;
        }
        ::placeholder{
        font-size: 12px;
       }
           
    </style>
</head>
<body>

	<%@ include file="/WEB-INF/views/common/userHeader.jsp" %>

    <main>
        <div id="box"></div>
        <div id="join-outer">
         <div id="join">
            
            <div id="join-h1"><h1>개인정보동의서</h1></div>
           	<br>
            <div id="content">가나다라마바사아자차카타파하</div>
            <div id="check">
                <form action="memberJoin2.jsp" method="post">
                    동의하지않습니다&nbsp;<input type="radio" name="check" value="no" checked>&nbsp;&nbsp;
                    동의합니다&nbsp;<input type="radio" name="check" value="yes">
                    <br><br>
                    <input type="button" value="이전" id="pre" onclick="location.href='memberLogin.jsp'">&nbsp;&nbsp;
                    <input type="submit" value="다음" id="next">
                </form>
               
            </div>
            
            
        </div>
        </div>
       
    </main>
</body>
</html>