<%@page import="com.kh.reward.vo.ProjectRewardVo"%>
<%@page import="com.kh.project.vo.ProjectVo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	ProjectVo prjVo = (ProjectVo)request.getAttribute("prjVo");
	ProjectRewardVo rewardVo = (ProjectRewardVo)request.getAttribute("rewardVo");
	AddrVo defaultAddr = ((ArrayList<AddrVo>)request.getAttribute("addrList")).get(0);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>200% 후원하기</title>
<style>
    #header-div{
        width: 1920px;
        height: 120px;
    }
    #support-body{
        width: 1920px;
        height: 100%;
        padding-top: 120px;
        padding-left: 192px;
        padding-right: 192px;
        display: flex;
        flex-wrap: wrap;
    }
    #prj-wrap{
        height: 200px;
        width: 100%;
    }
    #prj-img-div{
        background-color: gray;
        height: 200px;
        width: 300px;
        float: left;
        margin-right: 50px;
    }
    #prj-category{
        padding: 30px;
        color: gray;
    }
    #prj-name{
        font-size: 25px;
        font-weight: 900;
    }
    #prj-detail{
        margin-top: 30px;
    }
    #detail-wrap{
        width: auto;
        height: 100%;
    }
    .info{
        margin-top: 50px;
        height: 100%;
        width: 700px;
        margin: 34px;
    }
    .section{
        font-size: 18px;
        padding: 10px;
        font-weight: 900;
    }
    .table-div{
        border: 3px solid #48CA7D;
        border-radius: 10px;
    }
    .title{
        width: 180px;
        padding: 20px;
        font-size: 16px;
        font-weight: 900;
    }
    .content{
        width: 420px;
        padding: 20px;
        font-size: 16px;
    }
    .btn-td{
        padding: 0 0 0 20px;
    }
    .btn-td button{
        background-color: #48CA7D;
        border: 0;
        border-radius: 50px;
    }
    .btn-td button:hover{
    	background-color: #48CA7D;
    	border: 0;
    }
    #name{
        width: 130px;
        padding: 20px;
        font-size: 18px;
        font-weight: 900;
    }
    #addr-2nd-td{
        width: 470px;
    }
    #addr{
        width: 600px;
        padding: 20px;
        font-size: 16px;
    }
    #radio-btn:checked{
        background-color: #48CA7D;
        border: 0;
    }
    #card-name{
        width: 100px;
        padding: 20px;
        font-size: 16px;
    }
    #card-num{
        width: 455px;
        padding: 20px;
        font-size: 16px;
    }
    #final-wrap{
        width: auto;
        height: 100%;
    }
    #final-sum-title{
        color: #48CA7D;
    }
    #sum-div{
        margin-top: 45px;
    }
    #final-sum{
        width: 500px;
        text-align: right;
        padding-right: 30px;
    }
    .final-div{
        width: 700px;
        padding: 20px;
    }
    input:checked{
        background-color: #48CA7D !important;
        border: 0;
    }
    #warning-div li{
        margin: 10px;
    }
    .green-theme{
        color: #48CA7D;
    }
    #support-btn{
        background-color: #48CA7D;
        border: 0;
        width: 670px;
        border-radius: 50px;
    }
    .margin-left-30{
        margin-left: 30px;
    }
</style>
</head>
<body>

    <div id="header-div">
        <%@ include file="/WEB-INF/views/common/userHeader.jsp" %>
    </div>

    <div id="support-body">
        <div id="prj-wrap">
            <div id="prj-img-div">
                <img src="<%=prjVo.getThumbnailPath()%>" alt="<%=prjVo.getThumbnailName()%>" id="prj-img">
            </div>
            <div id="prj-description">
                <div id="prj-category"><%=prjVo.getCategoryNo()%></div>
                <div id="prj-name"><%=prjVo.getName()%></div>
                <div id="prj-detail">
                    <span>달성률</span> | <span>모인 금액</span> | <span id="d-day">남은 날짜</span>
                    <script>
                    	//남은 날짜
				    	var endDateStr = "<%=prjVo.getEndDate()%>";
				    	var date = new Date();
				    	var endDate = new Date(endDateStr);
				    	var differenceMsec = endDate.getTime() - date.getTime();
				    	var differenceDay = differenceMsec/1000/60/60/24;
				    	$("#d-day").text(Math.floor(differenceDay) + "일 남음");
                    </script>
                </div>
            </div>
        </div>
        <div id="detail-wrap">
            <div id="reward-info" class="info">
                <div class="section">선물 정보</div>
                <div class="table-div">
                    <table>
                        <tr>
                            <td class="title">선물 구성</td>
                            <td class="content"><%=rewardVo.getOption()%> <%=rewardVo.getDetail()%></td>
                            <td rowspan="3" class="btn-td"><button class="btn btn-success" id="change-reward">변경</button></td>
                        </tr>
                        <tr>
                            <td class="title">선물 금액</td>
                            <td class="content"><%=rewardVo.getPrice()%>원</td>
                        </tr>
                        <tr>
                            <td class="title">예상 전달일</td>
                            <td class="content"><%=prjVo.getShippingDate().substring(0, 11)%></td>
                        </tr>
                    </table>
                </div>
            </div>
            <div id="supporter-info" class="info">
                <div class="section">후원자 정보</div>
                <div class="table-div">
                    <table>
                        <tr>
                            <td class="title">연락처</td>
                            <td class="content"><%=loginMember.getPhone()%></td>
                        </tr>
                        <tr>
                            <td class="title">이메일</td>
                            <td class="content"><%=loginMember.getEmail()%></td>
                        </tr>
                        <tr>
                            <td colspan="2" class="content notice">
                                *위 연락처와 이메일로 후원 관련 소식이 전달됩니다. <br>
                                *연락처 및 이메일 변경은 설정>계정 설정에서 가능합니다.
                            </td>
                        </tr>
                    </table>
                </div>
            </div>
            <div id="address" class="info">
                <div class="section">배송지</div>
                <div class="table-div">
                    <table>
                        <tr>
                            <td id="name"><%=defaultAddr.getName()%></td>
                            <td id="addr-2nd-td"><div id="addr-default" class="btn btn-sm btn-danger disabled opacity-0">기본</div></td>
                            <td rowspan="3" class="btn-td"><button id="change-addr" class="btn btn-success" data-bs-toggle="modal" data-bs-target="#addr-select">변경</button></td>
                        </tr>
                        <tr>
                            <td colspan="3" id="addr"><%=defaultAddr.getAddr1()%> <%=defaultAddr.getAddr2()%></td>
                        </tr>
                        <tr>
                            <td colspan="3" class="content" id="phone"><%=defaultAddr.getPhone()%></td>
                        </tr>
                    </table>
                </div>
            </div>
            <div id="coupon" class="info">
                <div class="section">쿠폰</div>
                <div class="table-div">
                    <table>
                        <tr>
                            <td class="title">쿠폰 선택</td>
                            <td class="content">사용 <span id="using-coupon">0</span>개/보유 <span id="having-coupon">0</span>개</td>
                            <td class="btn-td"><button class="btn btn-success" data-bs-toggle="modal" data-bs-target="#coupon-select">사용</button></td>
                        </tr>
                    </table>
                </div>
            </div>
            <div id="payment" class="info">
                <div class="section">결제수단</div>
                <div class="table-div">
                    <table>
                        <tr>
                            <td colspan="3" class="title">
                                <input type="radio" id="radio-btn" class="form-check-input" checked>
                                <label for="radio-btn">카드</label>
                            </td>
                            <td rowspan="2" class="btn-td"><button class="btn btn-success" id="change-card" data-bs-toggle="modal" data-bs-target="#payment-select">변경</button></td>
                        </tr>
                        <tr>
                            <td id="card-name"></td>
                            <td><div id="card-default" class="btn btn-sm btn-danger disabled opacity-0">기본</div></td>
                            <td id="card-num">************1234</td>
                        </tr>
                    </table>
                </div>
            </div>
        </div>
       <div id="final-wrap" class="info">
            <div id="sum-div" class="final-div">
                <div class="table-div">
                    <table>
                        <tr>
                            <td class="title" id="final-sum-title">최종 후원 금액</td>
                            <td><div id="final-sum">50,000원</div></td>
                        </tr>
                    </table>
                </div>
            </div>
            <div id="check-div" class="final-div">
                프로젝트 성공시, 결제는
                <span class="green-theme" id="pay-date">
                	<script>
                    	var today = new Date();
                    	var payDate = new Date(today.setDate(today.getDate() + 7));
                    	var month = payDate.getMonth() + 1
                        if(month < 10){
                            month = "0" + month;
                        }
                    	var payDateStr = payDate.getFullYear() + "-" + month + "-" + payDate.getDate();
                    	$("#pay-date").text(payDateStr);
                    </script>
                </span>
                에 진행됩니다. 프로젝트가 무산되거나 중단된 경우, 예약된 결제는 자동으로 취소됩니다.
            </div>
            <div id="checkbox-div" class="final-div">
                <div class="form-check">
                    <table>
                        <tr>
                            <td>
                                <input class="form-check-input" type="checkbox" name="agree">
                                <label class="form-check-label">개인정보 제 3자 제공 동의</label>
                            </td>
                            <td><a href="" class="margin-left-30">내용보기</a></td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                <input class="form-check-input" type="checkbox" name="agree">
                                <label class="form-check-label">후원 유의사항 확인</label>
                            </td>
                        </tr>
                    </table>
                </div>  
            </div>
            <div id="warning-div" class="final-div">
                <ul>
                    <li>
                        <span class="green-theme">후원은 구매가 아닌 창의적인 계획에 자금을 지원하는 일입니다.</span>
                        <br>
                        200%에서의 후원은 아직 실현되지 않은 프로젝트가 실현될 수 있도록 제작비를 후원하는 과정으로,
                        기존의 상품 또는 용역을 거래의 대상으로 하는 매매와는 차이가 있습니다.
                        따라서 전자상거래법상 청약철회 등의 규정이 적용되지 않습니다.
                    </li>
                    <li>
                        <span class="green-theme">프로젝트는 계획과 달리 진행될 수 있습니다.</span>
                        <br>
                        예상을 뛰어넘는 멋진 결과가 나올 수 있지만 진행 과정에서 계획이 지연,
                        변경되거나 무산될 수도 있습니다. 본 프로젝트를 완수할 책임과 권리는 창작자에게 있습니다.
                    </li>
                </ul>
            </div>
            <div id="support-btn-div" class="final-div">
                <button type="submit" formmethod="post" class="btn btn-success final-div" id="support-btn">후원하기</button>
            </div>
       </div>
       <%@ include file="/WEB-INF/views/project/paymentSelectForm.jsp" %>
       <%@ include file="/WEB-INF/views/project/couponSelectForm.jsp" %>
       <%@ include file="/WEB-INF/views/project/deliveryAddrSelectForm.jsp" %>
    </div>

    <script>
        $(function(){
            $("#card-modal-submit-btn").click(function(){
                $("#card-num").text($(".card-modal-radio:checked").val());	
            });
            if($(".card-modal-radio:checked").parent().parent().children().eq(1).children().first().hasClass("opacity-0") === false){
                $("#card-default").removeClass("opacity-0");
            }

            //주소 바꾸기
            $("#addr-modal-submit-btn").click(function(){
                $("#addr").text($(".addr-modal-radio:checked").val());	
            });
            //이름 바꾸기
            $("#addr-modal-submit-btn").click(function(){
                $("#name").text($(".addr-modal-radio:checked").parent().parent().children().first().text());	
            });
            //전화번호 바꾸기
            $("#addr-modal-submit-btn").click(function(){
                $("#phone").text($(".addr-modal-radio:checked").next().val());	
            });
            
            //기본버튼 처음부터 보일지 말지
            if($(".addr-modal-radio:checked").parent().parent().children().eq(1).children().first().hasClass("opacity-0") === false){
                $("#addr-default").removeClass("opacity-0");
            }
        });

        //카드 기본버튼 보일지 말지
        $("#card-modal-submit-btn").click(function(){
            if($(".card-modal-radio:checked").parent().parent().children().eq(1).children().first().hasClass("opacity-0")){
                $("#card-default").addClass("opacity-0");
            }else{
                $("#card-default").removeClass("opacity-0");
            }
        });

        //주소 기본버튼 보일지 말지
        $("#addr-modal-submit-btn").click(function(){
            if($(".addr-modal-radio:checked").parent().parent().children().eq(1).children().first().hasClass("opacity-0")){
                $("#addr-default").addClass("opacity-0");
            }else{
                $("#addr-default").removeClass("opacity-0");
            }
        });

        $("#change-reward").click(function(){
            location.href='<%=contextPath%>/project/view#reward-option';
        });

        $("#having-coupon").text($("input:checkbox[name='coupon']").length);
        $("#coupon-modal-submit-btn").click(function(){
            $("#using-coupon").text($("input:checkbox[name='coupon']:checked").length);	
        });
        
    </script>
</body>



</html>