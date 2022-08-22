<%@page import="com.kh.admin.login.vo.AdminVo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fm" uri="http://java.sun.com/jsp/jstl/fmt" %>
    
<%
    AdminVo loginAdmin = (AdminVo)session.getAttribute("loginAdmin");
	String contextPath = request.getContextPath();

	String alertMsg = (String)session.getAttribute("alertMsg");
	session.removeAttribute("alertMsg");
    String errorMsg = (String)session.getAttribute("errorMsg");
    session.removeAttribute("errorMsg");

%>


<!DOCTYPE html>
<html>
<head>
<!-- Latest compiled and minified CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">

<!-- Latest compiled JavaScript -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

<meta charset="UTF-8">
<title>Insert title here</title>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<style>
	@font-face {
            font-family: 'twayair';
            src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_tway@1.0/twayair.woff') format('woff');
            font-weight: normal;
            font-style: normal;
        }

        * {
            box-sizing: border-box;
            font-family: 'twayair';
        }

        a {
            text-decoration: none;
            color : inherit;
        }

        a:hover {
            color : #48CA7D;

        }
        
        h1 {
        	font-family: 'twayair';
        }

        button {
            background-color: #48CA7D;
            border: 1px solid #C3B091;
            border-radius: 50px;
            color: white;
            width: 80px;
            height: 40px;
        }

        input[type=submit] {
            border-radius: 50px;
            background-color: #48CA7D;
            color: white;
        }

        input[type=search] {
            border-radius: 50px;
            border : 1px solid #C3B091;
        }

        input[type=text] {
            border-radius: 50px;
            border : 1px solid #C3B091;
        }

        select {
            border-radius: 50px;
            border: 1px solid #C3B091;
        }


        .button {
            background-color: #48CA7D;
            border: 1px solid #C3B091;
            border-radius: 50px;
            color: white;
        }
        
        .animationHover:hover {
        	transform:scale(1.2);
        	transition:1s;
        }

        textarea {
            resize: none;
        }

        input:checked{
        background-color: #48CA7D !important;
        border: 0;
        }

        input[type=date] {
            border : 1px solid #C3B091 !important;
            border-radius: 50px !important; 
            text-align: center !important;
        }

        #pageWrap {
            width: 1920px;
            height: 1080px;
            display: flex;
            flex-wrap: wrap;
            flex-direction: row;
            z-index: 80;
        }

        header {
            width : 1918px;
            height : 108px;
            position: fixed;
            display: flex;
            flex-direction: row;
            border-top:  1px solid #C3B091;
            border-right:  1px solid #C3B091;
            background-color: white;
            z-index: 90;
        }

        #headerNotUsed {
            width: 15%;
            height: 108px;
        }

        
        #headerUsed {
            width: 84%;
            height: 108px;
            display: flex;
            flex-direction: row;
        }

        #headerFirst {
            width: 92%;
            align-self: center;
            font-weight:700;
            font-size: 33px;
            padding: 50px;
        }

        #headerSecond {
            width: 8%;
            display: flex;
            align-items: center;
            justify-content:center;
            flex-wrap: wrap;
        }
        

        nav {
            width : 288px;
            height : 1073px;
            border : 1px solid #C3B091;
            position: fixed;
            background-color: #F9F5EA;
            display: flex;
            flex-direction: column;
            z-index: 100;
        }

       

        #navFirst {
            width: 288px;
            height: 108px;
            display: flex;
        }

        #navFirst table {
            margin-left: 46px;
            font-family: 'twayair';
            font-size: 20px;
            font-weight: bold;
            text-shadow: 1.5px 1.5px 1.5px #443731;
        }

        #navFirst a {
            color: #C3B091;
        }

        #navFirst table img {
            filter: drop-shadow(1px 1px 1px #000)
        }

        #coreWrap {
            width: 288px;
            height: 150px;
            padding: 0px;
            margin: 0px auto;

            display: flex;
            justify-content: center;
            flex-wrap: wrap;
            text-align: center;
            align-items: center;
            
            color: #C3B091;
            font-size: 16px;
            font-weight: bolder;
            font-family: 'twayair';
            

            flex-direction: column;
        }

        #managementWrap {
            width: 288px;
            height: 500px;
            padding: 0px;

            display: flex;
            justify-content: center;
            flex-wrap: wrap;
            text-align: center;
            align-items:flex-start;
            
            color: #C3B091;
            font-size: 16px;
            font-weight: bolder;
            font-family: 'twayair';


        }

        .navSecond {
            width: 288px;
        }

        #core {
            font-size: 22px;
            font-weight: bold;
        }

        #navSecond table td {
            
            padding: 3px;
        }

        .menegeAlign {
            text-align: left;
        }

        /*main*/

        content {
            position: absolute;
            width: 1630px;
            left: 288px;
            top: 108px;
            border-right: 1px solid #C3B091;
        }
</style>
</head>
<body>

<div id="pageWrap">
        <header>

            <div id="headerNotUsed"></div>
            <div id="headerUsed">

                <div id="headerFirst">
                	${functionName}
                </div>
                <div id="headerSecond">
                    <a href=""><img width="60px" heigh="60px" src="<%=contextPath %>/resources/img/adminMypageIcon.png" alt="마이페이지 아이콘"></a>
                </div>

            </div>

        </header>
        <nav>
            <div id="navFirst">
                <table>
                    <tr>
                        <td rowspan="2"><a href="<%=contextPath%>/admin/main"><img src="<%=contextPath %>/resources/img/200perlogo_pse.png" alt="로고" width="120px" height="54x"></a></td>
                        <td height="23px"></td>
                    </tr>
                    <tr>
                        <td><a href="<%=contextPath%>/admin/main">ADMIN</a></td>
                    </tr>
                </table>
            </div>
            <div id="navSecond">

                <div id="coreWrap" class="navSecond">

                    <table>
                        <tr>
                            <td id="core">CORE</td>
                            <td></td>
                            <td width="85px"></td>
                        </tr>
                        <tr>
                            <td height="10px"></td>
                            <td></td>
                            <td></td>
                        </tr>
                        <tr>
                            <td><a href="<%=contextPath%>/admin/main?p=1"><img src="<%=contextPath %>/resources/img/adminDashboard.png" alt="대시보드 아이콘" width="40px" height="40px"></a></td>
                            <td><a href="<%=contextPath%>/admin/main?p=1">대시보드</a></td>
                            <td></td>
                        </tr>
                    </table>
                    

                </div>
                <div id="managementWrap" class="navSecond">
                    <table>
                        <thead>
                            <tr>
                                <td id="core" colspan="2">MANAGEMENT</td>
    
                                <td width="56px"></td>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td height="15px"></td>
                                <td></td>
                                <td></td>
                            </tr>
                            <tr>
                                <td><a href="<%=contextPath%>/admin/project?p=1"><img src="<%=contextPath %>/resources/img/adminPrj_icon.png" alt="프로젝트 아이콘" width="35px" height="34px"></a></td>
                                <td class="menegeAlign"><a href="<%=contextPath%>/admin/project?p=1">프로젝트</a></td>
                                <td></td>
                            </tr>

                            <!---->
                            
                            <tr>
                                <td height="10px"></td>
                                <td></td>
                                <td></td>
                            </tr>
                            <tr>
                                <td><a href="<%=contextPath%>/admin/proposal?p=1"><img src="<%=contextPath %>/resources/img/adminProposal_icon.png" alt="제안서 아이콘" width="33px" height="36px"></a></td>
                                <td class="menegeAlign"><a href="<%=contextPath%>/admin/proposal?p=1">제안서</a></td>
                                <td></td>
                            </tr>
    
                            <!---->
                            
                            <tr>
                                <td height="10px"></td>
                                <td></td>
                                <td></td>
                            </tr>
                            <tr>
                                <td><a href="<%=contextPath%>/admin/event?p=1"><img src="<%=contextPath %>/resources/img/adminEvent_icon.png" alt="이벤트 아이콘" width="33px" height="33px"></a></td>
                                <td class="menegeAlign"><a href="<%=contextPath%>/admin/event?p=1">이벤트</a></td>
                                <td></td>
                            </tr>
    
                            <!---->
    
                            <tr>
                                <td height="10px"></td>
                                <td></td>
                                <td></td>
                            </tr>
                            <tr>
                                <td><a href="<%=contextPath%>/admin/notice?p=1"><img src="<%=contextPath %>/resources/img/adminNotice_icon.png" alt="공지사항 아이콘" width="32px" height="32px"></a></td>
                                <td class="menegeAlign"><a href="<%=contextPath%>/admin/notice?p=1">공지사항</a></td>
                                <td></td>
                            </tr>
    
                            <!---->
    
                            <tr>
                                <td height="10px"></td>
                                <td></td>
                                <td></td>
                            </tr>
                            <tr>
                                <td><a href="<%=contextPath%>/admin/memberManage?p=1"><img src="<%=contextPath %>/resources/img/adminMember_icon.png" alt="회원 아이콘" width="35px" height="35px"></a></td>
                                <td class="menegeAlign"><a href="<%=contextPath%>/admin/memberManage?p=1">회원관리</a></td>
                                <td></td>
                            </tr>
    
                             <!---->
    
                             <tr>
                                <td height="10px"></td>
                                <td></td>
                                <td></td>
                            </tr>
                            <tr>
                                <td><a href="<%=contextPath%>/admin/report?p=1"><img src="<%=contextPath %>/resources/img/adminReport_icon.png" alt="신고 아이콘" width="35px" height="30px"></a></td>
                                <td class="menegeAlign"><a href="<%=contextPath%>/admin/report?p=1">신고관리</a></td>
                                <td></td>
                            </tr>
                        </tbody>
                    </table>
                </div>
                <div id="appsWrap" class="navSecond">

                </div>
            </div>

        </nav>
    </div>

	<script>
	    $(function(){ 
	        <%if(alertMsg!=null){%>
    			alert('<%=alertMsg%>');
    		<%}%>
	       
            <%if(errorMsg!=null){%>
                alert('<%=errorMsg%>');
            <%}%>
	    });
    </script>

    

</body>
</html>