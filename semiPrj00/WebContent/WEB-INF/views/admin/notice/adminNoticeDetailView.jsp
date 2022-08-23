<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>
	  #noticeDetailOuter {
        display: flex;
        flex-wrap: wrap;
        flex-direction: row;
        justify-content: center;
        align-items: center;
        width: 1500px;
        height: 1800px;
        margin-left: 75px;
    }

    #noticeDetail {
        height: 1500px;
        display: flex;
        flex-direction: column;
        align-items: center;
        align-self: center;
        width: 85%;
        border: 1px solid #C3B091;
        border-radius: 10px;
    }
    
    #noticeHeader {
        width: 100%;
        height: 15%;
        display: flex;
        justify-content: center;
        flex-direction: column;
        
    }


    #noticeTitle {
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

    #noticeInfo {
        height: 60%;
        width: 100%;
        display: flex;
        flex-direction: row;
    }

    #infonoticeNo {
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
        padding-bottom: 40px;
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

    #noticePeriod {
        font-size: 19px;
    }


    #noticeContent{
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
        <div id="noticeDetailOuter">
            <div id="noticeDetail">
                <div id="noticeHeader">
                    <div id="noticeTitle">
                        <h2>${adminNoticeVo.title}</h2>
                    </div>
                    <div id="noticeInfo">
                        <div id="infonoticeNo">
                            [공지사항 번호 : ${adminNoticeVo.no}]
                            <div id="important">[중요도 : ${adminNoticeVo.importantYn}]</div>
                        </div>
                        <div id="infoFirstDiv">
                            <div id="writeDate">작성시간 : ${adminNoticeVo.writeDate}</div>
                            <div id="editDate">수정시간 : ${adminNoticeVo.editDate}</div>
                        </div>
                        <div id="infoSecondDiv">
                            <div id="backBtn"><button onclick="history.back()">뒤로가기</button></div>
                            <div id="editBtn"><button>수정하기</button></div>
                            <div id="deletebtn"><button onclick="location.href='<%=contextPath%>/admin/notice/delete?no=${adminNoticeVo.no}';">삭제하기</button></div>
                        </div>
                        
                    </div>
                </div>
                <div id="noticeContent">
                    <div id="contentImage">
                        <img src="<%=contextPath %>/resources/admin/notice/${adminNoticeAttachmentVo.name}" alt="이벤트 내용">
                    </div>
                    <div id="contentText">${adminNoticeVo.content}</div>
                </div>
            </div>
        </div>

    </content>

</body>
</html>