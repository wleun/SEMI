<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%MemberVo memberVo = (MemberVo)request.getSession().getAttribute("memberVo");%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 <style>
        #box{height: 150px;width: 1920px;}
        #join{
            /* border: 2px solid blue; */
            width: 700px;
            height: 800px;
            margin: 0 auto;
        }
        #join-h1{
            text-align: center;
        }
       #content{
        border: 1px solid black;
        width: 500px;
        height: 200px;
        overflow: scroll;
        margin: 0 auto;
       }
       #check{
        position: relative;
        text-align: center;
        bottom: -10px;
        }
        #form{
            /* border: 1px solid red; */
            width: 500px; height: 370px;
            margin: 0 auto;
            font-size: 20px;
            padding-top: 20px;
            background-color: rgba(255, 255, 255, 0.675);
            border-radius: 10px;
        }
        .join-li{
        list-style-type: none;
        line-height: 28px;
        margin-bottom: 20px;
    
       }
       #form-ul{
        padding: 0px;
        padding-left: 120px;
       }
       input{
        width: 250px;
        background-color: white;
       }
       #pre{
        float: left;
        border: 1px solid gray ;
        border-radius: 8px;
        background-color: #48CA7D;
       }
       #next{
        float: right;
        border: 1px solid gray ;
        border-radius: 8px;
        background-color: #48CA7D;
       }
       span{
        position: relative;
        bottom: 12px;
        font-size: 22px;
        color: red;
        
       }
       ::placeholder{
        font-size: 15px;
       }
       #pre{
        border: 0px;
        width: 60px;
        float: left;
        margin-left: 5px;
        border-radius: 50px;
        color: white;
       }
       #next{
        margin-right: 5px;
        border: 0px;
        width: 60px;
        float: right;
        border-radius: 50px;
        color: white;
       }
       #check-btn{
        width: 80px;
        border: 1px solid lightgray;
        font-size: medium;
        border-radius: 50px;
        }
      .img-join{
        width: 70px;
        height: 70px;
        margin-left: 155px;
        margin-bottom: 10px;
      }
    </style>
</head>
<body>
<%@ include file="/WEB-INF/views/common/userHeader.jsp" %>
		
    <main>
        <div id="box"></div>
        <div id="join">
            
            <div id="join-h1">
                <br>
                <div class="img-join">
                    <img src="<%=contextPath%>/resources/img/join3.png" alt="" class="img-join">
                </div>
                <h1>????????? ???????????? ??????</h1><span>[????????????]??? ??????????????? ?????? ????????? ??????????????????!</span></div>
           
            <div id="form">
                <form action="<%=contextPath%>/member/join3" method="post">
                   <ul id="form-ul">
                    <li class="join-li">???????????????<br>
                    	<input type="text" id="busino" name="busi-no" placeholder="-?????? 10?????? ??????" onfocusout="test2();"> 
                    	<br><br><span id="checked2" style="font-size:20px;"></span>
                    </li>
                    <li class="join-li">????????? ??????<br><br>
                        <input type="radio" name="busi-type" id="busi-type" value="I" style="width: 30px;">??????????????? 
                        <input type="radio" name="busi-type" id="busi-type" value="B" style="width: 30px;">??????
                    </li>
                    

                    <li class="join-li">????????? ????????? <br><input type="text" id="id" name="company" placeholder="????????? ?????? ????????????????????????." onfocusout="test();"> 
                    <br><br><span id="checked" style="font-size:20px;"></span></li>
                    
                   </ul><br>
                   <input type="button" value="??????" id="pre" onclick="history.go(-1)"><input type="submit" value="??????" id="next">

                </form>
               
            </div>
            
        </div>

    </main>
   
</body>
 <script>
  		function test2(){
  			const temp = $('#busino').val();
  			
  			console.log(temp);
  			$.ajax({
  				url : "<%=contextPath %>/busiCheck",
  				type : "POST",
  				data : {busino : temp},
  				dataType : 'text',
  				success : function(result){
  					if(result == 0){
  						document.getElementById('checked2').innerHTML = "?????? ????????? ??????????????? ?????????.";
  						document.getElementById('checked2').style.color = "#48CA7D";
  						
  					}else{
  						document.getElementById('checked2').innerHTML = "?????? ????????? ??????????????? ?????????.";
  						document.getElementById('checked2').style.color = "red";
  						
  						$('#next').attr("disabled","disabled");
  					}
  				},
  				error : function(){
  					alert("??????????????????..");
  				}
  			
  			})
  			
  		}
  	</script>
  	 <script>
  		function test(){
  			const temp = $('#id').val();
  			
  			console.log(temp);
  			$.ajax({
  				url : "<%=contextPath %>/idCheck",
  				type : "POST",
  				data : {userId : temp},
  				dataType : 'text',
  				success : function(result){
  					if(result == 0){
  						document.getElementById('checked').innerHTML = "??????????????? ??????????????????.";
  						document.getElementById('checked').style.color = "#48CA7D";
  						$('#next').removeAttr("disabled");
  					}else{
  						document.getElementById('checked').innerHTML = "?????? ?????? ?????? ??????????????????.";
  						document.getElementById('checked').style.color = "red";
  						
  						$('#next').attr("disabled","disabled");
  					}
  				},
  				error : function(){
  					alert("??????????????????..");
  				}
  			
  			})
  			
  		}
  	</script>
  	
</html>