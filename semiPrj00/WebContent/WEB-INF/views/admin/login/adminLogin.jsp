<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    <% String contextPath = request.getContextPath(); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>

    #pageWrap {
        width: 1920px;
        height: 1080px;
        background-repeat: no-repeat;
        -webkit-backdrop-filter: blur(10px);
        backdrop-filter: blur(10px);
        background-image: url(<%=contextPath%>/resources/img/adminLoginForm_background.jpg);
        background-size : cover;
        opacity: 0.8;
    }   


    #adminLoginDiv {
        position: absolute;
        top:290px;
        left: 710px;
        width: 500px;
        height:500px;
        border: 3px solid black;
        background-color: black;
        opacity: 0.7;
        border-radius: 50px;

    }

    #adminLoginDiv > form {
        width: 100%;
        height: 100%;
    }

    #adminLoginForm {
        width: 100%;
        height: 100%;
        display: flex;
        flex-direction: column;
        justify-content: center;
        align-items: center;
    }

    #adminLoginLogo {
        width: 100%;
        height: 30%;
        display: flex;
        flex-direction: column;
        justify-content: center;
        align-items: center;
        border-bottom: 1px solid white;
    }

    #adminLoginLogo>img {
        width: 200px;
        height: 95px;
    }

    #adminLoginId {
        width: 100%;
        height: 25%;
        border-bottom: 1px solid white;
    }

    #adminLoginPwd{
        width: 100%;
        height: 25%;
        border-bottom: 1px solid white;
    }

    #adminLoginBtn{
        width: 100%;
        height: 20%;
    }


</style>
</head>
<body>

	<div id="pageWrap">

        <div id="adminLoginDiv">
            <form action="">
                <div id="adminLoginForm">
                    <div id="adminLoginLogo">
                        <img src="<%=contextPath%>/resources/img/200perlogo_pse.png" alt="">
                    </div>
                    <div id="adminLoginId">

                    </div>
                    <div id="adminLoginPwd">

                    </div>

                    <div id="adminLoginBtn">

                    </div>
                </div>
            </form>
        </div>
        
    </div>

	

</body>
</html>