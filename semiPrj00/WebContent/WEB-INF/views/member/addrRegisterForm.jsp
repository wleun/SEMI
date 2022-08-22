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
    #addr-wrap{
        width: 1920px;
        height: 100%;
        padding-top: 120px;
        padding-left: 192px;
        padding-right: 192px;
    }
    #addr-title{
        font-size: 30px;
        font-weight: 900;
        text-align: center;
    }
    #addr-body{
        width: 600px;
        height: 100%;
        padding-top: 60px;
        margin: auto;
    }
    #addr-body div{
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
</style>
</head>
<body>

    <div id="header-div">
        <%@ include file="/WEB-INF/views/common/userHeader.jsp" %>
    </div>

    <div id="addr-wrap">
        
        <div id="addr-title">배송지 등록하기</div>

        <div id="addr-body">
            <form action="<%=contextPath%>/member/addrRegister" id="addr-register-form" method="post">
            	<input type="hidden" name="memberNo" value="<%=loginMember.getNo()%>">
            	<div id="name-div">
                    수취인명
                    <input type="text" name="name" id="name" class="form-control" maxlength="7" required>
                </div>
                <div id="name-div">
                    전화번호
                    <input type="text" name="phone" id="phone" class="form-control" maxlength="15" required>
                </div>
                <div id="post-num-div">
                    우편번호
                    <input type="text" name="postNum" id="post-num" class="form-control" maxlength="5" required>
                </div>
                <div id="addr1-div">
                    주소
                    <input type="text" name="addr1" id="addr1" class="form-control" maxlength="25" required>
                </div>
                <div id="addr2-div">
                    상세 주소
                    <input type="text" name="addr2" id="addr2" class="form-control" maxlength="50" required>
                </div>
                <div id="default-btn">
                    <input type="checkbox" name="default" id="set-default" class="form-check-input">
                    <label for="set-default">기본 배송지로 등록</label>
                </div>
                <div id="submit-div">
                    <button type="submit" class="btn btn-success">등록 완료</button>
                </div>
            </form>
        </div>
        

    </div>


</body>
</html>