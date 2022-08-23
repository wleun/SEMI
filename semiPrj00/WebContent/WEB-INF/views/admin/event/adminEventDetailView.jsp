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
        border-radius: 10px;
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
        border-radius: 10px 10px 0px 0px;
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
        align-items:center;
        padding-bottom: 30px;
        font-size: 18px;
    }

    #infoFirstDiv {
        width: 60%;
        height: 100%;
        display: flex;
        flex-direction: column;
        justify-content: center;
        text-align: center;
        padding-bottom: 20px;
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
        border-radius: 50px;
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
        height: 60%;
        display: flex;
        flex-direction: column;
    }

    #contentImage>img {
        width: 100%;
        height: 100%;
    }

    #contentText {
        width: 100%;
        height: 40%;
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
                        <h2> ${adminEventVo.title} </h2>
                    </div>
                    <div id="eventInfo">
                        <div id="infoEventNo">
                            [이벤트 번호 : ${adminEventVo.no}]
                            <div id="important">[중요도 : ${adminEventVo.importantYN}]</div>
                        </div>
                        <div id="infoFirstDiv">
                            <div id="eventPeriod">[${adminEventVo.status}] ${adminEventVo.startDate} ~ ${adminEventVo.endDate}</div>
                            <div id="writeDate">작성시간 : ${adminEventVo.writeDate}</div>
                            <div id="editDate">수정시간 : ${adminEventVo.editDate}</div>
                        </div>
                        <div id="infoSecondDiv">
                            <div id="backBtn"><button onclick="history.back()">뒤로가기</button></div>
                            <div id="editBtn"><button onclick="location.href='<%=contextPath%>/admin/event/edit?no=${adminEventVo.no}';">수정하기</button></div>
                            <div id="deletebtn"><button onclick="location.href='<%=contextPath%>/admin/event/delete?no=${adminEventVo.no}';">삭제하기</button></div>
                        </div>
                        
                    </div>
                </div>
                <div id="eventContent">
                    <div id="contentImage">
                        <img src="<%=contextPath %>/resources/admin/event/${adminEventAttachmentVo.name}" alt="이벤트 내용">
                        <!-- <img src="<%=contextPath %>/resources/img/adminDashboard_img.jpg" alt="이벤트 내용2"> -->
                    </div>
                    <div id="contentText">${adminEventVo.content}</div>
                </div>
            </div>
        </div>

    </content>

</body>
</html>