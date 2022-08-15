<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    #header-div{
        width: 1920px;
        height: 120px;
    }
    #payment-wrap{
        width: 1920px;
        height: 100%;
        padding-top: 120px;
        padding-left: 192px;
        padding-right: 192px;
    }
    #payment-title{
        font-size: 30px;
        font-weight: 900;
        text-align: center;
    }
    #payment-body{
        width: 600px;
        height: 100%;
        padding-top: 120px;
        margin: auto;
    }
    #payment-body div{
        padding: 10px;
    }
    input:checked{
        background-color: #48CA7D !important;
        border: 0;
    }
    #submit-div button{
        background-color: #48CA7D;
        border: 0;
    }
    #submit-div button:hover{
        background-color: #48CA7D;
        border: 0;
    }
    #firm-num-div{
        display: none;
    }
</style>
</head>
<body>

    <div id="header-div">
        <%@ include file="/WEB-INF/views/common/userHeader.jsp" %>
    </div>

    <div id="payment-wrap">

        <div id="payment-title">결제수단 등록하기</div>
        <div id="payment-body">
            <form action="<%=contextPath%>/project/paymentRegister" method="post" id="payment-form">
                <div id="radio-btn-div">
                    <input type="radio" name="register-type" id="individual" class="form-check-input register-type radio-btn" checked>
                    <label for="individual">개인</label>
                    <input type="radio" name="register-type" id="firm" class="form-check-input register-type radio-btn">
                    <label for="firm">법인</label>
                </div>
                <div id="card-num-input-div">
                    카드 번호
                    <input type="text" placeholder="-없이 16자리" class="form-control" id="card-num">
                </div>
                <div id="valid-term-div">
                    유효 기간
                    <input type="month" name="" id="card-due-date" class="form-control">
                </div>
                <div id="card-pwd-div">
                    카드 비밀번호
                    <input type="password" name="" id="card-pwd" class="form-control" placeholder="앞자리 2개">
                </div>
                <div id="birth-date-div">
                    생년월일
                    <input type="date" name="" id="birth-date" class="form-control">
                </div>
                <div id="firm-num-div">
                    사업자 등록 번호
                    <input type="text" name="" id="firm-num" class="form-control">
                </div>
                <div id="agree-btn-div">
                    <input type="checkbox" name="agree" id="agree" class="form-check-input">
                    <label for="agree">결제사 정보제공 동의</label>
                    <a href="">내용보기</a>
                </div>
                <div id="default-btn">
                    <input type="checkbox" name="default" id="set-default" class="form-check-input">
                    <label for="set-default">기본 결제수단으로 등록</label>
                </div>
                <div id="submit-div">
                    <button type="submit" class="btn btn-success">등록 완료</button>
                </div>
            </form>
        </div>

    </div>


    <script>
        $("#payment-form").submit(function(){
            if($("#agree").is(":checked") == false){
                alert("결제사 정보제공 동의에 체크해주세요.");
                return false;
            }
            let cardNum = $("#card-num").val();
            let cardPwd = $("#card-pwd").val();
            let firmNum = $("#firm-num").val();
            if((cardNum.length<16 && cardPwd.length<2) || (cardNum.length<16 && firmNum.length<10)){
                alert("정보를 마저 입력해주세요.");
                return false;
            }
            return true;
        });

        $(".radio-btn").click(function(){
            if($("#individual").is(":checked")){
                $("#firm-num-div").css("display", "none");
                $("#birth-date-div").css("display", "block");
            }else{
                $("#birth-date-div").css("display", "none");
                $("#firm-num-div").css("display", "block");
            }
        });

        $("#card-num").blur(function(){
            let cardNum = $("#card-num").val();
            if(cardNum.length>16){
                alert("카드 번호는 16자리 이하로 입력해주세요.");
                $("#card-num").val("");
            }
        });

        $("#card-pwd").blur(function(){
            let cardPwd = $("#card-pwd").val();
            if(cardPwd.length>2){
                alert("비밀번호는 2자리 이하로 입력해주세요.");
                $("#card-pwd").val("");
            }
        });
        
        $("#firm-num").blur(function(){
            let firmNum = $("#firm-num").val();
            if(firmNum.length>10){
                alert("사업자등록번호는 10자리 이하로 입력해주세요.");
                $("#firm-num").val("");
            }
        });

        $("#card-due-date").blur(function(){
            let cardDueDate = $("#card-due-date").val();
            let date = new Date();
            let month = 0;
            month = date.getMonth() + 1
            if(month < 10){
                month = "0" + month;
            }
            let today = date.getFullYear() + "-" + month;
            if(today>cardDueDate){
                alert("만료된 카드 유효기간입니다.");
                $("#card-due-date").val("");
            }
        });

        $("#birth-date").blur(function(){
            let birthDate = $("#birth-date").val();
            let date = new Date();
            let month = 0;
            month = date.getMonth() + 1
            if(month < 10){
                month = "0" + month;
            }
            let today = date.getFullYear() + "-" + month;
            if(today<birthDate){
                alert("생일은 오늘 이전으로 입력해주세요.");
                $("#brith-date").val("");
            }
        });

    </script>
</body>
</html>