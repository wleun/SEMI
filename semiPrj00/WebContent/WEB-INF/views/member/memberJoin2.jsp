<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

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
            width: 500px; height: 630px;
            margin: 0 auto;
            font-size: 20px;
            background-color: rgba(255, 255, 255, 0.675);
            margin-top: 20px;
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
        width: 60px;
        float: left;
        border: 0px solid gray ;
        border-radius: 50px;
        background-color: #48CA7D;
        margin-left: 5px;
        color: white;
        font-size: 18px;
       }
       #next{
        width: 60px;
        float: right;
        border: 0px solid gray ;
        border-radius: 50px;
        background-color: #48CA7D;
        margin-right: 5px;
        color: white;
        font-size: 18px;
       }
       ::placeholder{
        font-size: 15px;
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
  
        margin-left: 75px;
        margin-bottom: -50px;
        /* left: 80px;
        bottom: -27px; */
      }
      .modal-div{
        display: none;
      }
	
		#checked{
		font-size: 15px;
		}
      @import url("//fonts.googleapis.com/earlyaccess/nanumgothic.css" );
    input[type=password]{
	font-family:"Nanum Gothic", sans-serif !important;
        }
    </style>
</head>
<body>
<%@ include file="/WEB-INF/views/common/userHeader.jsp" %>
		
	
    <main>
        <div id="box"></div>
        <div id="join">
            <div class="img-join">
                <img src="<%=contextPath%>/resources/img/join2.png" alt="" class="img-join">
            </div>
            <div id="join-h1"><h1>?????? ?????? ??????</h1></div>
           
            <div id="form">
                <form action="<%=contextPath%>/member/join2" method="post">
                   <ul id="form-ul">
                    <br>
                    <li class="join-li">*E-mail <br>
                    <input type="email" name="memberEmail" id="email" placeholder="??????????????? ????????????." required readonly>
                     <button id="check-btn" onclick="emailCheck()">????????????</button></li>
                    <li class="join-li">
                        *???????????? <br><input type="password" name="memberPwd" id="pwd" required>
                        <div id="pwd-size" style="color: red; font-size:15px; position: absolute;">4?????? ?????? ???????????????.</div>
                    </li>
                    <li class="join-li" >
                        *???????????? ??????<br><input type="password" name="memberPwd2" id="pwd2" required>
                        <div id="danger" style="color: red; font-size:15px; position: absolute;">??????????????? ????????????????????????.</div><div id="success" style="color: #48CA7D; font-size:15px; position: absolute;">??????????????? ???????????????!</div>
                    </li>
                    <li class="join-li">*?????? (?????? : ?????????)<br><input type="text" name="memberName" required></li>
                    <li class="join-li">*?????????<br><input type="text" id="id" name="memberNick" required onfocusout="test();"> <br><span id="checked"></span> </li>
                    <li class="join-li">*?????????<br><input type="text" name="memberPhone" required placeholder="-?????? ??????"></li>
                    <li class="join-li">
                    ????????????<br><input type="text" name="code" id="code">
                    	<div id="danger1" style="color: red; font-size:15px; position: absolute;">?????????????????? ?????????????????????.</div><div id="success1" style="color: #48CA7D; font-size:15px; position: absolute;">??????????????? ?????????????????????!</div>
                    </li>
                    
                   
                   
                   </ul>
                   <br><input type="button" value="??????" id="pre" onclick="history.go(-1)"><input type="submit" value="??????" id="next">
                </form>
               
            </div>
            
        </div>

    </main>
    <!-- ???????????? ?????? ?????? -->
    <script>
    $(function(){
        $("#success1").hide();
        $("#danger1").hide();
        $("#code").blur(function(){
            var code=$('#code').val();
            
            if(code == "???????????? ?????????"){
            	$('#danger1').hide();
                $("#success1").show();
            }else{
            	if(code == ''){
            		//???????????? ??????
            		$('#code').value=null;
                	$("#success1").hide();
                    $('#danger1').hide();
            	}else{
            		//????????? ?????? ?????????
            		$('#code').value=null;
                	$("#success1").hide();
                    $('#danger1').show();
            	}
            }
            
            
            
        })

    })
    </script>
    <!-- ????????? ???????????? -->
    <script>
    	function emailCheck(){
    		var openWin = window.open("<%=contextPath %>/member/emailCheck","none","width=200px, heignt=150px,resizable = no, scrollbars = no");
    	}
    	function setChildValue(email){
    		document.getElementById("email").value=email;
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
    <script>
    
        $(function(){
            $("#success").hide();
            $("#danger").hide();
            $("input").keyup(function(){
                var pwd=$('#pwd').val();
                var pwd2=$('#pwd2').val();
                if(pwd != "" && pwd2 != ""){
                    if(pwd != pwd2){
                        $("#success").hide();
                        $('#danger').show();
                        $('#next').attr("disabled","disabled");
                    }else{
                        $('#danger').hide();
                        $("#success").show();
                        $('#next').removeAttr("disabled");
                    }
                }
                if(pwd.length < 4){
                    $("#pwd-size").show();
                }else{
                    $("#pwd-size").hide();
                }
            })

        })

    </script>

</body>
	
</html>