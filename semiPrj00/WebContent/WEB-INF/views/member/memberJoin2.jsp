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
            /* border: 2px solid blue; */
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
            border-radius: 10px;
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
        border: 0px solid gray ;
        border-radius: 50px;
        background-color: #48CA7D;
        margin-left: 5px;
        color: white;
        font-size: 18px;
       }
       #next{
        width: 60px;
        float: right;
        border: 0px solid gray ;
        border-radius: 50px;
        background-color: #48CA7D;
        margin-right: 5px;
        color: white;
        font-size: 18px;
       }
       ::placeholder{
        font-size: 15px;
       } 
        #check-btn{
        width: 80px;
        border: 1px solid lightgray;
        font-size: medium;
        border-radius: 50px;
        }
      
      .img-join{
        width: 70px;
        height: 70px;
  
        margin-left: 75px;
        margin-bottom: -50px;
        /* left: 80px;
        bottom: -27px; */
      }
      .modal-div{
        display: none;
      }

      @import url("//fonts.googleapis.com/earlyaccess/nanumgothic.css" );
    input[type=password]{
	font-family:"Nanum Gothic", sans-serif !important;
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
                    <li class="join-li">
                        *비밀번호 <br><input type="password" name="memberPwd" id="pwd" required>
                        <div id="pwd-size" style="color: red; font-size:15px; position: absolute;">4자리 이상 입력하세요.</div>
                    </li>
                    <li class="join-li" >
                        *비밀번호 확인<br><input type="password" name="memberPwd2" id="pwd2" required>
                        <div id="danger" style="color: red; font-size:15px; position: absolute;">비밀번호와 일치하지않습니다.</div><div id="success" style="color: #48CA7D; font-size:15px; position: absolute;">비밀번호와 일치합니다!</div>
                    </li>
                    <li class="join-li">*이름 (법인 : 대표명)<br><input type="text" name="memberName"></li>
                    <li class="join-li">*닉네임<br><input type="text" name="memberNick"></li>
                    <li class="join-li">추천코드<br><input type="text" name="code"></li>
                    
                   
                   
                   </ul>
                   <br><input type="button" value="이전" id="pre" onclick="history.go(-1)"><input type="submit" value="다음" id="next">
                </form>
               
            </div>
            
        </div>

    </main>
   
    <script>
        $(function(){
            $("#success").hide();
            $("#danger").hide();
            $("input").keyup(function(){
                var pwd=$('#pwd').val();
                var pwd2=$('#pwd2').val();
                if(pwd != "" && pwd2 != ""){
                    if(pwd != pwd2){
                        $("#success").hide();
                        $('#danger').show();
                        $('#next').attr("disabled","disabled");
                    }else{
                        $('#danger').hide();
                        $("#success").show();
                        $('#next').removeAttr("disabled");
                    }
                }
                if(pwd.length < 4){
                    $("#pwd-size").show();
                }else{
                    $("#pwd-size").hide();
                }
            })

        })

    </script>

</body>
</html>