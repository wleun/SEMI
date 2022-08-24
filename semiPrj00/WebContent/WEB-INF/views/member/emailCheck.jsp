<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	String result = (String)request.getAttribute("result");
	String result1 = (String)request.getAttribute("result1");
	String email = (String)request.getAttribute("email");
	if(email==null){
		email="이메일 형태로 입력하세요.";
	}
	String contextPath = request.getContextPath();
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
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <div id="emailCheck">
        <div class="email">
        <form action="<%=request.getContextPath()%>/member/emailCheck" method="post">
            E-mail <input type="email" name="checkEmail" id="checkemail" > 
            <input type="button" value="중복확인" onclick="testEmail();">
        </form>
        <div id="r" font-weight: bold; font-size: 20px;"></div>
        <div><button id="checkbtn" onclick="sendChildValue();">확인</button></div>
    </div>
    
   
    <script>
    	function sendChildValue(){
    		
    		const r = document.querySelector('#r');
    		
    		console.log(r);
    	
    		if(r == null || r.innerText != '사용 가능한 계정입니다.'){
    			alert('중복체크를 먼저 해주세요 !');
    			return;
    		}else{
    			
    		var email = $("#checkemail").val();
    		console.log(email);
    		window.opener.console.log(email);
    		window.opener.document.getElementById('email').value = email;
    		window.close();
    		}
    	}
    </script>
    <script>
  		function testEmail(){
  			const email = $('#checkemail').val();
  			
  			console.log(email);
  			$.ajax({
  				url : "<%=contextPath %>/member/emailCheck",
  				type : "POST",
  				data : {checkEmail : email},
  				dataType : 'text',
  				success : function(result){
  					if(result == 1){
  						document.getElementById('r').innerHTML = "이미 사용 중인 닉네임입니다.";
  						document.getElementById('r').style.color = "red";
  						$('#next').attr("disabled","disabled");
  					}else{
  						document.getElementById('r').innerHTML = "사용 가능한 계정입니다.";
  						document.getElementById('r').style.color = "#48CA7D";
  					}
  				},
  				error : function(){
  					alert("서버요청실패..");
  				}
  			
  			})
  			
  		}
  	</script>
</body>
</html>