<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>


    #proposalDetailOuter {
        display: flex;
        flex-wrap: wrap;
        flex-direction: row;
        justify-content: center;
        align-items: center;
        width: 1500px;
        height: 2000px;
        margin-left: 50px;
    }

    #proposalDetail {
        height: 1600px;
        display: flex;
        flex-direction: column;
        width: 50%;
        border-radius: 16px;
    }

    #proposalInfo {
        width: 100%;
        height: 20%;
        display: flex;
        flex-direction: column;
    }

    #projectInfo {
        width: 100%;
        height: 20%;
        display: flex;
        flex-direction: column;
    }

    .proposalInfoBar {
        width: 100%;
        height: 50px;
        border: 1px solid #C3B091;
        border-radius: 16px;
        background-color: #F9F5EA;
        font-weight: 700;
        color: black;
        display: flex;
        flex-direction: column;
        justify-content: center;
        padding-left: 30px;
    }

    #proposalInfoBox {
        width: 100%;
        height: 270px;
        display: flex;
        flex-direction: row;
        justify-content: center;
    }

    .proposalInfoBox {
        width: 30%;
        height: 100%;
        display: flex;
        flex-direction: column;
    }

    #projectInfoBox {
        width: 100%;
        height: 270px;
        display: flex;
        flex-direction: row;
        justify-content: center;
    }


    .proposalInfo {
        width: 100%;
        height: 16.66%;
        display: flex;
        justify-content: center;
        align-items: center;
    }

    .projectInfo {
        width: 100%;
        height: 16.66%;
        display: flex;
        justify-content: center;
        align-items: center;
    }

    .justify-right {
        justify-content:flex-end;
        padding-right: 30px;
    }

    .justify-left {
        justify-content:flex-start;
        padding-left: 30px;
    }

    .mediaText {
        width: 100%;
        height: 80px;
        display: flex;
        flex-direction: column;
        justify-content: center;
        align-items: center;
        text-align: center;
    }


    

</style>
</head>
<body>
    
<%@ include file="/WEB-INF/views/common/adminLayout.jsp" %>

<content>
    <div id="proposalDetailOuter">
        <div id="proposalDetail">
            <div id="proposalInfo">
                <div class="proposalInfoBar">1.제안서 정보</div>
                <div id="proposalInfoBox">
                    <div class="proposalInfoBox">
                        <div class="proposalInfo justify-right">제안서 번호 </div>
                        <div class="proposalInfo justify-right">제안 회원</div>
                        <div class="proposalInfo justify-right">프로젝트 카테고리</div>
                        <div class="proposalInfo justify-right">프로젝트 이름</div>
                        <div class="proposalInfo justify-right">접수날짜</div>
                        <div class="proposalInfo justify-right">처리상태</div>
                    </div>
                    <div class="proposalInfoBox">
                        <div class="proposalInfo justify-left">1</div>
                        <div class="proposalInfo justify-left">와디즈</div>
                        <div class="proposalInfo justify-left">뷰티</div>
                        <div class="proposalInfo justify-left">당신이 찾던 그 프로젝트!</div>
                        <div class="proposalInfo justify-left">2022-08-15</div>
                        <div class="proposalInfo justify-left">접수</div>
                    </div>
                </div>
            </div>
            <div id="projectInfo">
                <div class="proposalInfoBar">2.프로젝트 정보</div>
                <div id="projectInfoBox">
                    <div class="proposalInfoBox">
                        <div class="projectInfo justify-right">프로젝트 시작일자 </div>
                        <div class="projectInfo justify-right">프로젝트 마감일자</div>
                        <div class="projectInfo justify-right">프로젝트 목표금액</div>
                        <div class="projectInfo justify-right">상세 설명</div>
                        <div class="projectInfo justify-right">예상되는 어려움</div>
                        <div class="projectInfo justify-right">예상 전달일</div>
                    </div>
                    <div class="proposalInfoBox">
                        <div class="projectInfo justify-left">프로젝트 시작일자 </div>
                        <div class="projectInfo justify-left">프로젝트 마감일자</div>
                        <div class="projectInfo justify-left">프로젝트 목표금액</div>
                        <div class="projectInfo justify-left">상세 설명</div>
                        <div class="projectInfo justify-left">예상되는 어려움</div>
                        <div class="projectInfo justify-left">예상 전달일</div>
                    </div>
                </div>

            </div>
            <div id="projectMedia">
                <div class="proposalInfoBar">3.프로젝트 자료</div>
                <div class="mediaText">대표 이미지</div>
                <div class="mediaBox"></div>
                <div class="mediaText">상세 이미지/영상</div>
                <div class="mediaBox"></div>
            </div>
        </div>
    </div>

</content>

</body>
</html>