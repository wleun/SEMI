<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	#prjManage {
            display: flex;
            flex-direction: row;
            justify-content: center;
            width: 1632px;
            height: 972px;
        }

        #board {
            display: flex;
            flex-direction: column;
            align-self: center;
            width: 90%;
            height: 85%;
        }

        #boardDiv1 {
            width: 100%;
            height: 10%;
            display: flex;
            flex-direction: row;
            align-items: flex-start;
        }

        #boardDiv1_not_used {
            width: 70%;
            height: 100%;
        }


        #boardDiv1_search {
            width: 30%;
            height: 100%;
            display: flex;
            flex-direction: row;
            justify-content: space-evenly;
        }

        #boardDiv1_search * {
            height: 60%;
            font-size: 14px;
            display: flex;
            margin: 5px;
            align-self: center;
            text-align: center;
            border-radius: 16px;
        }
        

        #boardDiv1_search select {
            width: 80px;
        }

        #boardDiv2 {
            width: 100%;
            height: 80%;
            display: flex;
        }

        
        .boardWrap {
            width: 1469px;
            height: 100%;
            display: flex;
            flex-direction: column;
            border: 1px solid #C3B091;
            border-radius: 16px;
        }

        #boardFirstColumn {
            background-color: #F9F5EA;
            border-radius: 16px 16px 0px 0px;
            border-bottom: 1px solid #C3B091;
        }

        .boardColumn {
            width: 100%;
            height: 9%;
            font-size: 18px;
            display: flex;
            flex-direction: row;   
            text-align: center;
            align-items: center;
        }

        .text_align_center {
            text-align: center;
        }

        .check {
            width: 5%;
        }

        .status {
            width: 7%;
        }

        .prjNo {
            width: 5%;
        }

        .category {
            width: 12%;
        }

        .percent {
            width: 7%;
        }

        .prjName {
            width: 22%;
        }

        .makerName {
            width: 15%;
        }

        .period {
            width: 15%;

        }

        .reportCnt {
            width: 6%;
        }

        .deleteYN {
            width: 6%;
        }

        #boardDiv3 {
            width: 100%;
            height: 10%;
            display: flex;
            flex-direction: row;
        }



        #boardDiv3_not_used {
            width: 20%;
            height: 100%;
        }

        #boardDiv3_paging {
            width: 60%;
            height: 100%;
            display: flex;
            text-align: center;
            justify-content: center;
            align-items: center;
            font-size: 18px;
        }
        #boardDiv3_paging>div {
            padding: 10px;
        }

        #boardDiv3_delete {
            width: 20%;
            height: 100%;
            display : flex;
            text-align: center;
            align-items: center;
            flex-direction: row;
            justify-content: flex-end;
            padding-right: 10px;
        }

        #boarderDiv3_delete div {
            border: 1px solid #C3B091;
        }

</style>
</head>
<body>

	<%@ include file="/WEB-INF/views/common/adminLayout.jsp" %>

	<content>
                <div id="prjManage">

                    <div id="board">
                        <div id="boardDiv1">
                            <div id="boardDiv1_not_used"></div>
                            <div id="boardDiv1_search">
                               <form action="">
                                <select name="status" id="searchStatus">
                                    <option value="plan">진행예정</option>
                                    <option value="doing">진행중</option>
                                    <option value="done">종료된</option>
                                    <option value="success">성공한</option>
                                    <option value="deleted">삭제된</option>
                                </select>
    
                                <select name="what" id="searchWhat">
                                    <option value="title">제목</option>
                                    <option value="content">내용</option>
                                    <option value="titleContent">제목+내용</option>
                                    <option value="maker">메이커</option>
                                </select>
    
                                <input type="search" name="search">
                                <input type="IMAGE" src="<%=contextPath %>/resources/img/search_icon_pse.png" name="submit" vlaue="submit">

                               </form>
                            </div>
                        </div>
                        <div id="boardDiv2">
                            <div class="boardWrap">
                                <div id="boardFirstColumn" class="boardColumn">
                                    <div class="check">선택</div>
                                    <div class="status">상태</div>
                                    <div class="prjNo">번호</div>
                                    <div class="category">카테고리</div>
                                    <div class="percent">달성률</div>
                                    <div class="prjName">프로젝트 이름</div>
                                    <div class="makerName">메이커 이름</div>
                                    <div class="period">기간</div>
                                    <div class="reportCnt">신고횟수</div>
                                    <div class="deleteYN">삭제여부</div>
                                </div>
                            
                                <div class="boardColumn">
                                    <div class="check"><input type="checkbox"></div>
                                    <div class="status">진행중</div>
                                    <div class="prjNo">1</div>
                                    <div class="category">테크</div>
                                    <div class="percent">67.7%</div>
                                    <div class="prjName">우리의 삶을 바꿀 그 것!</div>
                                    <div class="makerName">그냥 메이커</div>
                                    <div class="period">2022.08.08~2022.08.09</div>
                                    <div class="reportCnt">0</div>
                                    <div class="deleteYN">N</div>
                                </div>
                                <div class="boardColumn">
                                    <div class="check"><input type="checkbox"></div>
                                    <div class="status">성사됨</div>
                                    <div class="prjNo">2</div>
                                    <div class="category">레저/스포츠</div>
                                    <div class="percent">655%</div>
                                    <div class="prjName">이 텐트 보고가세용</div>
                                    <div class="makerName">텐트 메이커</div>
                                    <div class="period">2022.06.08~2022.07.15</div>
                                    <div class="reportCnt">4</div>
                                    <div class="deleteYN">N</div>
                                </div>
                                <div class="boardColumn">
                                    <div class="check"><input type="checkbox"></div>
                                    <div class="status">펀딩예정</div>
                                    <div class="prjNo">3</div>
                                    <div class="category">뷰티</div>
                                    <div class="percent">0.0%</div>
                                    <div class="prjName">스네일 크림!</div>
                                    <div class="makerName">비오는날엔 스네일</div>
                                    <div class="period">2022.09.03~2022.09.22</div>
                                    <div class="reportCnt">0</div>
                                    <div class="deleteYN">Y</div>
                                </div>
                                <div class="boardColumn">
                                    <div class="check"><input type="checkbox"></div>
                                    <div class="status">진행중</div>
                                    <div class="prjNo">1</div>
                                    <div class="category">테크</div>
                                    <div class="percent">67.7%</div>
                                    <div class="prjName">우리의 삶을 바꿀 그 것!</div>
                                    <div class="makerName">그냥 메이커</div>
                                    <div class="period">2022.08.08~2022.08.09</div>
                                    <div class="reportCnt">0</div>
                                    <div class="deleteYN">N</div>
                                </div>
                                <div class="boardColumn">
                                    <div class="check"><input type="checkbox"></div>
                                    <div class="status">성사됨</div>
                                    <div class="prjNo">2</div>
                                    <div class="category">레저/스포츠</div>
                                    <div class="percent">655%</div>
                                    <div class="prjName">이 텐트 보고가세용</div>
                                    <div class="makerName">텐트 메이커</div>
                                    <div class="period">2022.06.08~2022.07.15</div>
                                    <div class="reportCnt">4</div>
                                    <div class="deleteYN">N</div>
                                </div>
                                <div class="boardColumn">
                                    <div class="check"><input type="checkbox"></div>
                                    <div class="status">펀딩예정</div>
                                    <div class="prjNo">3</div>
                                    <div class="category">뷰티</div>
                                    <div class="percent">0.0%</div>
                                    <div class="prjName">스네일 크림!</div>
                                    <div class="makerName">비오는날엔 스네일</div>
                                    <div class="period">2022.09.03~2022.09.22</div>
                                    <div class="reportCnt">0</div>
                                    <div class="deleteYN">Y</div>
                                </div>
                                <div class="boardColumn">
                                    <div class="check"><input type="checkbox"></div>
                                    <div class="status">진행중</div>
                                    <div class="prjNo">1</div>
                                    <div class="category">테크</div>
                                    <div class="percent">67.7%</div>
                                    <div class="prjName">우리의 삶을 바꿀 그 것!</div>
                                    <div class="makerName">그냥 메이커</div>
                                    <div class="period">2022.08.08~2022.08.09</div>
                                    <div class="reportCnt">0</div>
                                    <div class="deleteYN">N</div>
                                </div>
                                <div class="boardColumn">
                                    <div class="check"><input type="checkbox"></div>
                                    <div class="status">성사됨</div>
                                    <div class="prjNo">2</div>
                                    <div class="category">레저/스포츠</div>
                                    <div class="percent">655%</div>
                                    <div class="prjName">이 텐트 보고가세용</div>
                                    <div class="makerName">텐트 메이커</div>
                                    <div class="period">2022.06.08~2022.07.15</div>
                                    <div class="reportCnt">4</div>
                                    <div class="deleteYN">N</div>
                                </div>
                                <div class="boardColumn">
                                    <div class="check"><input type="checkbox"></div>
                                    <div class="status">펀딩예정</div>
                                    <div class="prjNo">3</div>
                                    <div class="category">뷰티</div>
                                    <div class="percent">0.0%</div>
                                    <div class="prjName">스네일 크림!</div>
                                    <div class="makerName">비오는날엔 스네일</div>
                                    <div class="period">2022.09.03~2022.09.22</div>
                                    <div class="reportCnt">0</div>
                                    <div class="deleteYN">Y</div>
                                </div>
                                <div class="boardColumn">
                                    <div class="check"><input type="checkbox"></div>
                                    <div class="status">진행중</div>
                                    <div class="prjNo">1</div>
                                    <div class="category">테크</div>
                                    <div class="percent">67.7%</div>
                                    <div class="prjName">우리의 삶을 바꿀 그 것!</div>
                                    <div class="makerName">그냥 메이커</div>
                                    <div class="period">2022.08.08~2022.08.09</div>
                                    <div class="reportCnt">0</div>
                                    <div class="deleteYN">N</div>
                                </div>
                                
                                
                                
                                
                            </div>
                        </div>
                        <div id="boardDiv3">
    
                            <div id="boardDiv3_not_used"></div>
                            <div id="boardDiv3_paging">
                                <div>◀</div>
                                <div>1</div>
                                <div>2</div>
                                <div>3</div>
                                <div>4</div>
                                <div>5</div>
                                <div>▶</div>
                            </div>
                            <div id="boardDiv3_delete">
                                <div><input type="submit" value="삭제하기" style="width: 80px; height: 30px; border-radius: 16px; background-color: white;"></div>
                            </div>
    
                        </div>
                    </div>
    
                </div>

            
	</content>
</body>
</html>