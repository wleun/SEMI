<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	#dashBoard {
            display: flex;
            flex-direction: row;
            width: 1632px;
            height: 972px;
        }

        .dashBoard>div {
            background-color: white;
            border: 1px solid #C3B091;;
            border-radius: 10px;
            /* filter: drop-shadow(0px 1px 2px #C3B091); */
        }

        .dashBoard{
            width: 33.333%;
            height: 100%;
            padding: 0px;
            display: flex;
            flex-direction: column;
            justify-content: space-evenly;
            text-align: center;
            padding: 50px;
        }

        #summary {
            width: 430px;
            height: 135px;
        }

        #summaryText {
            width: 100%;
            height: 35%;
            display: flex;
            flex-direction: column;
            justify-content: center;
            font-size: 18px;

        }

        #summaryTable {
            padding-top: 3px;
            padding-right: 15px;
        }

        #summaryTable >table {
            width: 100%;
            height: 100%;
            font-size: 14px;
            text-align: center;
        }

        #proposal {
            width: 430px;
            height: 240px;
        }

        #proposalText {
            width: 100%;
            height: 25%;
            display: flex;
            flex-direction: column;
            justify-content: center;
            font-size: 18px;
        }

        #proposalTable {
            padding: 5px;
            width: 100%;
            height: 65%;
            display: flex;
            flex-direction: row;
            justify-content:center;
        }

        

        #message {
            width: 430px;
            height: 240px;
        }

        #messageText {
            width: 100%;
            height: 22%;
            display: flex;
            flex-direction: column;
            justify-content: center;
            font-size: 18px;

        }

        #eventDashBoard {
            width: 430px;
            height: 415px;
        }

        #eventThumbnail {
            height: 51%;
            border-radius: 10px 10px 0px 0px;
            border: 0px;
        }

        #eventOngoing {
            height: 49%;
            border-radius: 0px 0px 10px 10px;
            border: 0px;
        }

        #eventOngoingText {
            width: 100%;
            height: 25%;
            display: flex;
            flex-direction: column;
            justify-content: center;
            font-size: 18px;

        }

        #noticeDashBoard {
            width: 430px;
            height: 250px;
        }

        #noticeDashBoardText {
            width: 100%;
            height: 25%;
            display: flex;
            flex-direction: column;
            justify-content: center;
            font-size: 18px;

        }

        #todaySuccessPrj {
            width: 430px;
            height: 200px;
        }

        #todaySuccessPrjText {
            width: 100%;
            height: 23%;
            display: flex;
            flex-direction: column;
            justify-content: center;
            font-size: 18px;

        }

        #todayStartPrj {
            width: 430px;
            height: 200px;
        }

        #todayStartPrjText {
            width: 100%;
            height: 23%;
            display: flex;
            flex-direction: column;
            justify-content: center;
            font-size: 18px;

        }

        #todayReport{
            width: 430px;
            height: 200px;
        }

        #todayReportText {
            width: 100%;
            height: 23%;
            display: flex;
            flex-direction: column;
            justify-content: center;
            font-size: 18px;

        }
	
</style>
</head>
<body>

	<%@ include file="/WEB-INF/views/common/adminLayout.jsp" %>

	<content> 
            <div id="dashBoard">

                <div id="dashBoardDiv1" class="dashBoard">
                    <div id="summary">
                        <div id="summaryText">요약</div>
                        <div id="summaryTable">
                            <table>
                                <tr>
                                    <td>접수된 제안서</td>
                                    <td>0건</td>
                                    <td width="10px"></td>
                                    <td>|</td>
                                    <td>접수된 신고</td>
                                    <td>0건</td>
                                </tr>
                                <tr>
                                    <td>오늘 성사된 프로젝트</td>
                                    <td>0건</td>
                                    <td width="10px"></td>
                                    <td>|</td>
                                    <td>오늘 시작된 프로젝트</td>
                                    <td>0건</td>
                                </tr>
                                <tr>
                                    <td>진행중인 이벤트</td>
                                    <td>0건</td>
                                    <td width="10px"></td>
                                    <td>|</td>
                                    <td>오늘 업로드된 공지사항</td>
                                    <td>0건</td>
                                </tr>
                            </table>
                        </div>
                    </div>
                    <div id="proposal">
                        <div id="proposalText"><a>제안서</a></div>
                        <div id="proposalTable">
                            <table></table>
                            
                        </div>
                    </div>
                    <div id="message">
                        <div id="messageText"><a>접수된 신고</a></div>
                        <div id="messageTable">
                            <table></table>
                        </div>
                    </div>
                </div>
                <div id="dashBoardDiv2" class="dashBoard">
                    <div id="eventDashBoard">
                        <div id="eventThumbnail"><img style="border-radius: 10px 10px 0px 0px;" width="100%" height="100%" src="<%=contextPath %>/resources/img/adminDashboard_img.jpg" alt="이벤트 섬네일"></div>
                        <div id="eventOngoing">
                            <div id="eventOngoingText"><a>진행중인 이벤트</a></div>
                            <div id="eventOngoingTable">
                                <table></table>
                            </div>
                        </div>
                    </div>
                    <div id="noticeDashBoard">
                        <div id="noticeDashBoardText">
                            <a>공지사항 관리</a>
                        </div>
                        <div id="noticeDashBoardTable">
                            <table>

                            </table>
                        </div>
                    </div>
                </div>
                <div id="dashBoardDiv3" class="dashBoard">
                    <div id="todaySuccessPrj">
                        <div id="todaySuccessPrjText">
                            <a>오늘 성사된 프로젝트</a>
                        </div>
                        <div id="todaySuccessPrjTable">

                        </div>
                    </div>
                    <div id="todayStartPrj">
                        <div id="todayStartPrjText"><a>오늘 시작하는 프로젝트</a></div>
                        <div id="todayStartPrjTable">
                            <table></table>
                        </div>
                    </div>
                    <div id="todayReport">
                        <div id="todayReportText">
                            <a>마감임박 이벤트</a>
                        </div>
                        <div id="todayReportTable">
                            <table></table>
                        </div>
                    </div>
                </div>
            </div>

            
        </content>

</body>
</html>