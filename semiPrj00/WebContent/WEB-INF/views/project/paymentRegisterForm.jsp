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
        background-color: skyblue;
        width: 900px;
        height: 100%;
        padding-top: 120px;
        margin: auto;
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
            <form action="<%=contextPath%>/project/paymentRegister" method="post">
                <div id="radio-btn-div">
                    <input type="radio" name="" id="">
                    <input type="radio" name="" id="">
                </div>
                <div id="card-num-input-div">
                    <input type="text" name="" id="">
                </div>
                <div id="valid-term-div">
                    <input type="date" name="" id="">
                </div>
                <div id="card-pwd-div">
                    <input type="text" name="" id="">
                </div>
                <div id="birth-date-div">
                    <input type="date" name="" id="">
                </div>
                <div id="agree-btn-div">
                    <input type="checkbox" name="" id="">
                    <a href="">내용보기</a>
                </div>
                <div id="default-btn">
                    <input type="checkbox" name="" id="">
                </div>
                <input type="submit" value="등록 완료">
            </form>
        </div>

    </div>

</body>
</html>