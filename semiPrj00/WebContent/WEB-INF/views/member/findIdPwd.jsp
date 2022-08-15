<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    #box{height: 150px;width: 1920px;}
    #outer{
        /* border: 1px solid blue; */
        width: 700px;
        height: 800px;
        margin: 0 auto;
    }
    #find-id-pwd-div{
        /* border: 1px solid red; */
        margin: 0 auto;
        width: 600px;
        height: 300px;
        margin: 0 auto;
        margin-top: 20px;
        padding-top: 60px;
        background-color: rgba(255, 255, 255, 0.675);
        border-radius: 8px;
    }
   
    #find-id-form{
        width: 400px;
        height: 250px;
        /* border: 1px solid gray; */
        background-color: rgba(255, 255, 255, 0.675);
        border-radius: 8px;
        margin: 0 auto;
        margin-top: 45px;
    }

    ul{
        position: relative;
        bottom: -26px;
        right:-60px;
    }
    li{
        list-style: none;
        line-height: 27px;
        font-size: 20px;
        height: 28px;
        margin-bottom: 10px;
    }
    input{
        border: 0px;
        border-bottom: 2px solid darkgray;
    }
    h1{text-align: center;}
    
    #submit{
        position: relative;
        right: -50px;
        background-color: #48ca7d;
        border: 0px;
        border-radius: 8px;
        height: 35px;
    }
    #submit_pwd{
        position: relative;
        right: -75px;
        background-color: #48ca7d;
        border: 0px;
        border-radius: 8px;
        height: 35px;
        width: 60px;
    }
    #check_pwd{
        position: relative;
        right: -75px;
        background-color: #48ca7d;
        border: 0px;
        border-radius: 8px;
        height: 35px;
        width: 60px;
    }
    #find{
        text-align: center;
        font-size: 20px;
        color: red;
    }
    #modal_btn{
        width: 120px;
        height: 120px;
        font-size: 23px;
        margin-right: -40px; 

    }
    #modal_btn_pwd{
        width: 120px;
        height: 120px;
        font-size: 23px;
        margin-left: -40px;
    }
    .modal_wrap{
        display: none;
        width: 700px;
        height: 500px;
        position: absolute;
        top: 18%;
        /* left: 50%; */
        
        background: #F9F5EA;
        z-index: 2;
    }
    .back {
        display: none;
        position: absolute;
        content: "";
        width: 100%;
        height: 100%;
        background-color: rgba(0,0,0,0.5);
        top: 0;
        left: 0;
        z-index: 1;
    }
    .modal_close {
        width: 26px;
        height: 26px;
        position: absolute;
        bottom: 30px;
        right: 50px;
    }
    .modal_close_pwd {
        width: 26px;
        height: 26px;
        position: absolute;
        bottom: 30px;
        right: 50px;
    }
    .back_pwd {
        display: none;
        position: absolute;
        content: "";
        width: 100%;
        height: 800px;
        background-color: rgba(0,0,0,0.5);
        top: 0;
        left: 0;
        z-index: 1;
    }
    .modal_wrap_pwd{
        display: none;
        width: 700px;
        height: 600px;
        position: absolute;
        top: 18%;
        /* top: 50%;
        left: 50%; */
        
        background: #F9F5EA;
        z-index: 2;
    }
   
    #find-pwd-form{
        width: 400px;
        height: 450px;
        /* border: 1px solid gray; */
        background-color: rgba(255, 255, 255, 0.675);
        border-radius: 8px;
        margin: 0 auto;
        margin-top: 20px;
    }
    #btn_div{
        text-align: center;
        margin-top: 60px;
    }
    #btn_div button{
        border: 0px;
    }
    .after_check{
        display: none;
    }
    .under-btn{
        /* background-color: #48ca7d; */
        border-radius: 8px;
        height:30px;
        margin: 5px;
    }
</style>
<head>
    <meta charset="UTF-8">
   
    <title>아이디/비밀번호 찾기</title>
</head>
<body>
   <%@ include file="/WEB-INF/views/common/userHeader.jsp" %>
   
   <main>
    <div id="box"></div>
     <div id="outer">
        <h1>아이디 / 비밀번호 찾기</h1>
        <div id="find-id-pwd-div">
            <div id="btn-div">
                <button id="modal_btn">아이디 <br> 찾기</button>
                <div class="back"></div>
                <div class="modal_wrap">
                    <div>
                        <br> <h1>아이디 찾기</h1>
                        <form action="" method="post" id="find-id-form">
                            <ul>
                                <li>이름</li>
                                <li><input type="text" name="memberName" required></li>
                                <li>전화번호</li>
                                <li><input type="phone" name="memberPhone" required></li>
                                <br><li><input type="submit" value="아이디찾기" id="submit"></li>
                            </ul>
                        </form>   
                        <div id="find"><br> abcd123@naver.com</div>
                    </div>
                    <div class="modal_close"><button>close</button></div>
                </div>

                <button id="modal_btn_pwd">비밀번호 <br> 찾기</button>
                <div class="back_pwd"></div>
                <div class="modal_wrap_pwd">
                    <div class="modal_close_pwd"><button>close</button></div>
                    <div>
                        <br> <h1>비밀번호 찾기/변경</h1>
                        <form action="" method="post" id="find-pwd-form">
                            <ul>
                                <li>E-mail</li>
                                <li><input type="text" name="memberName" required></li>
                                <li>전화번호</li>
                                <li><input type="phone" name="memberPhone" required></li>
                
                                <li>새 비밀번호</li>
                                <li><input type="password" name="memberNewPwd" required></li>
                                <li>비밀번호 재확인</li>
                                <li><input type="password" name="memberNewPwd2" required></li>
                                <br><li><input type="submit" value="완료" id="submit_pwd"></li>
                                </div>
                            </ul>
                        </form>
                    </div>
                </div>
                <div id="btn_div"><button onclick="location.href='<%=contextPath%>/member/join'" class="under-btn">회원가입</button> <button onclick="location.href='<%=contextPath%>/member/login'" class="under-btn">로그인</button></div>
                
            </div>
            

           
               
            
          
            
            
        </div>
        
    </div>
    </main>
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

        function onClick2(){
            document.querySelector('.modal_wrap_pwd').style.display='block';
            document.querySelector('.back_pwd').style.display='block';
        }
        function offClick2(){
            document.querySelector('.modal_wrap_pwd').style.display='none';
            document.querySelector('.back_pwd').style.display='none';
        }

        document.getElementById('modal_btn_pwd').addEventListener('click',onClick2);
        document.querySelector('.modal_close_pwd').addEventListener('click',offClick2);
   
      
   
   
    }
   </script>

</body>
</html>