<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>

        #wrapper{
            border: 1px solid black;
            background-color: #F9F5EA;
        }

        #header{
            border: 1px solid black;
            width: 1194px;
            height: 24px;
            left: 35%;
            top: 100px;
            padding: 20px;

            margin: 0 auto;
            text-align: center;
        }

        a{
            text-decoration: none;
            color: black;
            padding: 10px;
        }

        #content-1{
            border: 1px solid black;
            width: 300px;
        }

        #content-wrap{
            border: 1px solid black;
            width: 30%;

            
        }

        #content-2{
            border: 1px solid black;

        }

        button {
            color: white;
            margin-top: 10px;
            border-radius: 100px;
            background-color: #48CA7D;
            border: 0px
        }

    </style>
</head>
<body>

	<%@ include file="/WEB-INF/views/common/userHeader.jsp" %>

	<div id="wrapper">

        <div id="header">

            <a href="">정보수정</a>
            <a href="">올린프로젝트</a>
            <a href="">나의후원내역</a>
            <a href="">팔로우</a>
            <a href="">쿠폰내역</a>
            <a href="">문의/답변내역</a>

        </div>
            
            <div class="member-info">
                <div id="content-1">

                    <table>
        
                        <tr>
                            <td colspan="2">ㅇㅇㅇ님</td>
                        </tr>
                        <tr>
                            <td colspan="2">친환경몰</td>
                        </tr>
                        <tr>
                            <td>필로우</td>
                            <td>ㅇㅇㅇ명</td>
                        </tr>
                        <tr>
                            <td>팔로워</td>
                            <td>ㅇㅇㅇ명</td>
                        </tr>
                        <tr>
                            <td>추천인 등록 수</td>
                            <td>ㅇㅇㅇ명</td>
                        </tr>
                        <tr>
                            <td colspan="2">goldmarke</td>
                        </tr>
                        <tr>
                            <td>회원등급</td>
                            <td>GOLD</td>
                        </tr>
                        <tr>
                            <td>개인사업자</td>
                            <td>회원</td>
                        </tr>
                        <tr>
                            <td colspan="2"><button>로그아웃</button></td>
                        </tr>
        
                    </table>
        
                </div>

                <div id="contrent-2">

                    <h2>작성한 프로젝트가 없습니다.</h2>

                    <br>

                    <button>프로젝트 올리기</button>

                </div>

            </div>
    </div>

</body>
</html>