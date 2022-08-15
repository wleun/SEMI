<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>


    #eventDetailOuter {
        display: flex;
        flex-wrap: wrap;
        flex-direction: row;
        justify-content: center;
        align-items: center;
        width: 1500px;
        height: 1800px;
        margin-left: 75px;
    }

    #eventDetail {
        height: 1500px;
        display: flex;
        flex-direction: column;
        justify-content: center;
        align-items: center;
        align-self: center;
        width: 85%;
        border: 1px solid #C3B091;
        border-radius: 16px;
    }
    
    #eventHeader {
        width: 100%;
        height: 15%;
        display: flex;
        justify-content: center;
        flex-direction: column;
        
    }


    #eventTitle {
        height: 40%;
        width: 100%;
        display: flex;
        flex-direction: column;
        justify-content: center;
        text-align: center;
        background-color: #F9F5EA;
        border-bottom: 1px solid #C3B091;
        border-radius: 16px 16px 0px 0px;
    }

    #eventInfo {
        height: 60%;
        width: 100%;
        display: flex;
        flex-direction: row;
    }

    #infoEventNo {
        width: 20%;
        height: 100%;
        display: flex;
        flex-direction:column;
        justify-content: center;
        align-items:flex-end;
        padding-bottom: 30px;
    }

    #infoFirstDiv {
        width: 60%;
        height: 100%;
        display: flex;
        flex-direction: column;
        justify-content: center;
        text-align: center;
    }

    #infoSecondDiv {
        width: 20%;
        height: 100%;
        display: flex;
        flex-direction: row;
        justify-content: space-evenly;
        align-items: flex-end;
        padding-bottom: 30px;
    }

    #notUsedDiv {
        width: 30%;
        height: 100%;
    }

    #infoSecondDiv button {
        border-radius: 16px;
        width: 80px;
    }

    #eventPeriod {
        font-size: 19px;
    }


    #eventContent{
        width: 100%;
        height: 85%;
        display: flex;
        flex-wrap: wrap;
        flex-direction: column;
    }

    #contentImage {
        width: 100%;
        height: 80%;
        display: flex;
        flex-direction: column;
    }

    #contentText {
        width: 100%;
        height: 20%;
        display: flex;
        flex-wrap: wrap;
        justify-content: center;
        align-items: center;
        text-align: center;
    }


</style>
</head>
<body>

<%@ include file="/WEB-INF/views/common/adminLayout.jsp" %>

    <content>
        <div id="eventDetailOuter">
            <div id="eventDetail">
                <div id="eventHeader">
                    <div id="eventTitle">
                        <h1> 이벤트1 </h1>
                    </div>
                    <div id="eventInfo">
                        <div id="infoEventNo">[글번호 : 1]</div>
                        <div id="infoFirstDiv">
                            <div id="eventPeriod">[진행예정] 2022-08-15 ~ 2022-09.01</div>
                            <div id="writeDate">작성시간 : 2022-08-16</div>
                            <div id="editDate">수정시간 : 2022-08-19</div>
                        </div>
                        <div id="infoSecondDiv">
                            <div id="backBtn"><button>뒤로가기</button></div>
                            <div id="editBtn"><button>수정하기</button></div>
                            <div id="deletebtn"><button>삭제하기</button></div>
                        </div>
                        
                    </div>
                </div>
                <div id="eventContent">
                    <div id="contentImage">
                        <img src="<%=contextPath %>/resources/img/adminDashboard_img.jpg" alt="이벤트 내용">
                        <!-- <img src="<%=contextPath %>/resources/img/adminDashboard_img.jpg" alt="이벤트 내용2"> -->
                    </div>
                    <div id="contentText">그러한 이벤트입니다.</div>
                </div>
            </div>
        </div>

    </content>

</body>
</html>