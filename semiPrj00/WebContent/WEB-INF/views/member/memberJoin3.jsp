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
            border: 2px solid red;
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
            border: 1px solid red;
            width: 300px; height: 450px;
            margin: 0 auto;
        }
       li{
        list-style-type: none;
        line-height: 28px;
       }
       ul{
        padding: 0;
        margin: 0;
       }
       input{
        margin-bottom: 12px;
       }
       #pre{
        float: left;
       }
       #next{
        float: right;
       }
       span{
        position: relative;
        bottom: 12px;
        font-size: medium;
        color: red;
        font-weight: bold;
       }
       ::placeholder{
        font-size: 12px;
       }
    </style>
</head>
<body>
<%@ include file="/WEB-INF/views/common/userHeader.jsp" %>
    <main>
        <div id="box"></div>
        <div id="join">
            
            <div id="join-h1"><h1>메이커 추가정보 등록</h1><span>일반 회원은 다음버튼을 눌러주세요!</span></div>
           
            <div id="form">
                <form action="" method="post">
                   <ul>
                    <li>사업자번호</li>
                    <li><input type="text" name="busi-no" placeholder="-제외 입력"> <button>중복확인</button></li>
                    <li>메이커 타입</li>
                    <li><select name="busi-type" id="busi-type" >
                            <option value="개인사업자">개인사업자</option>
                            <option value="법인">법인</option>
                        </select>
                    </li>
                    <li>법인명</li>
                    <li><input type="text" name="company" placeholder="법인사업자 필수항목입니다."></li>
                    
                    <li><br> <input type="button" value="이전" id="pre"><input type="submit" value="다음" id="next"></li>
                   </ul>
                    
                </form>
               
            </div>
            
        </div>

    </main>
</body>
</html>