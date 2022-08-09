<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>


 <style>

        body{
            width: 1920px;
        }
        
        #blank{
            width : 100%;
            height: 300px;
        }
        
        #topSide{
            margin: 0 auto;
            width: 65%;
            height: 150px;
            
        }
        #topSide *{
            font-weight: 600;
            margin-left: 200px;
        }
        main{
            margin: 0 auto;
            width: 70%;
        }
        main table{
            margin: 0 auto;
            width: 700px;
        }
        #title{
            margin: 100px 300px;
            font-weight: 600;
            height: 40px;
            line-height: 40px;
            padding-left: 20px; 
            background-color: #48CA7D; 
            color: white;
        }
        table td{
            text-align: center;
            padding: 25px; 
        } 
        #dateCalc{
            font-size: x-large;
            font-weight: 800;
        }
        #dateInfo{
            text-align: center;
            font-size: larger;
            margin-bottom: 100px;
        }
        #form .form-control{
        	width: 300px;
        	margin : 0 auto;
        	 box-shadow: none;
        }
        #form input[type="date"] {
            width: 200px;
        }
        input[type="number"]::-webkit-outer-spin-button, input[type="number"]::-webkit-inner-spin-button {
            -webkit-appearance: none;
            margin: 0;
        }
        .info{
            font-size:x-small;
            color: gray;
            padding-top: 0px;
            padding-left: 210px;
        }
        #btn {
        	background-Color:  #48CA7D; 
        }
    </style>
</head>
<body>

	<%@ include file="/WEB-INF/views/common/userHeader.jsp" %>
	<div id="blank"></div>

    <div id="topSide">
            <h4>프로젝트 시작하기</h4> 
            <h5>당신의 멋진 아이디어를 보여주세요!</h5>
    </div>
    
    <main id="form">
        <form action="" method="post">
            <div id="title" class="rounded-pill">1. 기본정보</div>
            <table>
                <tr>
                    <td>프로젝트 카테고리*</td>
                    <td>
                        <select class="form-select form-control" name="prjCategory" required>
                            <option>푸드</option>
                            <option>홈, 리빙</option>
                            <option>모빌리티</option>
                            <option>테크, 가전</option>
                            <option>패션, 잡화</option>
                            <option>반려동물</option>
                            <option>도서, 출판</option>
                            <option>여행, 레저</option>
                            <option>클래스</option>
                            <option>뷰티</option>
                            <option>스포츠</option>
                            <option>식테크</option>
                          </select>
                    </td>
                </tr>
                <tr>
                    <td>프로젝트 제목*</td>
                    <td>
                        <input type="text" class="form-control" name="prjTitle" placeholder="제목을 입력해주세요." required>
                    </td>
                </tr>
                <tr>
                    <td>프로젝트 시작일자*</td>
                    <td>
                        <input type="date" class="form-control" name="startDate" id="startDate" onchange=dateCalc() max="2022-12-31" required>
                    </td>
                </tr>
                <tr>
                    <td>프로젝트 마감일자*</td>
                    <td>
                        <input type="date" class="form-control" name="end-date" id="endDate" onchange=dateCalc() max="2022-12-31" required>
                    </td>
                </tr>
                <tr>
                    <td colspan="2"><div id="dateInfo">이 프로젝트는 <span id="dateCalcResult">0</span>일 동안 진행됩니다.</div></td>
                </tr>
                <tr>
                    <td>프로젝트 목표금액*</td>
                    <td>
                        <input type="number" class="form-control" name="prjAmount" id="prjAmount" value="0" style="display: inline;" onchange=amountCalc() required> 원
                    </td>
                </tr>
                <tr>
                    <td colspan="2" class="info"><div >펀딩 성공 시 예상 수령액 <span id="priceCalcResult">0</span>원 (플랫폼 수수료 5%)</div></td>
                </tr>
               
                <tr>
                    <td>대표이미지*</td>
                    <td>
                        <input type="file" class="form-control" id="File" name="thumbnail" accept="image/*" required>
                    </td>
                </tr>
                <tr>
                    <td colspan="2" class="info"><div>대표이미지는 1개만 업로드해주세요.</div></td>
                </tr>
                <tr>
                    <td>상세 이미지/영상*</td>
                    <td>
                        <input type="file" class="form-control" id="file" name="prjFile" accept="image/*, video/mp4,video/mkv, video/x-m4v,video/*" multiple required>
                    </td>
                </tr>
                <tr>
                    <td>상세 설명*</td>
                    <td>
                        <textarea class="form-control" name="prjText" cols="40" rows="10" style="resize: none;" placeholder="이 프로젝트의 정보를 입력해주세요." required></textarea>
                    </td>
                </tr>
                <tr>
                    <td>예상되는 어려움</td>
                    <td>
                        <textarea class="form-control" name="etc" cols="40" rows="10" style="resize: none;" placeholder="펀딩 진행 및 배송 과정에서 예상되는 어려움을 입력해주세요."></textarea>
                    </td>
                </tr>
                <tr>
                    <td>예상 전달일</td>
                    <td>
                        결제 종료일로부터 <input style="width: 50px; display:inline;" class="form-control" type="number" id="shippingDate" name="shippingDate" min="0" value="0" required> 일 뒤
                    </td>
                </tr>
                <tr>
                    <td colspan="2" class="info"><div>배송 시작일 <span id="shippingCalcResult"></span></div></td>
                </tr>
            </table>
 
            <div id="title" class="rounded-pill">2. 창작자 정보</div>
            <table>
                <tr>
                    <td>메이커 정보</td>
                    <td>
                        <textarea class="form-control" name="makerInfo" id="makerInfo" cols="30" rows="5" style="resize: none;" placeholder="메이커님의 간단한 소개를 입력해주세요."></textarea>
                    </td>
                </tr>
                <tr>
                    <td>후원 계좌*</td>
                    <td>
                        <input class="form-control" type="number" name="accountNo"  placeholder="계좌번호를 입력해주세요.('-' 제외)" required>
                    </td>
                </tr>
                <tr>
                    <td>은행명*</td>
                    <td>
                        <input class="form-control" type="text" name="accountBank" id="accountBank" placeholder="은행명을 입력해주세요." required>
                    </td>
                </tr>
                <tr>
                    <td>예금주*</td>
                    <td>
                        <input class="form-control" type="text" name="accountName" id="accountName" placeholder="예금주를 입력해주세요." required>
                    </td>
                </tr>
                <tr>
                    <td colspan="2" style="padding-top: 150px;"><button type="submit" onclick="location.href='/'" class="btn text-white" id="btn">다음으로</button></td>
                </tr>     
            </table>
        </form>
    </main>
	
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

    <script>
        

        // 오늘 날짜 
        function getToday(){
            var date = new Date();
            var year = date.getFullYear();
            var month = ("0" + (1 + date.getMonth())).slice(-2);
            var day = ("0" + date.getDate()).slice(-2);
            return year + "-" + month + "-" + day;
        }

        // 내일 날짜 
        function getTomorrow(startDay){
            var temp = new Date(startDay);
            var date = new Date(temp.setDate(temp.getDate()+1));
            var year = date.getFullYear();
            var month = ("0" + (1 + date.getMonth())).slice(-2);
            var day = ("0" + date.getDate()).slice(-2);
            return year + "-" + month + "-" + day;
        }

        const today = getToday();

        

        // 진행날짜 구하는 함수
        function dateCalc(){

            let startDay = new Date(document.querySelector('#startDate').value);
            let endDay = new Date(document.querySelector('#endDate').value);
            
            //시작일이 종료일 보다 크면
            if(startDay.getTime() >= endDay.getTime()){
            alert("마감날짜는 시작날짜 이후로 설정해주세요");
            document.getElementById('endDate').value = getTomorrow(startDay);
            dateCalc();

            //시작일이 오늘보다 이전이면
           }else if(document.querySelector('#startDate').value < today){
            alert("시작날짜는 오늘날짜 이후로 설정해주세요");
            document.querySelector('#startDate').value = today;
            dateCalc();

            //모든 조건 통과 시 진행날짜 계산
           }else{
            let passedTime = endDay.getTime() - startDay.getTime();
            passedTime = Math.round(passedTime/(1000*60*60*24));
                //NaN 방지 
                if(isNaN(passedTime)){
                    passedTime = 0;
                }
            document.querySelector('#dateCalcResult').innerHTML = passedTime;
            
           }
              
        }
        //수수료를 뺀 정산
        function amountCalc(){
            let amount = document.getElementById("prjAmount").value;
            let priceCalc = amount - (amount/100*5);
            document.getElementById("priceCalcResult").innerHTML = priceCalc;
        }


        //선물 전달일 (배송일)계산
        $(function shippingDateCalc(){
            $('#shippingDate').on('change', function(){
                let shippingDate = parseInt($('#shippingDate').val());
                let date = new Date($('#endDate').val());
                date = new Date(date.setDate(date.getDate()+7+shippingDate));
                var year = date.getFullYear();
                var month = ("0" + (1 + date.getMonth())).slice(-2);
                var day = ("0" + date.getDate()).slice(-2);
                if($.isNumeric(year)){
               		$('#shippingCalcResult').html(year + "-" + month + "-" + day);
                }else{
                	$('#shippingCalcResult').html("");        	
                }
            });
        });
        
       

    </script>

</body>
</html>