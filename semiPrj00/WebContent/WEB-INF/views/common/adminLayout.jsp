<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String contextPath = request.getContextPath();
	String functionName = (String) request.getAttribute("functionName");

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
        
        h1 {
        	font-family: 'twayair';
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
            border-top:  1px solid black;
            border-right:  1px solid black;
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
            width: 81.7%;
            align-self: center;
            padding: 50px;
        }

        #headerSecond {
            width: 18.3%;
            display: flex;
            align-items: center;
            justify-content:space-evenly;
            flex-wrap: wrap;
        }
        

        nav {
            width : 288px;
            height : 1073px;
            border : 1px solid black;
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
            width: 1632px;
            height: 973px;
            left: 294px;
            top: 108px;
            border-right: 1px solid black;
            border-bottom: 1px solid black;

        }
</style>
</head>
<body>

<div id="pageWrap">
        <header>

            <div id="headerNotUsed"></div>
            <div id="headerUsed">

                <div id="headerFirst">
                    <h1><%=functionName %></h1>
                </div>
                <div id="headerSecond">
                    <a href=""><img width="40px" height="40px" src="<%=contextPath %>/resources/img/search_icon_pse.png" alt="검색 아이콘"></a>
                    <a href=""><img width="35px" height="35px" src="<%=contextPath %>/resources/img/message_icon.png" alt="대화 아이콘"></a>
                    <a href=""><img width="36px" heigh="36px" src="<%=contextPath %>/resources/img/bell_icon.png" alt="알림 아이콘"></a>
                    <a href=""><img width="41px" heigh="41px" src="<%=contextPath %>/resources/img/adminMypage_icon.png" alt="마이페이지 아이콘"></a>
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
                            <td><a href="<%=contextPath%>/admin/main"><img src="<%=contextPath %>/resources/img/adminDashboard.png" alt="대시보드 아이콘" width="40px" height="40px"></a></td>
                            <td><a href="<%=contextPath%>/admin/main">대시보드</a></td>
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
                                <td><a href="<%=contextPath%>/admin/prj"><img src="<%=contextPath %>/resources/img/adminPrj_icon.png" alt="프로젝트 아이콘" width="35px" height="34px"></a></td>
                                <td class="menegeAlign"><a href="<%=contextPath%>/admin/prj">프로젝트</a></td>
                                <td></td>
                            </tr>

                            <!---->
                            
                            <tr>
                                <td height="10px"></td>
                                <td></td>
                                <td></td>
                            </tr>
                            <tr>
                                <td><a href="<%=contextPath%>/admin/proposal"><img src="<%=contextPath %>/resources/img/adminProposal_icon.png" alt="제안서 아이콘" width="33px" height="36px"></a></td>
                                <td class="menegeAlign"><a href="<%=contextPath%>/admin/proposal">제안서</a></td>
                                <td></td>
                            </tr>
    
                            <!---->
                            
                            <tr>
                                <td height="10px"></td>
                                <td></td>
                                <td></td>
                            </tr>
                            <tr>
                                <td><a href="<%=contextPath%>/admin/event"><img src="<%=contextPath %>/resources/img/adminEvent_icon.png" alt="이벤트 아이콘" width="33px" height="33px"></a></td>
                                <td class="menegeAlign"><a href="<%=contextPath%>/admin/event">이벤트</a></td>
                                <td></td>
                            </tr>
    
                            <!---->
    
                            <tr>
                                <td height="10px"></td>
                                <td></td>
                                <td></td>
                            </tr>
                            <tr>
                                <td><a href="<%=contextPath%>/admin/notice"><img src="<%=contextPath %>/resources/img/adminNotice_icon.png" alt="공지사항 아이콘" width="32px" height="32px"></a></td>
                                <td class="menegeAlign"><a href="<%=contextPath%>/admin/notice">공지사항</a></td>
                                <td></td>
                            </tr>
    
                            <!---->
    
                            <tr>
                                <td height="10px"></td>
                                <td></td>
                                <td></td>
                            </tr>
                            <tr>
                                <td><a href="<%=contextPath%>/admin/memberManage"><img src="<%=contextPath %>/resources/img/adminMember_icon.png" alt="회원 아이콘" width="35px" height="35px"></a></td>
                                <td class="menegeAlign"><a href="<%=contextPath%>/admin/memberManage">회원관리</a></td>
                                <td></td>
                            </tr>
    
                             <!---->
    
                             <tr>
                                <td height="10px"></td>
                                <td></td>
                                <td></td>
                            </tr>
                            <tr>
                                <td><a href="<%=contextPath%>/admin/report"><img src="<%=contextPath %>/resources/img/adminReport_icon.png" alt="신고 아이콘" width="35px" height="30px"></a></td>
                                <td class="menegeAlign"><a href="<%=contextPath%>/admin/report">신고관리</a></td>
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
</script>   

</body>
</html>