<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
                <h1>메이커 추가정보 등록</h1><span>일반 회원은 다음버튼을 눌러주세요!</span></div>
           
            <div id="form">
                <form action="" method="post">
                   <ul id="form-ul">
                    <li class="join-li">사업자번호<br><input type="text" name="busi-no" placeholder="-제외 입력"> <button id="check-btn">중복확인</button></li>
                    <li class="join-li">메이커 타입<br>
                            <select name="busi-type" id="busi-type" >
                            <option value="개인사업자">개인사업자</option>
                            <option value="법인">법인</option>
                        </select>
                    </li>
                    <li class="join-li">법인명 <br><input type="text" name="company" placeholder="법인일 경우 필수항목입니다."></li>
                    
                   </ul><br>
                   <input type="button" value="이전" id="pre" onclick="history.go(-1)"><input type="submit" value="다음" id="next">

                </form>
               
            </div>
            
        </div>

    </main>
</body>
</html>