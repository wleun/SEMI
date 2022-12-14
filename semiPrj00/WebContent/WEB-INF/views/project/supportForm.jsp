<%@page import="com.kh.reward.vo.ProjectRewardVo"%>
<%@page import="com.kh.project.vo.ProjectVo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	ProjectVo prjVo = (ProjectVo)request.getAttribute("prjVo");
	ProjectRewardVo rewardVo = (ProjectRewardVo)request.getAttribute("rewardVo");
	
	ArrayList<AddrVo> addrList_ = (ArrayList<AddrVo>)request.getAttribute("addrList");
	ArrayList<PaymentVo> paymentList_ = (ArrayList<PaymentVo>)request.getAttribute("paymentList");
	AddrVo defaultAddr  = new AddrVo();
	PaymentVo defaultPayment  = new PaymentVo();
	if(addrList_.size()!=0){
		defaultAddr = addrList_.get(0);
	}else{
		defaultAddr.setName("");
		defaultAddr.setAddr1("");
		defaultAddr.setAddr2("");
		defaultAddr.setPhone("");
	}
	if(paymentList_.size()!=0){
		defaultPayment = paymentList_.get(0);
	}else{
		defaultPayment.setCardNum("");
	}
	
	String quantity = (String)request.getAttribute("quantity");
	String add = (String)request.getAttribute("add");
	int totalDonation = (int)request.getAttribute("totalDonation");
	long percent = (long)request.getAttribute("percent");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>200% νμνκΈ°</title>
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
    #final-sum-div{
        width: 500px;
        text-align: right;
        padding-right: 30px;
    }
    #final-sum{
    	font-size: 23px;
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
                <img src="<%=contextPath%>/resources/upload/<%=prjVo.getThumbnailName()%>" alt="<%=prjVo.getThumbnailName()%>" id="prj-img">
            </div>
            <div id="prj-description">
                <div id="prj-category"><%=prjVo.getCategoryNo()%></div>
                <div id="prj-name"><%=prjVo.getName()%></div>
                <div id="prj-detail">
                    <span>λ¬μ©λ₯  <%=percent%> %</span> | <span>λͺ¨μΈ κΈμ‘ <%=totalDonation%> μ</span> | <span id="d-day">λ¨μ λ μ§</span>
                    <script>
                    	//λ¨μ λ μ§
				    	var endDateStr = "<%=prjVo.getEndDate()%>";
				    	var date = new Date();
				    	var endDate = new Date(endDateStr);
				    	var differenceMsec = endDate.getTime() - date.getTime();
				    	var differenceDay = differenceMsec/1000/60/60/24;
				    	$("#d-day").text(Math.floor(differenceDay) + "μΌ λ¨μ");
                    </script>
                </div>
            </div>
        </div>
        <div id="detail-wrap">
            <div id="reward-info" class="info">
                <div class="section">μ λ¬Ό μ λ³΄</div>
                <div class="table-div">
                    <table>
                        <tr>
                            <td class="title">μ λ¬Ό κ΅¬μ±</td>
                            <td class="content"><%=rewardVo.getOption()%> | <%=rewardVo.getDetail()%> | <%=quantity%>κ°</td>
                            <td rowspan="3" class="btn-td"><button class="btn btn-success" id="change-reward">λ³κ²½</button></td>
                        </tr>
                        <tr>
                            <td class="title">μ λ¬Ό κΈμ‘</td>
                            <td class="content"><%=rewardVo.getPrice()%>μ</td>
                        </tr>
                        <tr>
                            <td class="title">μμ μ λ¬μΌ</td>
                            <td class="content"><%=prjVo.getShippingDate().substring(0, 11)%></td>
                        </tr>
                    </table>
                </div>
            </div>
            <div id="supporter-info" class="info">
                <div class="section">νμμ μ λ³΄</div>
                <div class="table-div">
                    <table>
                        <tr>
                            <td class="title">μ°λ½μ²</td>
                            <td class="content"><%=loginMember.getPhone()%></td>
                        </tr>
                        <tr>
                            <td class="title">μ΄λ©μΌ</td>
                            <td class="content"><%=loginMember.getEmail()%></td>
                        </tr>
                        <tr>
                            <td colspan="2" class="content notice">
                                *μ μ°λ½μ²μ μ΄λ©μΌλ‘ νμ κ΄λ ¨ μμμ΄ μ λ¬λ©λλ€. <br>
                                *μ°λ½μ² λ° μ΄λ©μΌ λ³κ²½μ μ€μ >κ³μ  μ€μ μμ κ°λ₯ν©λλ€.
                            </td>
                        </tr>
                    </table>
                </div>
            </div>
            <div id="address" class="info">
                <div class="section">λ°°μ‘μ§</div>
                <div class="table-div">
                    <table>
                        <tr>
                            <td id="name"><%=defaultAddr.getName()%></td>
                            <td id="addr-2nd-td"><div id="addr-default" class="btn btn-sm btn-danger disabled opacity-0">κΈ°λ³Έ</div></td>
                            <td rowspan="3" class="btn-td"><button id="change-addr" class="btn btn-success" data-bs-toggle="modal" data-bs-target="#addr-select">λ³κ²½</button></td>
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
                <div class="section">μΏ ν°</div>
                <%@ include file="/WEB-INF/views/project/couponSelectForm.jsp" %>
                <div class="table-div">
                    <table>
                        <tr>
                            <td class="title">μΏ ν° μ ν</td>
                            <td class="content">μ¬μ© <span id="using-coupon">0</span>κ°/λ³΄μ  <span id="having-coupon">0</span>κ°</td>
                            <td class="btn-td"><button class="btn btn-success" id="coupon-select-btn" data-bs-toggle="modal" data-bs-target="#coupon-select">μ¬μ©</button></td>
                        </tr>
                    </table>
                </div>
            </div>
            <div id="payment" class="info">
                <div class="section">κ²°μ μλ¨</div>
                <div class="table-div">
                    <table>
                        <tr>
                            <td colspan="3" class="title">
                                <input type="radio" id="radio-btn" class="form-check-input" checked>
                                <label for="radio-btn">μΉ΄λ</label>
                            </td>
                            <td rowspan="2" class="btn-td"><button class="btn btn-success" id="change-card" data-bs-toggle="modal" data-bs-target="#payment-select">λ³κ²½</button></td>
                        </tr>
                        <tr>
                            <td id="card-name"></td>
                            <td><div id="card-default" class="btn btn-sm btn-danger disabled opacity-0">κΈ°λ³Έ</div></td>
                            <td id="card-num">************<%=defaultPayment.getCardNum()%></td>
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
                            <td class="title">λ¦¬μλ κΈμ‘</td>
                            <td><div><span id="reward-sum">0</span> μ</div></td>
                        </tr>
                    	<tr>
                            <td class="title">μΆκ° νμ κΈμ‘</td>
                            <td><div><span id="add-sum"><%=add%></span> μ</div></td>
                        </tr>
                        <tr>
                            <td class="title" id="final-sum-title">μ΅μ’ νμ κΈμ‘</td>
                            <td><div id="final-sum-div"><span id="final-sum" class="green-theme">0</span> μ</div></td>
                            <script>
                            	//λ¦¬μλ κΈμ‘
                            	var price = Number(<%=rewardVo.getPrice()%>)*Number(<%=quantity%>);
                            	
                            	//μΏ ν° ν μΈκΈμ‘
                            	var sale = 0;
                            	
	                          	//sum(μ΅μ’νμκΈμ‘)
	                          	$("#reward-sum").text(price);
	                            var addSum = $("#add-sum").text();
	                            var sum = Number(price) + Number(addSum);
	                            $("#final-sum").text(sum);
	                            
	                            //μΏ ν°μ μ©μ μ΅μ’νμκΈμ‘
	                            $("#coupon-select-btn").click(function(){
	                            	if($("input[name=coupon]:checked").length >0){//μ΄λ―Έ μ²΄ν¬λ μΏ ν°μ΄ μμλ
		                            	var saled = 0;
		                            	for(var i=0; i<($("input[name=coupon]:checked").length); i++){
	                                   		saled += Number($("input[name=coupon]:checked").eq(i).val());
	                                   	}
		                            	console.log(saled);
		                            	var nonSaled = 0;
		                            	nonSaled = Number($("#reward-sum").text()) + saled;//μΏ ν° μ μ©κΈμ‘ λ³΅κ΅¬
		                            	$("#coupon-modal-submit-btn").click(function(){
		                            		console.log("nonSaled ::: " + nonSaled);
		                            		$("#reward-sum").text(nonSaled);
		                            		sale = 0;
		                            		for(var i=0; i<($("input[name=coupon]:checked").length); i++){
	                                       		sale += Number($("input[name=coupon]:checked").eq(i).val());
	                                       	}
		                            		var rewardSum = nonSaled - sale;
		                            		console.log("rewardSum:::" + rewardSum);
		                            		$("#reward-sum").text(rewardSum);
		                            		
		                            		//sum(μ΅μ’νμκΈμ‘)
	           	                            var addSum = $("#add-sum").text();
	           	                            var sum = Number(rewardSum) + Number(addSum);
	           	                            $("#final-sum").text(sum);
		                            	});
	                           		}else{//μ²΄ν¬λ μΏ ν°μ΄ μμλ
	                           			$("#coupon-modal-submit-btn").click(function(){
	                           				sale = 0;
	                                   		for(var i=0; i<($("input[name=coupon]:checked").length); i++){
	                                       		sale += Number($("input[name=coupon]:checked").eq(i).val());
	                                       	}
	                                       	var rewardSum = price - sale;
	                                       	$("#reward-sum").text(rewardSum);
	                                       
	           	                          	//sum(μ΅μ’νμκΈμ‘)
	           	                            var addSum = $("#add-sum").text();
	           	                            var sum = Number(rewardSum) + Number(addSum);
	           	                            $("#final-sum").text(sum);
	                                   	});
	                           		}
	                            });
                            </script>
                        </tr>
                    </table>
                </div>
            </div>
            <div id="check-div" class="final-div">
                νλ‘μ νΈ μ±κ³΅μ, κ²°μ λ
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
                μ μ§νλ©λλ€. νλ‘μ νΈκ° λ¬΄μ°λκ±°λ μ€λ¨λ κ²½μ°, μμ½λ κ²°μ λ μλμΌλ‘ μ·¨μλ©λλ€.
            </div>
            <div id="checkbox-div" class="final-div">
                <div class="form-check">
                    <table>
                        <tr>
                            <td>
                                <input class="form-check-input agree-box" type="checkbox" name="agree">
                                <label class="form-check-label">κ°μΈμ λ³΄ μ  3μ μ κ³΅ λμ</label>
                            </td>
                            <td><a href="" class="margin-left-30">λ΄μ©λ³΄κΈ°</a></td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                <input class="form-check-input agree-box" type="checkbox" name="agree">
                                <label class="form-check-label">νμ μ μμ¬ν­ νμΈ</label>
                            </td>
                        </tr>
                    </table>
                </div>  
            </div>
            <div id="warning-div" class="final-div">
                <ul>
                    <li>
                        <span class="green-theme">νμμ κ΅¬λ§€κ° μλ μ°½μμ μΈ κ³νμ μκΈμ μ§μνλ μΌμλλ€.</span>
                        <br>
                        200%μμμ νμμ μμ§ μ€νλμ§ μμ νλ‘μ νΈκ° μ€νλ  μ μλλ‘ μ μλΉλ₯Ό νμνλ κ³Όμ μΌλ‘,
                        κΈ°μ‘΄μ μν λλ μ©μ­μ κ±°λμ λμμΌλ‘ νλ λ§€λ§€μλ μ°¨μ΄κ° μμ΅λλ€.
                        λ°λΌμ μ μμκ±°λλ²μ μ²­μ½μ² ν λ±μ κ·μ μ΄ μ μ©λμ§ μμ΅λλ€.
                    </li>
                    <li>
                        <span class="green-theme">νλ‘μ νΈλ κ³νκ³Ό λ¬λ¦¬ μ§νλ  μ μμ΅λλ€.</span>
                        <br>
                        μμμ λ°μ΄λλ λ©μ§ κ²°κ³Όκ° λμ¬ μ μμ§λ§ μ§ν κ³Όμ μμ κ³νμ΄ μ§μ°,
                        λ³κ²½λκ±°λ λ¬΄μ°λ  μλ μμ΅λλ€. λ³Έ νλ‘μ νΈλ₯Ό μμν  μ±μκ³Ό κΆλ¦¬λ μ°½μμμκ² μμ΅λλ€.
                    </li>
                </ul>
            </div>
            <div id="support-btn-div" class="final-div">
            	<form action="<%=contextPath%>/project/support" method="post">
            		<input type="hidden" value=<%=prjVo.getPrjectNo()%> name="num">
            		<input type="hidden" value=<%=rewardVo.getNo()%> name="rewardNo">
            		<input type="hidden" value=<%=loginMember.getNo()%> name="memberNo">
            		<input type="hidden" id="hidden-addrNo" name="addrNo">
            		<input type="hidden" id="hidden-cardNo" name="cardNo">
            		<input type="hidden" value=<%=quantity%> name="quantity">
            		<input type="hidden" id="sum" name="sum">
            		<input type="hidden" id="donate-date" name="donateDate">
            		<input type="hidden" name="additional" value=<%=add%>>
            		<input type="hidden" name="sale" id="sale">
	                <button type="submit" class="btn btn-success final-div" id="support-btn" disabled>νμνκΈ°</button>
            		<script>
	                	$("#support-btn").click(function(){
	                    	//ν΄λ¦­μ νλ  μΈν λ²¨λ₯ λ£κΈ°
	                        $("#sum").val(sum);
	                        
	                        //donateDate(νμλ μ§)
	                        $("#donate-date").val(payDateStr);
	                        
	                        //addrNo(λ°°μ‘μ§)
	                        $("#hidden-addrNo").val($("#addr-no").val());
	                        
	                        //cardNo(μΉ΄λ)
	                        $("#hidden-cardNo").val($("#card-no").val());
	                        
	                        //μΏ ν° νμκΈμ‘
	                        $("#sale").val(sale);
	                    });
            		</script>
            	</form>
            
            </div>
       </div>
       <%@ include file="/WEB-INF/views/project/paymentSelectForm.jsp" %>
       
       <%@ include file="/WEB-INF/views/project/deliveryAddrSelectForm.jsp" %>
    </div>

    <script>
    	console.log(<%=prjVo.getPrjectNo()%>);
        $(function(){
        	//μΉ΄λλͺ¨λ¬μμ μ λ³΄ λΆλ¬μ€κΈ°
            $("#card-modal-submit-btn").click(function(){
                $("#card-num").text($(".card-modal-radio:checked").val());	
            });
            if($(".card-modal-radio:checked").parent().parent().children().eq(1).children().first().hasClass("opacity-0") === false){
                $("#card-default").removeClass("opacity-0");
            }

            //μ£Όμ λ°κΎΈκΈ°
            $("#addr-modal-submit-btn").click(function(){
                $("#addr").text($(".addr-modal-radio:checked").val());	
            });
            //μ΄λ¦ λ°κΎΈκΈ°
            $("#addr-modal-submit-btn").click(function(){
                $("#name").text($(".addr-modal-radio:checked").parent().parent().children().first().text());	
            });
            //μ νλ²νΈ λ°κΎΈκΈ°
            $("#addr-modal-submit-btn").click(function(){
                $("#phone").text($(".addr-modal-radio:checked").next().val());	
            });
            
            //κΈ°λ³Έλ²νΌ μ²μλΆν° λ³΄μΌμ§ λ§μ§
            if($(".addr-modal-radio:checked").parent().parent().children().eq(1).children().first().hasClass("opacity-0") === false){
                $("#addr-default").removeClass("opacity-0");
            }
        });

        //μΉ΄λ κΈ°λ³Έλ²νΌ λ³΄μΌμ§ λ§μ§
        $("#card-modal-submit-btn").click(function(){
            if($(".card-modal-radio:checked").parent().parent().children().eq(1).children().first().hasClass("opacity-0")){
                $("#card-default").addClass("opacity-0");
            }else{
                $("#card-default").removeClass("opacity-0");
            }
        });

        //μ£Όμ κΈ°λ³Έλ²νΌ λ³΄μΌμ§ λ§μ§
        $("#addr-modal-submit-btn").click(function(){
            if($(".addr-modal-radio:checked").parent().parent().children().eq(1).children().first().hasClass("opacity-0")){
                $("#addr-default").addClass("opacity-0");
            }else{
                $("#addr-default").removeClass("opacity-0");
            }
        });

        //λ¦¬μλ λ³κ²½λ²νΌ λλ μ λ μΈλΆνμ΄μ§μ λ¦¬μλ μ ν λΆλΆμΌλ‘ λμ΄κ°κΈ°
        $("#change-reward").click(function(){
            location.href='<%=contextPath%>/project/view?num=<%=request.getParameter("pnum")%>#reward-option';
        });

        //μ¬μ©λ μΏ ν°&&κ°μ§κ³  μλ μΏ ν° μ μΈκΈ°
        $("#having-coupon").text($("input:checkbox[name='coupon']").length);
        $("#coupon-modal-submit-btn").click(function(){
            $("#using-coupon").text($("input:checkbox[name='coupon']:checked").length);	
        });
        
        //λμ μ²΄ν¬ν΄μΌ νμκ°λ₯
        $(".agree-box").click(function(){
            if($(".agree-box:checked").length == $(".agree-box").length){
            	$("#support-btn").prop("disabled", false);
        	}
        });
    </script>
</body>



</html>