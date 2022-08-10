<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>200% 프로젝트 오픈 신청</title>


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

		#form .form-control{
        	width: 300px;
        	margin : 0 auto;
        }
        
        input[type="number"]::-webkit-outer-spin-button,
        input[type="number"]::-webkit-inner-spin-button {
            -webkit-appearance: none;
            margin: 0;
        }

        #rewardNum{
            margin-left: 200px;
        }

        #rewardList{
            border: 2px solid black;
            width: 600px;
            height: 300px;
            margin: 0 auto;
        }

        .webEnd{
            text-align: center;
            margin-top: 150px;
            margin-bottom: 25px;
        }

        .webEnd *{
            margin: 0 50px;
        }
        
        #btn {
        	background-Color:  #48CA7D; 
        }
        #rewardList{
        	width: 700px;
        	border : 1px solid gray;
        	background-color: white; 
         
        }
        .board{
        	padding:0;
        	margin:0;
        	
        }
        #rewardList>ul li {
	        list-style:none;
	        display:inline;
	        float: left;
	        font-size: smaller;
	        line-height: 30px; 
	        box-sizing: border-box;
	        height: 30px;
        }
        .option {
        	width: 30%; 
        }
        .detail {
        	width: 40%; 
        }
        .price, .quantity {
        	width: 15%; 
        }
        .list-header{
        	font-size: medium;
      		border-bottom: 1px solid gray;
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
            <div id="title" class="rounded-pill">
                3. 리워드 추가하기</div>
            <table>
                <tr>
                    <td>리워드 금액*</td>
                    <td>
                        <input type="number" class="form-control" name="price" min="1000" value="0" style="display: inline;" required> 원
                    </td>
                </tr>
                <tr>
                    <td>리워드 수*</td>
                    <td>
                        <label><input type="radio" name="quantity" id="quantity" value="rewardY" checked>제한
                            있음</label>
                        <label><input type="radio" name="quantity" id="quantity" value="rewardN">제한 없음</label>
                    </td>
                </tr>
                <tr>
                    <td></td>
                    <td>
                        <input type="number" class="form-control" name="quantity" id="rewardNum" min="1" value="0"
                            placeholder="이 리워드의 수를 입력해주세요." style="display: inline;"  required> 개
                    </td>
                </tr>
                <tr>
                    <td>리워드 옵션명*</td>
                    <td><input type="text" class="form-control" name="option" id="option" placeholder="옵션명을 입력해주세요." required></td>
                </tr>
                <tr>
                    <td>리워드 옵션 설명*</td>
                    <td><textarea class="form-control" name="detail" cols="30" rows="5" style="resize: none;"
                            placeholder="해당 리워드의 설명을 입력해주세요." required></textarea></td>
                </tr>
                <tr>
                    <td colspan="2">
                    	<div id="rewardList">
                    		<ul class="board">
                    			<li class="option list-header">옵션명</li>
                    			<li class="detail list-header">설명</li>
                    			<li class="price list-header">금액</li>
                    			<li class="quantity list-header">제공수량</li>
                    		</ul>
                    		<!--리스트 추가 -->
                    		<%//for(int i=0; //i<; i++){ %>
                    		<ul class="board">
                    			<li class="option"></li>
                    			<li class="detail"></li>
                    			<li class="price"></li>
                    			<li class="quantity"></li>
                    		</ul>
                    		<%//} %>
                    		
	                    	
                    	</div>
                    </td>
                </tr>
            </table>
            
            

            <div class="webEnd">
                <button type="submit" style="background-color:#48CA7D;" class="btn text-white" id="btn">추가하기</button>
               
                <button type="button" style="background-color:#48CA7D;" class="btn text-white"
                    id="btn">신청완료하기</button>
            </div>
        </form>
    </main>
    
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

    <script>
        //제한 있음 선택 시 리워드 수 입력칸 활성화
        $(function () {
            $('input[type="radio"][id="quantity"]').on('click', function () {
                let checkVal = $('input[type=radio][id="quantity"]:checked').val();
                if (checkVal == "rewardY") {
                    $('#rewardNum').attr("disabled", false); //활성화
                } else {
                    $('#rewardNum').attr("disabled", true);  //비활성화
                    $('#rewardNum').val("0"); //비활성화 시 값 초기화
                }
            });
        });
    </script>

</body>
</html>