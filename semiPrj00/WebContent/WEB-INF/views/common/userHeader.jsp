<%@page import="com.kh.member.vo.MemberVo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%

	String alertMsg = (String)session.getAttribute("alertMsg");
	session.removeAttribute("alertMsg");
    String errorMsg = (String)session.getAttribute("errorMsg");
    session.removeAttribute("errorMsg");
	
	String contextPath = request.getContextPath();
	MemberVo loginMember = (MemberVo)session.getAttribute("loginMember");
	
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
<title>header</title>
<link rel="stylesheet" href="<%=contextPath%>/resources/css/common.css">
<style>
        #wrap-div{
            /* border: 1px solid black; */
            position: fixed;
            height: 120px;
            width: 1920px;
            background-color: white;
            z-index: 999;
        }
        header{
            width: 100%;
            height: 100%;
        }
        #img-div{
            /* border: 1px solid red; */
            width: 200px;
            height: 100%;
            float: left;
        }
        #img-div>button{
            border: 0px;
            padding: 0px;
        }
        img{
            width: 100%;
            height: 100%;
        }
        #category-div{
            /* background-color: skyblue; */
            width: 600px;
            height: 100%;
            float: left;
        }
        #category-div ul{
            list-style: none;
            margin-top: 10px;
        }
        .nav-link{
            padding: 0;
            font-size: 25px;
            font-weight: 900;
            color: black;
        }
        .nav-link:hover{
            color: #48CA7D;
        }
        .dropdown-item{
            font-size: 20px;
            font-weight: 900;
            padding: 10px 30px;
        }
        .dropdown-menu{
            background-color: white;
        }
        #etc{
            /* border: 1px solid green; */
            width: 400px;
            height: 100%;
            float: right;
            align-content: space-around;
            margin-top: 10px;
        }
        #btn-div{
            display: flex;
            height: 50%;
            justify-content: space-evenly;
        }
        #btn-div button{
            margin-top: 10px;
            border-radius: 50px;
            background-color: #48CA7D;
            border: 0px
        }
        #serch-btn{
            margin-right : 10px;
        }
        #search-div>input{
            border: 0px;
        }
        #search-icon{
            height: 25px;
        }
    </style>
</head>
<body>
    <div id="wrap-div">
        <header>
            <div id="img-div">
                <button class="btn" onclick="location.href='<%=contextPath%>'">
                    <img src="<%=contextPath%>/resources/img/200perlogo_.png" alt="200% logo" id="logo">
                </button>
            </div>
            <div id="category-div" class="navbar navbar-light">
                <ul>
                    <li class="nav-item dropdown">
                        <a id="category-dropdown" class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown">????????????</a>
                        <ul class="dropdown-menu">
                            <table>
                                <tr>
                                    <td><a class="dropdown-item" href="<%=contextPath%>/project/category?category=1&sort=all">??????</a></td>
                                    <td><a class="dropdown-item" href="<%=contextPath%>/project/category?category=2&sort=all">???, ??????</a></td>
                                    <td><a class="dropdown-item" href="<%=contextPath%>/project/category?category=4&sort=all">??????, ??????</a></td>
                                    <td><a class="dropdown-item" href="<%=contextPath%>/project/category?category=7&sort=all">??????, ??????</a></td>
                                </tr>
                                <tr>
                                    <td><a class="dropdown-item" href="<%=contextPath%>/project/category?category=10&sort=all">??????</a></td>
                                    <td><a class="dropdown-item" href="<%=contextPath%>/project/category?category=5&sort=all">??????, ??????</a></td>
                                    <td><a class="dropdown-item" href="<%=contextPath%>/project/category?category=8&sort=all">??????, ??????</a></td>
                                    <td><a class="dropdown-item" href="<%=contextPath%>/project/category?category=11&sort=all">?????????</a></td>
                                </tr>
                                <tr>
                                    <td><a class="dropdown-item" href="<%=contextPath%>/project/category?category=3&sort=all">????????????</a></td>
                                    <td><a class="dropdown-item" href="<%=contextPath%>/project/category?category=6&sort=all">????????????</a></td>
                                    <td><a class="dropdown-item" href="<%=contextPath%>/project/category?category=9&sort=all">?????????</a></td>
                                    <td><a class="dropdown-item" href="<%=contextPath%>/project/category?category=12&sort=all">?????????</a></td>
                                </tr>
                            </table>
                        </ul>
                    </li>
                </ul>
                <ul>
                    <li><a class="nav-link" href="<%=contextPath%>/project/category?category=21&sort=ongoing">??????</a></li>
                </ul>
                <ul>
                    <li><a class="nav-link" href="<%=contextPath%>/project/category?sort=intended">????????????</a></li>
                </ul>
                <ul>
                    <li><a class="nav-link" href="<%=contextPath%>/project/category?category=22&sort=ongoing">??????</a></li>
                </ul>
                <ul>
                    <li><a class="nav-link" href="<%=contextPath%>/project/category?category=23&sort=ongoing">????????????</a></li>
                </ul>
            </div>
            <div id="etc">
                <div id="btn-div">
                    <div id="upload-prj-div"><button class="btn btn-success" id="prj" onclick="location.href='<%=contextPath%>/project/open'">???????????? ?????? ??????</button></div>
                    <div id="member-div">
                    <%if(loginMember == null){ %>
                    <button class="btn btn-success" id="member" onclick="location.href='<%=contextPath%>/member/login'">?????????/????????????</button>
                	<%}else{%>
                	<button class="btn btn-success" id="member" onclick="location.href='<%=contextPath%>/member/mypage'">???????????????</button>
                	<button class="btn btn-success" id="member" onclick="location.href='<%=contextPath%>/member/logout'">????????????</button>
                	<% }%>
                	</div>
                </div>
                <form action="<%=contextPath %>/project/search" method="get">
                    <div id="search-div" class="input-group">
                        <button id="search-btn" class="btn" type="submit">
                            <img src="<%=contextPath%>/resources/img/search_icon.png" alt="???????????????" id="search-icon">
                        </button>
                        <input class="form-control" type="text" name="searching" placeholder="???????????? ???????????????">
                    </div>
                </form>
                
            </div>
        </header>
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
    <script src="<%=contextPath%>/resources/js/nav_color.js"></script>
</body>
</html>