<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	String result = (String)request.getAttribute("result");
	String result1 = (String)request.getAttribute("result1");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    body{
        background-color: #F9F5EA;
    }
    #emailCheck{
        border-radius: 10px;
        width: 500px;
        height: 200px;
        text-align: center;
        padding-top: 60px;
        background-color: rgba(255, 255, 255, 0.675);;
    }
    #checkbtn{
        margin-top: 20px;
    }
    .email-top{
        box-sizing: border-box;
        width: 100%;
        background-color: #48CA7D;
    }
</style>
</head>
<body>
    <div id="emailCheck">
        <div class="email">
        <form action="<%=request.getContextPath()%>/member/emailCheck" method="post">
            E-mail <input type="email" name="checkEmail" id="checkemail"> <input type="submit" value="중복확인">
        </form>
        <%if(result != null){ %>
        <div id="r" style="color: #48CA7D; font-weight: bold; font-size: 20px;"><%=result %></div>  
        <% }else if(result1 != null){%>
        <div id="r" style="color: red; font-weight: bold; font-size: 20px;"><%=result1 %></div>
        <%} %>
        </div>     

        <div><button id="checkbtn" onclick="sendChildValue();">확인</button></div>
    </div>
    
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script>
    	function sendChildValue(){
    		
    		const r = document.querySelector('#r');
    		
    		console.log(r);
    		
    		if(r == null || r.innerText != '사용 가능한 이메일입니다.'){
    			alert('중복체크를 먼저 해주세요 !');
    			return;
    		}
    		
    		
    		var email = $("#checkemail").val();
    		window.opener.document.getElementById("email").value = email;
    		window.close();
    	}
    </script>
    
</body>
</html>